import LatticePathOrders.CoverCertificate

namespace LatticePathOrders

def Carrier (a b : Nat) (w : Path) : Prop := inCarrier a b w = true

instance carrierDecidable (a b : Nat) (w : Path) : Decidable (Carrier a b w) := by
  unfold Carrier
  infer_instance

theorem countR_add_countU (w : Path) :
    Path.countR w + Path.countU w = w.length := by
  induction w with
  | nil => rfl
  | cons step rest ih =>
      cases step <;>
        simpa [Path.countR, Path.countU, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm] using congrArg Nat.succ ih

theorem carrier_components {a b : Nat} {w : Path} (hw : Carrier a b w) :
    Path.countR w = a ∧ Path.countU w = b ∧ prefixFeasible a b w = true := by
  have h := (by simpa [Carrier, inCarrier, Bool.and_eq_true] using hw :
    (Path.countR w = a ∧ Path.countU w = b) ∧ prefixFeasible a b w = true)
  exact ⟨h.1.1, h.1.2, h.2⟩

theorem carrier_length {a b : Nat} {w : Path} (hw : Carrier a b w) :
    w.length = a + b := by
  have hc := carrier_components hw
  rw [← hc.1, ← hc.2.1]
  exact (countR_add_countU w).symm

/-- Extract the rational-Dyck inequality at the next `U` from the literal
Boolean prefix predicate. -/
theorem feasible_nextU {a b : Nat} {p rest : Path}
    (hfeas : prefixFeasible a b (p ++ Step.U :: rest) = true) :
    a * (Path.countU p + 1) ≤ b * Path.countR p := by
  have hall := List.all_eq_true.mp hfeas
  have hk : p.length + 1 ∈ List.range ((p ++ Step.U :: rest).length + 1) := by
    apply List.mem_range.mpr
    simp [List.length_append]
  have hone := hall (p.length + 1) hk
  have htake : (p ++ Step.U :: rest).take (p.length + 1) = p ++ [Step.U] := by
    rw [List.take_append]
    rw [List.take_of_length_le (by omega)]
    simp
  rw [htake] at hone
  simpa [Path.countR, Path.countU] using hone

theorem carrier_starts_R {a b : Nat} (ha : 0 < a) {w : Path}
    (hw : Carrier a b w) : IsPrefix [Step.R] w := by
  have hc := carrier_components hw
  cases w with
  | nil =>
      simp [Path.countR] at hc
      omega
  | cons first rest =>
      cases first with
      | R => exact ⟨rest, rfl⟩
      | U =>
          have hineq := feasible_nextU (p := []) (rest := rest) hc.2.2
          simp [Path.countR, Path.countU] at hineq
          omega

end LatticePathOrders
