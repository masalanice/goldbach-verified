# goldbach-verified

Verified infrastructure toward ternary Goldbach (Helfgott): a
Lean 4 / mathlib formalization of the circle-method and sieve
stack, plus a certified-computation layer whose outputs replay
independently.

Two work lanes, both PR-gated:

- **Formalization** — `GoldbachVerified/`. Every PR must build
  clean, introduce no new `sorry`, and keep `#print axioms`
  free of `sorryAx`. See `PROOFMAP.md` for the frontier queue.
- **Certified computation** — `verify/`. Deterministic range
  workers emit certificates; `replay.py` recomputes and diffs.
  A range only counts if it replays.

The goal is not a headline theorem — it is the layer of
verifiable machinery every approach needs and nobody funds.
