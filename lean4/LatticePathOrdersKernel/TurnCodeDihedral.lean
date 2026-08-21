import LatticePathOrdersKernel.TurnCodeSymmetry

/-!
# Dihedral turn codes give dihedral path words at a fixed unequal endpoint
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem isRotated_turnCode_recovers_up_to_flip {left right : Path}
    (hleft : 2 ≤ left.length) (hright : 2 ≤ right.length)
    (hlength : left.length = right.length)
    (hcode : closedTurnCode left ~r closedTurnCode right) :
    (left ~r right) ∨ (left.map flipStep ~r right) := by
  rcases hcode with ⟨rotation, hrotation⟩
  have hrotLength : 2 ≤ (left.rotate rotation).length := by simpa
  have hrotCode :
      closedTurnCode (left.rotate rotation) = closedTurnCode right := by
    rw [closedTurnCode_rotate hleft rotation]
    exact hrotation
  rcases closedTurnCode_recovers_up_to_flip hrotLength hright
      (by simpa using hlength) hrotCode with heq | heq
  · exact Or.inl ⟨rotation, heq⟩
  · right
    refine ⟨rotation, ?_⟩
    rw [← List.map_rotate]
    exact heq

theorem dihedral_turnCode_recovers_up_to_flip {left right : Path}
    (hleft : 2 ≤ left.length) (hright : 2 ≤ right.length)
    (hlength : left.length = right.length)
    (hcode : Dihedral (closedTurnCode left) (closedTurnCode right)) :
    Dihedral left right ∨ Dihedral (left.map flipStep) right := by
  rcases hcode with hdirect | hreversed
  · rcases isRotated_turnCode_recovers_up_to_flip hleft hright hlength
      hdirect with h | h
    · exact Or.inl (Or.inl h)
    · exact Or.inr (Or.inl h)
  · have hreverseLength : 2 ≤ left.reverse.length := by simpa
    have hcodeRotate :
        (closedTurnCode left).reverse ~r closedTurnCode left.reverse := by
      refine ⟨1, ?_⟩
      exact (closedTurnCode_reverse hleft).symm
    have hcode' :
        closedTurnCode left.reverse ~r closedTurnCode right :=
      hcodeRotate.symm.trans hreversed
    rcases isRotated_turnCode_recovers_up_to_flip hreverseLength hright
      (by simpa using hlength) hcode' with h | h
    · exact Or.inl (Or.inr h)
    · right
      right
      simpa using h

@[simp] theorem countR_map_flip (word : Path) :
    Path.countR (word.map flipStep) = Path.countU word := by
  induction word with
  | nil => rfl
  | cons step tail ih =>
      cases step <;> simp [Path.countR, Path.countU, flipStep] <;>
        simpa [Path.countR, Path.countU] using ih

@[simp] theorem countU_map_flip (word : Path) :
    Path.countU (word.map flipStep) = Path.countR word := by
  induction word with
  | nil => rfl
  | cons step tail ih =>
      cases step <;> simp [Path.countR, Path.countU, flipStep] <;>
        simpa [Path.countR, Path.countU] using ih

theorem Dihedral.perm {alpha : Type} {left right : List alpha}
    (h : Dihedral left right) : List.Perm left right := by
  rcases h with h | h
  · exact h.perm
  · exact left.reverse_perm.symm.trans h.perm

theorem carrier_turnCode_dihedral_implies_path_dihedral
    {a b : Nat} (hb : 0 < b) (hab : b < a)
    {left right : Path} (hleft : Carrier a b left)
    (hright : Carrier a b right)
    (hcode : Dihedral (closedTurnCode left) (closedTurnCode right)) :
    Dihedral left right := by
  have hlength : left.length = right.length :=
    (carrier_length hleft).trans (carrier_length hright).symm
  have htwo : 2 ≤ a + b := by omega
  have hleftTwo : 2 ≤ left.length := by rw [carrier_length hleft]; exact htwo
  have hrightTwo : 2 ≤ right.length := by rw [carrier_length hright]; exact htwo
  rcases dihedral_turnCode_recovers_up_to_flip hleftTwo hrightTwo hlength hcode with
    h | h
  · exact h
  · exfalso
    have hcount := (Dihedral.perm h).count Step.R
    change Path.countR (left.map flipStep) = Path.countR right at hcount
    rw [countR_map_flip] at hcount
    have hleftCounts := carrier_components hleft
    have hrightCounts := carrier_components hright
    rw [hleftCounts.2.1, hrightCounts.1] at hcount
    omega

end LatticePathOrdersKernel
