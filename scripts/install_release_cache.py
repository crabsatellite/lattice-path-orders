#!/usr/bin/env python3
"""Verify and install source-bound Lean cache shards from a GitHub release."""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import subprocess
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean4"
TARGET = LEAN / ".lake" / "build" / "lib" / "lean"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(8 * 1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def safe_target(relative: str) -> Path:
    candidate = (TARGET / relative).resolve()
    root = TARGET.resolve()
    if candidate != root and root not in candidate.parents:
        raise SystemExit(f"unsafe cache path: {relative}")
    return candidate


def current_commit() -> str | None:
    try:
        return subprocess.check_output(
            ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True,
            encoding="utf-8", stderr=subprocess.DEVNULL
        ).strip()
    except subprocess.CalledProcessError:
        return None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--asset-dir", type=Path, required=True)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--skip-commit-check", action="store_true")
    args = parser.parse_args()

    asset_dir = args.asset_dir.resolve()
    if args.manifest:
        manifest_path = args.manifest.resolve()
    else:
        manifests = sorted(asset_dir.glob("*-manifest.json"))
        if len(manifests) != 1:
            raise SystemExit(
                f"expected one manifest in {asset_dir}, found {len(manifests)}"
            )
        manifest_path = manifests[0]
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest.get("format") != "lattice-path-orders-lean-cache-v1":
        raise SystemExit("unsupported cache manifest format")

    commit = current_commit()
    expected_commit = manifest["source_commit"]
    if not args.skip_commit_check and commit != expected_commit:
        raise SystemExit(f"commit mismatch: checkout={commit}, cache={expected_commit}")
    toolchain = (LEAN / "lean-toolchain").read_text(encoding="utf-8").strip()
    if toolchain != manifest["lean_toolchain"]:
        raise SystemExit(
            f"Lean toolchain mismatch: checkout={toolchain}, "
            f"cache={manifest['lean_toolchain']}"
        )

    shard_paths: dict[str, Path] = {}
    for shard in manifest["shards"]:
        path = asset_dir / shard["name"]
        if not path.is_file():
            raise SystemExit(f"missing shard: {path}")
        if path.stat().st_size != shard["bytes"] or sha256(path) != shard["sha256"]:
            raise SystemExit(f"shard integrity failure: {path}")
        shard_paths[shard["name"]] = path
    print(f"verified {len(shard_paths)} cache shards")
    if args.verify_only:
        return

    TARGET.mkdir(parents=True, exist_ok=True)
    for name, archive in shard_paths.items():
        with zipfile.ZipFile(archive) as zipped:
            for info in zipped.infolist():
                target = safe_target(info.filename)
                target.parent.mkdir(parents=True, exist_ok=True)
                with zipped.open(info) as source, target.open("wb") as destination:
                    shutil.copyfileobj(source, destination, length=8 * 1024 * 1024)
        print(f"installed {name}")

    for record in manifest["files"]:
        path = safe_target(record["path"])
        if path.stat().st_size != record["size"] or sha256(path) != record["sha256"]:
            raise SystemExit(f"installed cache integrity failure: {path}")
    print(
        f"cache install verified: {manifest['file_count']} files for "
        f"{manifest['source_commit']}"
    )


if __name__ == "__main__":
    main()
