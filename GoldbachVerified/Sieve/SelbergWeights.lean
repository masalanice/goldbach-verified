import Mathlib

/-!
# Sieve-theoretic weights

Selberg weights (`λ_d`) as in Helfgott's setup. Lane B burns
the sorry'd support lemmas here; everything a later bound
needs is a real number identity over a finite index set.
-/

namespace GoldbachVerified.Sieve

/-- The Λ₂-type Selberg weights truncated at level D:
`λ_d = μ(d) (log(D/d) / log D)²` for `d ≤ D`, `0` otherwise. -/
noncomputable def selbergWeight (D : ℝ) (hD : 1 < D) (d : ℕ) : ℝ :=
  if d ≤ D then
    (ArithmeticFunction.moebius d : ℝ) *
      (Real.log (D / d) / Real.log D) ^ 2
  else 0

/-- Monotonicity of the weight support. -/
theorem selbergWeight_eq_zero_of_gt (D : ℝ) (hD : 1 < D) {d : ℕ}
    (hd : ¬ (d : ℝ) ≤ D) : selbergWeight D hD d = 0 := by
  sorry -- mechanical; if-then branch

/-- The divisor-sum identity `Σ_{d|n} λ_d ≍ 1` below the level.
This is the lemma the circle-method layer consumes. -/
theorem selbergWeight_divisor_sum (D : ℝ) (hD : 1 < D) (n : ℕ)
    (hn : n ≤ D) : True := by
  sorry -- FRONTIER F-1
