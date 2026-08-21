import LatticePathOrdersKernel.CarrierRotationFree

namespace LatticePathOrdersKernel

open LatticePathOrders

def carrierPathFinset (a b : Nat) : Finset Path :=
  (carrierPaths a b).toFinset

theorem mem_carrierPathFinset {a b : Nat} {word : Path} :
    word ∈ carrierPathFinset a b ↔ Carrier a b word := by
  simp [carrierPathFinset, mem_carrierPaths]

theorem balancedPathFinset_eq_carrier_orbits
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    balancedPathFinset (a + b) a =
      (carrierPathFinset a b).biUnion (finRotationOrbit (a + b)) := by
  apply Finset.ext
  intro word
  constructor
  · intro hbalanced
    have hdata := mem_balancedPathFinset.mp hbalanced
    have hcountU : Path.countU word = b := by
      have htotal := countR_add_countU word
      omega
    rcases unique_admissible_rotation ha hb hcoprime hdata.2 hcountU with
      ⟨rotation, hcarrier, _⟩
    let carrierWord := word.rotate rotation.val
    have hcarrierLength : carrierWord.length = a + b := by
      simpa [carrierWord] using hdata.1
    have hrotated : carrierWord ~r word :=
      (show word ~r carrierWord from ⟨rotation.val, rfl⟩).symm
    rcases rotation_fin_of_isRotated (by rw [hcarrierLength]; omega) hrotated with
      ⟨back, hback⟩
    let backN : Fin (a + b) :=
      ⟨back.val, by rw [← hcarrierLength]; exact back.isLt⟩
    apply Finset.mem_biUnion.mpr
    refine ⟨carrierWord, mem_carrierPathFinset.mpr hcarrier, ?_⟩
    exact mem_finRotationOrbit.mpr ⟨backN, by simpa [backN] using hback⟩
  · intro horbit
    rcases Finset.mem_biUnion.mp horbit with ⟨carrierWord, hcarrierMem, hrotation⟩
    have hcarrier := mem_carrierPathFinset.mp hcarrierMem
    rcases mem_finRotationOrbit.mp hrotation with ⟨rotation, hword⟩
    have hrot : carrierWord ~r word := ⟨rotation.val, hword⟩
    have hperm := hrot.perm
    apply mem_balancedPathFinset.mpr
    constructor
    · exact (hperm.length_eq.symm).trans (carrier_length hcarrier)
    · have hcount := hperm.count Step.R
      change Path.countR carrierWord = Path.countR word at hcount
      exact hcount.symm.trans (carrier_components hcarrier).1

theorem carrier_rotation_orbits_pairwise_disjoint
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    ((carrierPathFinset a b : Set Path)).PairwiseDisjoint
      (finRotationOrbit (a + b)) := by
  intro left hleft right hright hne
  change Disjoint (finRotationOrbit (a + b) left)
    (finRotationOrbit (a + b) right)
  rw [Finset.disjoint_left]
  intro word hwordLeft hwordRight
  rcases mem_finRotationOrbit.mp hwordLeft with ⟨leftRotation, hleftRotation⟩
  rcases mem_finRotationOrbit.mp hwordRight with ⟨rightRotation, hrightRotation⟩
  have hleftCarrier := mem_carrierPathFinset.mp hleft
  have hrightCarrier := mem_carrierPathFinset.mp hright
  have hleftRot : left ~r word := ⟨leftRotation.val, hleftRotation⟩
  have hrightRot : right ~r word := ⟨rightRotation.val, hrightRotation⟩
  have hleftRight : left ~r right := hleftRot.trans hrightRot.symm
  exact hne ((carrier_isRotated_unique ha hb hcoprime
    hleftCarrier hrightCarrier hleftRight).symm)

theorem carrierPathFinset_mul_total_eq_choose
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    (carrierPathFinset a b).card * (a + b) = (a + b).choose a := by
  have hunion := balancedPathFinset_eq_carrier_orbits ha hb hcoprime
  have hsum : (∑ word ∈ carrierPathFinset a b,
      (finRotationOrbit (a + b) word).card) =
      ∑ _word ∈ carrierPathFinset a b, (a + b) := by
    apply Finset.sum_congr rfl
    intro word hword
    exact finRotationOrbit_card_of_carrier ha hb hcoprime
      (mem_carrierPathFinset.mp hword)
  calc
    (carrierPathFinset a b).card * (a + b) =
        ∑ word ∈ carrierPathFinset a b,
          (finRotationOrbit (a + b) word).card := by
      rw [hsum]
      simp
    _ = ((carrierPathFinset a b).biUnion
          (finRotationOrbit (a + b))).card :=
      (Finset.card_biUnion
        (carrier_rotation_orbits_pairwise_disjoint ha hb hcoprime)).symm
    _ = (balancedPathFinset (a + b) a).card := congrArg Finset.card hunion.symm
    _ = (a + b).choose a := balancedPathFinset_card _ _

theorem carrierPathFinset_card
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    (carrierPathFinset a b).card = (a + b).choose a / (a + b) := by
  apply (Nat.div_eq_of_eq_mul_left (by omega)
    (carrierPathFinset_mul_total_eq_choose ha hb hcoprime).symm).symm

end LatticePathOrdersKernel
