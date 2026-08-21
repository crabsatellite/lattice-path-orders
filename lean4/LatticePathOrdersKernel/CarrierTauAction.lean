import LatticePathOrdersKernel.CarrierCount
import Mathlib.GroupTheory.GroupAction.Quotient

namespace LatticePathOrdersKernel

open LatticePathOrders

abbrev CarrierObject (a b : Nat) := ↥(carrierPathFinset a b)

noncomputable def carrierTauObject
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) :
    CarrierObject a b → CarrierObject a b :=
  fun word => ⟨tau a b word.1,
    mem_carrierPathFinset.mpr
      (tau_carrier ha hb (mem_carrierPathFinset.mp word.2))⟩

theorem carrierTauObject_twice
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) (word : CarrierObject a b) :
    carrierTauObject ha hb (carrierTauObject ha hb word) = word := by
  apply Subtype.ext
  exact tau_involution ha hb hcoprime
    (mem_carrierPathFinset.mp word.2)

noncomputable def carrierTauVAdd
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (g : ZMod 2) (word : CarrierObject a b) : CarrierObject a b :=
  if g = 0 then word else carrierTauObject ha hb word

@[reducible] noncomputable def carrierTauAddAction
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    AddAction (ZMod 2) (CarrierObject a b) where
  vadd := carrierTauVAdd ha hb
  zero_vadd word := by
    change carrierTauVAdd ha hb 0 word = word
    simp [carrierTauVAdd]
  add_vadd g h word := by
    change carrierTauVAdd ha hb (g + h) word =
      carrierTauVAdd ha hb g (carrierTauVAdd ha hb h word)
    fin_cases g <;> fin_cases h
    · change word = word
      rfl
    · change carrierTauObject ha hb word = carrierTauObject ha hb word
      rfl
    · change carrierTauObject ha hb word = carrierTauObject ha hb word
      rfl
    · change word = carrierTauObject ha hb (carrierTauObject ha hb word)
      exact (carrierTauObject_twice ha hb hcoprime word).symm

noncomputable def bandClassCount
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) : Nat := by
  letI := carrierTauAddAction ha hb hcoprime
  let Orbit := Quotient (AddAction.orbitRel (ZMod 2) (CarrierObject a b))
  letI : Fintype Orbit := Fintype.ofFinite Orbit
  exact Fintype.card Orbit

noncomputable def tauFixedCarrierFinset (a b : Nat) : Finset Path :=
  (carrierPathFinset a b).filter fun word => tau a b word = word

theorem mem_tauFixedCarrierFinset {a b : Nat} {word : Path} :
    word ∈ tauFixedCarrierFinset a b ↔
      Carrier a b word ∧ tau a b word = word := by
  simp [tauFixedCarrierFinset, mem_carrierPathFinset]

noncomputable def tauFixedCarrierCount (a b : Nat) : Nat :=
  (tauFixedCarrierFinset a b).card

end LatticePathOrdersKernel
