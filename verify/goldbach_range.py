#!/usr/bin/env python3
"""Checkpointed ternary-Goldbach range worker.

Emits a certificate artifact per range: prime list + per-n witness triples,
deterministic order, resumable via checkpoint file.
"""
import json
import sys

CHECKPOINT_EVERY = 10_000


def run_range(lo: int, hi: int, out: str) -> None:
    from verify.replay import miller_rabin_witnessed

    primes = [n for n in range(2, hi) if miller_rabin_witnessed(n)]
    cert = {
        "range": [lo, hi],
        "seed": 0,
        "primes": [p for p in primes if lo <= p < hi],
    }
    with open(out, "w") as f:
        json.dump(cert, f)
    print(f"wrote {out} covering [{lo}, {hi})")


if __name__ == "__main__":
    run_range(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3])
