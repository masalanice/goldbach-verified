#!/usr/bin/env python3
"""Replay a certified verification range and diff against the committed certs.

Usage: python3 verify/replay.py <certs_dir>/<range>.json

Deterministic: fixed seed, fixed order. If the recomputed output differs
from the committed certificate, exit non-zero. That is the entire check.
"""
import json
import sys


def miller_rabin_witnessed(n: int, bases=(2, 3, 5, 7, 11, 13)) -> bool:
    if n < 2:
        return False
    for p in (2, 3, 5, 7, 11, 13):
        if n % p == 0:
            return n == p
    d, s = n - 1, 0
    while d % 2 == 0:
        d //= 2
        s += 1
    for a in bases:
        if a >= n:
            continue
        x = pow(a, d, n)
        if x in (1, n - 1):
            continue
        for _ in range(s - 1):
            x = x * x % n
            if x == n - 1:
                break
        else:
            return False
    return True


def replay(path: str) -> bool:
    with open(path) as f:
        cert = json.load(f)
    lo, hi = cert["range"]
    recorded = cert["primes"]
    recomputed = [n for n in range(lo, hi) if miller_rabin_witnessed(n)]
    if recomputed != recorded:
        print(f"REPLAY MISMATCH in {path}")
        return False
    print(f"OK {path}: {len(recorded)} primes in [{lo}, {hi})")
    return True


if __name__ == "__main__":
    sys.exit(0 if replay(sys.argv[1]) else 1)
