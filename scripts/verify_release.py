#!/usr/bin/env python3
"""Run the bounded independent verification suite used by the manuscript."""

from __future__ import annotations

import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PYTHON = sys.executable


def run(*arguments: str) -> None:
    command = [PYTHON, *arguments]
    print("+", " ".join(command), flush=True)
    subprocess.run(command, cwd=ROOT, check=True)


def main() -> None:
    with tempfile.TemporaryDirectory(prefix="lattice-path-orders-") as directory:
        temporary = Path(directory)
        run("scripts/verify_problem_6_3.py", "--output",
            str(temporary / "problem-6-3.json"))
        run("scripts/verify_subset_expansion.py", "--max-n", "13")
        run("scripts/verify_best_first_levels.py", "--max-total", "19")
        run("scripts/verify_nonlocal_pell.py", "--max-n", "30", "--output",
            str(temporary / "nonlocal-pell.json"))
        run("scripts/verify_nonlocal_family.py", "--max-n", "12", "--output",
            str(temporary / "nonlocal-family.json"))
        for certificate in (
            "data/matching-cover-certificate-5-4.json",
            "data/lagrange-cover-certificate-5-4.json",
            "data/matching-nonlocal-cover-certificate-13-12.json",
        ):
            run("scripts/verify_cover_certificate.py", certificate)
    print("release verification passed", flush=True)


if __name__ == "__main__":
    main()
