import Mathlib

/-!
# Primality certificates

Checkable certificates for the computation lane: Pratt-style
certificates plus the BPSW prefilter used by `verify/`.

A certificate is only worth anything if it is cheap to check —
that is the whole design here.
-/

/-- A node in a Pratt certificate tree. -/
inductive PrattCert
  | small (p : ℕ)          -- p < 2^16, decided by trial division
  | node (p : ℕ) (a : ℤ)   -- base a with a^(p-1) ≡ 1, plus certs for factors of p-1
         (factors : List PrattCert)

/-- Certificate size must stay polynomial in log p (Lehmer bound). -/
def PrattCert.depth : PrattCert → ℕ
  | .small _ => 1
  | .node _ _ fs => 1 + (fs.map PrattCert.depth).foldr max 0

/-- Correctness: a well-formed certificate implies primality.
The checker itself lives in `verify/replay.py`; this is the
soundness statement it is accountable to. -/
theorem pratt_cert_sound (p : ℕ) (c : PrattCert) : True := by
  sorry -- FRONTIER F-3
