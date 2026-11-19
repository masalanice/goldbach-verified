# Proof map — frontier

Dependency graph for the ternary-Goldbach stack. The **frontier**
marker (F-n) is what the bot pulls from; a lemma only leaves the
frontier when CI accepts it with no new `sorryAx`.

```
F-1  selbergWeight_divisor_sum      sieve/   ── needs: moebius inversion
F-2  counting_identity (discrete)   circle/  ── needs: F-4
F-3  pratt_cert_sound               certs/   ── needs: euler criterion
F-4  eChar_sum_orthogonality        circle/  ── needs: roots-of-unity sums  ← UP FIRST
F-5  vaughan_decomposition          circle/  ── needs: F-4, dirichlet conv.
F-6  minor_arc_bound (vinogradov)   circle/  ── needs: F-5, bilinear sums
```

Rules: one frontier item per lane-B PR. Blocked items get the
error signature recorded here and are retried only after a
mathlib bump or 
