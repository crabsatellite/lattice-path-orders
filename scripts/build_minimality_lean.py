#!/usr/bin/env python3
"""Bounded, resumable OLean builder for the generated minimality closure."""

from __future__ import annotations

import argparse
from concurrent.futures import FIRST_COMPLETED, Future, ThreadPoolExecutor, wait
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
LEAN_ROOT = ROOT / "lean4"
SOURCE_ROOT = LEAN_ROOT / "LatticePathOrders"
OUTPUT_ROOT = LEAN_ROOT / ".lake" / "build" / "lib" / "lean" / "LatticePathOrders"
STATUS = ROOT / "tmp" / "minimality-lean-build-status.json"
PREFIX = "GeneratedMinimality_"
IMPORT_RE = re.compile(r"^import LatticePathOrders\.([A-Za-z0-9_]+)$", re.MULTILINE)
LAKE_ENV_MARKER = "LPO_MINIMALITY_LAKE_ENV"


def reexec_under_lake_env() -> None:
    """Enter the project's Lake environment once for the whole build.

    Running `lake env lean` separately for thousands of bounded modules pays
    Lake's startup cost thousands of times.  Re-executing this builder once
    under `lake env` preserves the exact LEAN_PATH while allowing every worker
    to invoke the same Lean executable directly.
    """
    if os.environ.get(LAKE_ENV_MARKER) == "1":
        return
    environment = os.environ.copy()
    environment[LAKE_ENV_MARKER] = "1"
    result = subprocess.run(
        ["lake", "env", sys.executable, str(Path(__file__).resolve()),
         *sys.argv[1:]],
        cwd=LEAN_ROOT,
        env=environment,
    )
    raise SystemExit(result.returncode)


