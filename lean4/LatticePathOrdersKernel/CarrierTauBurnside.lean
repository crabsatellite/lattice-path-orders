import LatticePathOrdersKernel.CarrierTauAction

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem bandClassCount_burnside
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    bandClassCount ha hb hcoprime * 2 =
      (carrierPathFinset a b).card + tauFixedCarrierCount a b := by
  letI := carrierTauAddAction ha hb hcoprime
  let Orbit := Quotient (AddAction.orbitRel (ZMod 2) (CarrierObject a b))
  letI : Fintype Orbit := Fintype.ofFinite Orbit
  let zeroEquiv : ↥(AddAction.fixedBy (CarrierObject a b) (0 : ZMod 2)) ≃
      CarrierObject a b := {
    toFun := fun fixed => fixed.1
    invFun := fun word => ⟨word, by
      change carrierTauVAdd ha hb 0 word = word
      rfl⟩
    left_inv := fun fixed => by cases fixed; rfl
    right_inv := fun word => rfl }
  have hzeroCard : Fintype.card
      ↥(AddAction.fixedBy (CarrierObject a b) (0 : ZMod 2)) =
      (carrierPathFinset a b).card := by
    rw [Fintype.card_congr zeroEquiv, Fintype.card_coe]
  let oneEquiv : ↥(AddAction.fixedBy (CarrierObject a b) (1 : ZMod 2)) ≃
      ↥(tauFixedCarrierFinset a b) := {
    toFun := fun fixed => ⟨fixed.1.1, mem_tauFixedCarrierFinset.mpr
      ⟨mem_carrierPathFinset.mp fixed.1.2, by
        have hfixed := fixed.2
        change carrierTauObject ha hb fixed.1 = fixed.1 at hfixed
        exact congrArg Subtype.val hfixed⟩⟩
    invFun := fun word =>
      ⟨⟨word.1, mem_carrierPathFinset.mpr
          (mem_tauFixedCarrierFinset.mp word.2).1⟩, by
        change carrierTauObject ha hb
          ⟨word.1, mem_carrierPathFinset.mpr
            (mem_tauFixedCarrierFinset.mp word.2).1⟩ = _
        apply Subtype.ext
        exact (mem_tauFixedCarrierFinset.mp word.2).2⟩
    left_inv := fun fixed => by cases fixed; rfl
    right_inv := fun word => by cases word; rfl }
  have honeCard : Fintype.card
      ↥(AddAction.fixedBy (CarrierObject a b) (1 : ZMod 2)) =
      tauFixedCarrierCount a b := by
    rw [Fintype.card_congr oneEquiv, Fintype.card_coe]
    rfl
  have hburnside := AddAction.sum_card_fixedBy_eq_card_orbits_mul_card_addGroup
    (α := ZMod 2) (β := CarrierObject a b)
  have hsum : (∑ g : ZMod 2,
      Fintype.card (AddAction.fixedBy (CarrierObject a b) g)) =
      (carrierPathFinset a b).card + tauFixedCarrierCount a b := by
    rw [← (ZMod.finEquiv 2).toEquiv.sum_comp, Fin.sum_univ_two]
    change Fintype.card (AddAction.fixedBy (CarrierObject a b) (0 : ZMod 2)) +
      Fintype.card (AddAction.fixedBy (CarrierObject a b) (1 : ZMod 2)) = _
    rw [hzeroCard, honeCard]
  rw [hsum] at hburnside
  have hgroupCard : Fintype.card (ZMod 2) = 2 := by simp
  rw [hgroupCard] at hburnside
  change (carrierPathFinset a b).card + tauFixedCarrierCount a b =
    bandClassCount ha hb hcoprime * 2 at hburnside
  exact hburnside.symm

end LatticePathOrdersKernel
