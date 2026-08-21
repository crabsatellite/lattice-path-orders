#!/usr/bin/env python3
"""Package the public Lean build cache into source-bound release shards."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean4"
CACHE_ROOT = LEAN / ".lake" / "build" / "lib" / "lean"
EXTENSIONS = (".olean", ".ilean", ".trace", ".hash")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(8 * 1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def git_output(*args: str) -> str:
    return subprocess.check_output(
        ["git", *args], cwd=ROOT, text=True, encoding="utf-8"
    ).strip()


def public_cache_files() -> list[tuple[Path, str]]:
    tracked = git_output("ls-files", "lean4/*.lean", "lean4/**/*.lean").splitlines()
    files: list[tuple[Path, str]] = []
    missing: list[str] = []
    for source_name in tracked:
        if source_name == "lean4/lakefile.lean":
            continue
        module_stem = Path(source_name).relative_to("lean4").with_suffix("")
        olean = CACHE_ROOT / module_stem.with_suffix(".olean")
        if not olean.is_file():
            missing.append(module_stem.as_posix())
            continue
        for extension in EXTENSIONS:
            candidate = CACHE_ROOT / module_stem.with_suffix(extension)
            if candidate.is_file():
                files.append((candidate, candidate.relative_to(CACHE_ROOT).as_posix()))
    if missing:
        raise SystemExit(f"missing public OLean caches: {missing[:20]}")
    return sorted(files, key=lambda item: item[1])


def partition(
    files: list[tuple[Path, str]], max_raw_bytes: int
) -> list[list[tuple[Path, str]]]:
    shards: list[list[tuple[Path, str]]] = []
    current: list[tuple[Path, str]] = []
    current_bytes = 0
    for item in files:
        size = item[0].stat().st_size
        if current and current_bytes + size > max_raw_bytes:
            shards.append(current)
            current = []
            current_bytes = 0
        current.append(item)
        current_bytes += size
    if current:
        shards.append(current)
    return shards


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--tag", default="v1.0.0")
    parser.add_argument(
        "--output", type=Path, default=ROOT / "tmp" / "release-cache-v1.0.0"
    )
    parser.add_argument("--max-raw-mb", type=int, default=1400)
    args = parser.parse_args()

    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        raise SystemExit(f"output directory is not empty: {output}")

    files = public_cache_files()
    shards = partition(files, args.max_raw_mb * 1024 * 1024)
    prefix = f"lattice-path-orders-lean-cache-{args.tag}"
    manifest: dict[str, object] = {
        "format": "lattice-path-orders-lean-cache-v1",
        "release_tag": args.tag,
        "source_commit": git_output("rev-parse", "HEAD"),
        "lean_toolchain": (LEAN / "lean-toolchain").read_text(encoding="utf-8").strip(),
        "lake_manifest_sha256": sha256(LEAN / "lake-manifest.json"),
        "publication_root_sha256": sha256(
            LEAN / "LatticePathOrdersKernel" / "KernelPublicationRoot.lean"
        ),
        "cache_target": "lean4/.lake/build/lib/lean",
        "extensions": list(EXTENSIONS),
        "raw_bytes": sum(path.stat().st_size for path, _ in files),
        "file_count": len(files),
        "shards": [],
        "files": [],
    }

    file_records: list[dict[str, object]] = []
    shard_records: list[dict[str, object]] = []
    for index, shard in enumerate(shards, start=1):
        name = f"{prefix}-part-{index:03d}.zip"
        archive = output / name
        raw_size = sum(path.stat().st_size for path, _ in shard)
        with zipfile.ZipFile(
            archive, "w", compression=zipfile.ZIP_DEFLATED,
            compresslevel=1, allowZip64=True
        ) as zipped:
            for path, relative in shard:
                zipped.write(path, relative)
                file_records.append({
                    "path": relative,
                    "size": path.stat().st_size,
                    "sha256": sha256(path),
                    "shard": name,
                })
        shard_records.append({
            "name": name,
            "files": len(shard),
            "raw_bytes": raw_size,
            "bytes": archive.stat().st_size,
            "sha256": sha256(archive),
        })
        print(
            f"[{index}/{len(shards)}] {name}: "
            f"{archive.stat().st_size / 1024**3:.2f} GiB",
            flush=True,
        )

    manifest["shards"] = shard_records
    manifest["files"] = file_records
    manifest_path = output / f"{prefix}-manifest.json"
    manifest_path.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(f"manifest: {manifest_path}")


if __name__ == "__main__":
    main()