def source_hash(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def output_for(source: Path) -> Path:
    return OUTPUT_ROOT / f"{source.stem}.olean"


def dependency_outputs(source: Path) -> list[Path]:
    text = source.read_text(encoding="utf-8")
    return [OUTPUT_ROOT / f"{name}.olean" for name in IMPORT_RE.findall(text)]


def dependency_sources(source: Path) -> list[Path]:
    text = source.read_text(encoding="utf-8")
    return [SOURCE_ROOT / f"{name}.lean" for name in IMPORT_RE.findall(text)]


def dependency_source_hashes(source: Path) -> dict[str, str]:
    dependencies = dependency_sources(source)
    missing = [path for path in dependencies if not path.is_file()]
    if missing:
        raise FileNotFoundError(
            f"missing direct dependency sources for {source.name}: {missing}"
        )
    return {path.name: source_hash(path) for path in dependencies}


def legacy_dependencies_compatible(
    source: Path, output: Path, records: dict[str, object]
) -> bool:
    """Safely add fingerprints to a pre-fingerprint cache record."""
    output_time = output.stat().st_mtime_ns
    for dependency_source, dependency_output in zip(
        dependency_sources(source), dependency_outputs(source), strict=True
    ):
        if not dependency_output.is_file():
            return False
        if dependency_source.name.startswith(PREFIX):
            dependency_record = records.get(dependency_source.name)
            if not isinstance(dependency_record, dict):
                return False
            if dependency_record.get("source_sha256") != source_hash(dependency_source):
                return False
            if dependency_record.get("output_size") != dependency_output.stat().st_size:
                return False
        elif dependency_source.stat().st_mtime_ns > output_time:
            return False
    return True


def current(source: Path, records: dict[str, object]) -> bool:
    output = output_for(source)
    record = records.get(source.name)
    if not output.is_file() or not isinstance(record, dict):
        return False
    if record.get("source_sha256") != source_hash(source):
        return False
    if record.get("dependency_source_sha256") != dependency_source_hashes(source):
        return False
    return all(dep.is_file() for dep in dependency_outputs(source))


def adopt_unrecorded_outputs(
    sources: list[Path], records: dict[str, object]
) -> int:
    """Recover completed outputs after an interrupted parent process.

    A worker writes its OLean atomically enough for Lean's `-o` contract, but
    the parent may be interrupted before it records the source hash.  This also
    migrates older records to direct-dependency source fingerprints.  OLean
    mtimes are deliberately not cache keys: recompiling an unchanged producer
    must not invalidate thousands of mathematically unchanged consumers.
    """
    adopted = 0
    for source in sources:
        record = records.get(source.name)
        output = output_for(source)
        dependencies = dependency_outputs(source)
        dependency_hashes = dependency_source_hashes(source)
        if (
            isinstance(record, dict)
            and record.get("source_sha256") == source_hash(source)
            and output.is_file()
            and record.get("output_size") == output.stat().st_size
            and all(dep.is_file() for dep in dependencies)
        ):
            recorded_dependencies = record.get("dependency_source_sha256")
            if recorded_dependencies is None and legacy_dependencies_compatible(
                source, output, records
            ):
                record["dependency_source_sha256"] = dependency_hashes
                adopted += 1
            elif recorded_dependencies != dependency_hashes:
                # A recorded dependency source changed.  Do not adopt: the
                # consumer must be recompiled against the new producer.
                continue
            continue
        if not output.is_file() or not all(dep.is_file() for dep in dependencies):
            continue
        output_time = output.stat().st_mtime_ns
        if source.stat().st_mtime_ns > output_time:
            continue
        if any(dep.stat().st_mtime_ns > output_time for dep in dependencies):
            continue
        records[source.name] = {
            "source_sha256": source_hash(source),
            "dependency_source_sha256": dependency_hashes,
            "elapsed_seconds": "adopted-after-interruption",
            "output_size": output.stat().st_size,
        }
        adopted += 1
    return adopted


def compile_one(source: Path, timeout: int, memory_mb: int) -> dict[str, object]:
    started = time.monotonic()
    output = output_for(source)
    output.parent.mkdir(parents=True, exist_ok=True)
    command = [
        "lean", "--trust=0", "-M", str(memory_mb),
        str(source.relative_to(LEAN_ROOT)),
        "-o", str(output),
    ]
    result = subprocess.run(
        command,
        cwd=LEAN_ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=timeout,
    )
    elapsed = time.monotonic() - started
    if result.returncode != 0:
        raise RuntimeError(
            f"{source.name} failed after {elapsed:.1f}s\n{result.stdout[-12000:]}"
        )
    return {
        "source_sha256": source_hash(source),
        "dependency_source_sha256": dependency_source_hashes(source),
        "elapsed_seconds": round(elapsed, 3),
        "output_size": output.stat().st_size,
    }


def save(records: dict[str, object]) -> None:
    STATUS.parent.mkdir(parents=True, exist_ok=True)
    temporary = STATUS.with_suffix(".tmp")
    temporary.write_text(json.dumps(records, indent=2, sort_keys=True) + "\n",
                         encoding="utf-8")
    temporary.replace(STATUS)


def build_stage(
    label: str,
    sources: list[Path],
    workers: int,
    timeout: int,
    memory_mb: int,
    records: dict[str, object],
) -> None:
    pending_sources = [source for source in sources if not current(source, records)]
    print(f"[{label}] {len(sources) - len(pending_sources)} cached, "
          f"{len(pending_sources)} pending", flush=True)
    if not pending_sources:
        return
    active_workers = min(workers, len(pending_sources))
    # `memory_mb * workers` is the fixed aggregate Lean budget computed by
    # `main`.  Give a stage with fewer live jobs the unused shares without
    # raising that aggregate: in particular the one-file root stage receives
    # the full 30 GB Lean allowance under the 32 GB process budget.
    stage_memory_mb = (memory_mb * workers) // active_workers
    if active_workers != workers:
        print(
            f"[{label}] {active_workers} active worker(s), "
            f"{stage_memory_mb} MB per Lean worker",
            flush=True,
        )
    completed = 0
    with ThreadPoolExecutor(max_workers=active_workers) as pool:
        active: dict[Future[dict[str, object]], Path] = {}
        iterator = iter(pending_sources)
        for _ in range(active_workers):
            try:
                source = next(iterator)
            except StopIteration:
                break
            active[pool.submit(
                compile_one, source, timeout, stage_memory_mb
            )] = source
        while active:
            done, _ = wait(active, return_when=FIRST_COMPLETED)
            for future in done:
                source = active.pop(future)
                records[source.name] = future.result()
                completed += 1
                save(records)
                print(f"[{label}] {completed}/{len(pending_sources)} {source.name} "
                      f"({records[source.name]['elapsed_seconds']}s)", flush=True)
                try:
                    next_source = next(iterator)
                except StopIteration:
                    continue
                active[pool.submit(
                    compile_one, next_source, timeout, stage_memory_mb
                )] = next_source


def main() -> None:
    reexec_under_lake_env()
    parser = argparse.ArgumentParser()
    parser.add_argument("--workers", type=int, default=3)
    parser.add_argument("--timeout-seconds", type=int, default=1800)
    parser.add_argument(
        "--memory-cap-mb", type=int, default=32000,
        help="aggregate builder memory budget; 2000 MB is reserved for drivers",
    )
    parser.add_argument(
        "--stage", choices=("data", "parts", "endpoints", "root", "all"),
        default="all",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 4:
        raise ValueError("workers must be between 1 and 4 for the shared host")
    driver_reserve_mb = 2000
    if args.memory_cap_mb <= driver_reserve_mb + 1024 * args.workers:
        raise ValueError("memory cap leaves less than 1024 MB per Lean worker")
    worker_memory_mb = (
        args.memory_cap_mb - driver_reserve_mb
    ) // args.workers
    print(
        f"[memory] aggregate cap {args.memory_cap_mb} MB; "
        f"{worker_memory_mb} MB per Lean worker; "
        f"{driver_reserve_mb} MB driver reserve",
        flush=True,
    )

    records: dict[str, object] = {}
    if STATUS.is_file():
        records = json.loads(STATUS.read_text(encoding="utf-8"))

    generated = sorted(SOURCE_ROOT.glob(f"{PREFIX}*.lean"))
    root_source = SOURCE_ROOT / "GeneratedMinimalityCertificate.lean"
    class_chunks = [path for path in generated if "_ClassChunk" in path.stem]
    class_merges: dict[int, list[Path]] = {}
    for path in generated:
        match = re.search(r"_ClassMerge(\d+)_", path.stem)
        if match:
            class_merges.setdefault(int(match.group(1)), []).append(path)
    data = [path for path in generated if path.stem.endswith("_Data")]
    parts = [path for path in generated if "_Part" in path.stem]
    groups = [path for path in generated if "_Group" in path.stem]
    frontiers = [path for path in generated if path.stem.endswith("_Frontier")]
    endpoints = [
        path for path in generated
        if path != root_source and not path.stem.endswith("_Data")
        and "_Part" not in path.stem and "_Group" not in path.stem
        and "_Class" not in path.stem and not path.stem.endswith("_Frontier")
    ]

    adopted = adopt_unrecorded_outputs(
        [*class_chunks, *(path for level in class_merges.values() for path in level),
         *data, *parts, *groups, *frontiers, *endpoints, root_source], records
    )
    if adopted:
        save(records)
        print(f"[recovery] adopted {adopted} complete unrecorded OLean files",
              flush=True)

    subprocess.run(
        ["lake", "build", "LatticePathOrders.MinimalityPartitionTree",
         "LatticePathOrders.ReferenceGate"],
        cwd=LEAN_ROOT, check=True,
    )
    if args.stage in ("all", "data"):
        build_stage(
            "class-chunks", class_chunks, args.workers, args.timeout_seconds,
            worker_memory_mb, records,
        )
        for level in sorted(class_merges):
            build_stage(
                f"class-merge-{level:02d}", sorted(class_merges[level]),
                args.workers, args.timeout_seconds, worker_memory_mb, records,
            )
        build_stage(
            "data", data, args.workers, args.timeout_seconds,
            worker_memory_mb, records,
        )
    if args.stage in ("all", "parts"):
        build_stage(
            "parts", parts, args.workers, args.timeout_seconds,
            worker_memory_mb, records,
        )
        build_stage(
            "groups", groups, args.workers, args.timeout_seconds,
            worker_memory_mb, records,
        )
    for label, sources in (("endpoints", endpoints), ("root", [root_source])):
        if args.stage in ("all", label):
            if label == "endpoints":
                # The largest compact frontiers and their endpoint summaries
                # need more than a 10 GB share.  They are independent only
                # across endpoints, so serialize this final aggregation layer
                # and give its one Lean process the full 30 GB allowance.
                aggregate_lean_mb = worker_memory_mb * args.workers
                build_stage(
                    "frontiers", frontiers, 1, args.timeout_seconds,
                    aggregate_lean_mb, records,
                )
                build_stage(
                    label, sources, 1, args.timeout_seconds,
                    aggregate_lean_mb, records,
                )
            else:
                build_stage(
                    label, sources, args.workers, args.timeout_seconds,
                    worker_memory_mb, records,
                )
    print("[minimality-build:ok] generated OLean closure is current", flush=True)


if __name__ == "__main__":
    main()
