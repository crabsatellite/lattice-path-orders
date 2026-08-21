import LatticePathOrdersKernel.ReflectionPairCount

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem tau_eq_self_iff_reverse_isRotated
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hword : Carrier a b word) :
    tau a b word = word ↔ word.reverse ~r word := by
  constructor
  · intro htau
    simpa [htau] using reverse_isRotated_tau a b word
  · intro hreverse
    have htauCarrier := tau_carrier ha hb hword
    have htauWord : tau a b word ~r word :=
      (reverse_isRotated_tau a b word).symm.trans hreverse
    exact (carrier_isRotated_unique ha hb hcoprime
      htauCarrier hword htauWord).symm

theorem reverse_isRotated_iff_reflection_axis
    {n : Nat} (hn : 0 < n) {word : Path} (hlength : word.length = n) :
    word.reverse ~r word ↔
      ∃ axis : Fin n, cyclicReflection word axis.val = word := by
  constructor
  · intro hrot
    rcases rotation_fin_of_isRotated (by
      rw [List.length_reverse, hlength]
      exact hn) hrot with
      ⟨axis, haxis⟩
    let axisN : Fin n := ⟨axis.val, by
      simpa [hlength] using axis.isLt⟩
    exact ⟨axisN, by simpa [cyclicReflection, axisN] using haxis⟩
  · rintro ⟨axis, haxis⟩
    exact ⟨axis.val, haxis⟩

theorem reflectionSymmetric_eq_tauFixed_orbits
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    reflectionSymmetricFinset (a + b) a =
      (tauFixedCarrierFinset a b).biUnion (finRotationOrbit (a + b)) := by
  apply Finset.ext
  intro word
  constructor
  · intro hword
    have hdata := mem_reflectionSymmetricFinset.mp hword
    have hcountU : Path.countU word = b := by
      have htotal := countR_add_countU word
      omega
    rcases unique_admissible_rotation ha hb hcoprime hdata.2.1 hcountU with
      ⟨rotation, hcarrier, _⟩
    let carrierWord := word.rotate rotation.val
    have hrot : word ~r carrierWord := ⟨rotation.val, rfl⟩
    have hwordSym : word.reverse ~r word :=
      (reverse_isRotated_iff_reflection_axis (by omega) hdata.1).mpr
        hdata.2.2
    have hcarrierSym : carrierWord.reverse ~r carrierWord :=
      hrot.reverse.symm.trans (hwordSym.trans hrot)
    have htauFixed : tau a b carrierWord = carrierWord :=
      (tau_eq_self_iff_reverse_isRotated ha hb hcoprime hcarrier).mpr
        hcarrierSym
    have hcarrierLength : carrierWord.length = a + b := carrier_length hcarrier
    rcases rotation_fin_of_isRotated (by rw [hcarrierLength]; omega) hrot.symm with
      ⟨back, hback⟩
    let backN : Fin (a + b) :=
      ⟨back.val, by rw [← hcarrierLength]; exact back.isLt⟩
    apply Finset.mem_biUnion.mpr
    refine ⟨carrierWord, mem_tauFixedCarrierFinset.mpr
      ⟨hcarrier, htauFixed⟩, ?_⟩
    exact mem_finRotationOrbit.mpr ⟨backN, by simpa [backN] using hback⟩
  · intro hword
    rcases Finset.mem_biUnion.mp hword with
      ⟨carrierWord, hfixedMem, hrotation⟩
    have hfixed := mem_tauFixedCarrierFinset.mp hfixedMem
    rcases mem_finRotationOrbit.mp hrotation with ⟨rotation, hwordEq⟩
    have hrot : carrierWord ~r word := ⟨rotation.val, hwordEq⟩
    have hcarrierSym : carrierWord.reverse ~r carrierWord :=
      (tau_eq_self_iff_reverse_isRotated ha hb hcoprime hfixed.1).mp
        hfixed.2
    have hwordSym : word.reverse ~r word :=
      hrot.reverse.symm.trans (hcarrierSym.trans hrot)
    have hperm := hrot.perm
    have hlength : word.length = a + b :=
      hperm.length_eq.symm.trans (carrier_length hfixed.1)
    have hcountR : Path.countR word = a := by
      have hcount := hperm.count Step.R
      change Path.countR carrierWord = Path.countR word at hcount
      exact hcount.symm.trans (carrier_components hfixed.1).1
    apply mem_reflectionSymmetricFinset.mpr
    exact ⟨hlength, hcountR,
      (reverse_isRotated_iff_reflection_axis (by omega) hlength).mp hwordSym⟩

theorem tauFixed_orbits_pairwise_disjoint
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    ((tauFixedCarrierFinset a b : Set Path)).PairwiseDisjoint
      (finRotationOrbit (a + b)) := by
  intro left hleft right hright hne
  change Disjoint (finRotationOrbit (a + b) left)
    (finRotationOrbit (a + b) right)
  rw [Finset.disjoint_left]
  intro word hwordLeft hwordRight
  rcases mem_finRotationOrbit.mp hwordLeft with ⟨leftRotation, hleftRotation⟩
  rcases mem_finRotationOrbit.mp hwordRight with ⟨rightRotation, hrightRotation⟩
  have hleftCarrier := (mem_tauFixedCarrierFinset.mp hleft).1
  have hrightCarrier := (mem_tauFixedCarrierFinset.mp hright).1
  have hleftRot : left ~r word := ⟨leftRotation.val, hleftRotation⟩
  have hrightRot : right ~r word := ⟨rightRotation.val, hrightRotation⟩
  have hleftRight : left ~r right := hleftRot.trans hrightRot.symm
  exact hne ((carrier_isRotated_unique ha hb hcoprime
    hleftCarrier hrightCarrier hleftRight).symm)

theorem tauFixedCarrierCount_mul_total_eq_reflectionPairCount
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    tauFixedCarrierCount a b * (a + b) =
      reflectionPairCount (a + b) a := by
  have hunion := reflectionSymmetric_eq_tauFixed_orbits ha hb hcoprime
  have hsum : (∑ word ∈ tauFixedCarrierFinset a b,
      (finRotationOrbit (a + b) word).card) =
      ∑ _word ∈ tauFixedCarrierFinset a b, (a + b) := by
    apply Finset.sum_congr rfl
    intro word hword
    exact finRotationOrbit_card_of_carrier ha hb hcoprime
      (mem_tauFixedCarrierFinset.mp hword).1
  calc
    tauFixedCarrierCount a b * (a + b) =
        ∑ word ∈ tauFixedCarrierFinset a b,
          (finRotationOrbit (a + b) word).card := by
      rw [hsum]
      simp [tauFixedCarrierCount]
    _ = ((tauFixedCarrierFinset a b).biUnion
          (finRotationOrbit (a + b))).card :=
      (Finset.card_biUnion
        (tauFixed_orbits_pairwise_disjoint ha hb hcoprime)).symm
    _ = (reflectionSymmetricFinset (a + b) a).card :=
      congrArg Finset.card hunion.symm
    _ = reflectionPairCount (a + b) a :=
      (reflectionPairCount_eq_symmetric_card ha hb hcoprime).symm

end LatticePathOrdersKernel
