import LatticePathOrdersKernel.ReflectionAxisUnique

namespace LatticePathOrdersKernel

open LatticePathOrders

noncomputable def reflectionPairFinset (n r : Nat) :
    Finset (Σ _axis : Fin n, Path) :=
  Finset.univ.sigma fun axis => reflectionFiberFinset n r axis.val

theorem mem_reflectionPairFinset {n r : Nat}
    {pair : Σ _axis : Fin n, Path} :
    pair ∈ reflectionPairFinset n r ↔
      pair.2 ∈ reflectionFiberFinset n r pair.1.val := by
  simp [reflectionPairFinset]

theorem reflectionPairFinset_card (n r : Nat) :
    (reflectionPairFinset n r).card = reflectionPairCount n r := by
  rw [reflectionPairFinset, Finset.card_sigma]
  rfl

noncomputable def reflectionSymmetricFinset (n r : Nat) : Finset Path :=
  (balancedPathFinset n r).filter fun word =>
    ∃ axis : Fin n, cyclicReflection word axis.val = word

theorem mem_reflectionSymmetricFinset {n r : Nat} {word : Path} :
    word ∈ reflectionSymmetricFinset n r ↔
      word.length = n ∧ Path.countR word = r ∧
        ∃ axis : Fin n, cyclicReflection word axis.val = word := by
  simp only [reflectionSymmetricFinset, Finset.mem_filter,
    mem_balancedPathFinset]
  tauto

theorem reflectionPair_projection_image
    (n r : Nat) :
    (reflectionPairFinset n r).image Sigma.snd =
      reflectionSymmetricFinset n r := by
  apply Finset.ext
  intro word
  constructor
  · intro hword
    rcases Finset.mem_image.mp hword with ⟨pair, hpair, rfl⟩
    have hfiber := mem_reflectionFiberFinset.mp
      (mem_reflectionPairFinset.mp hpair)
    exact mem_reflectionSymmetricFinset.mpr
      ⟨hfiber.1, hfiber.2.1, pair.1, hfiber.2.2⟩
  · intro hword
    have hdata := mem_reflectionSymmetricFinset.mp hword
    rcases hdata.2.2 with ⟨axis, haxis⟩
    apply Finset.mem_image.mpr
    refine ⟨⟨axis, word⟩, mem_reflectionPairFinset.mpr ?_, rfl⟩
    exact mem_reflectionFiberFinset.mpr
      ⟨hdata.1, hdata.2.1, haxis⟩

theorem reflectionPair_projection_injOn
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    Set.InjOn Sigma.snd
      (↑(reflectionPairFinset (a + b) a) :
        Set (Σ _axis : Fin (a + b), Path)) := by
  intro left hleft right hright heq
  have hleftData := mem_reflectionFiberFinset.mp
    (mem_reflectionPairFinset.mp hleft)
  have hrightData := mem_reflectionFiberFinset.mp
    (mem_reflectionPairFinset.mp hright)
  have hcountU : Path.countU left.2 = b := by
    have htotal := countR_add_countU left.2
    omega
  have haxis : left.1 = right.1 := by
    apply reflection_axis_unique ha hb hcoprime
      hleftData.1 hleftData.2.1 hcountU hleftData.2.2
    simpa [heq] using hrightData.2.2
  cases left with
  | mk leftAxis leftWord =>
      cases right with
      | mk rightAxis rightWord =>
          simp only at heq haxis
          subst rightAxis
          subst rightWord
          rfl

theorem reflectionPairCount_eq_symmetric_card
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    reflectionPairCount (a + b) a =
      (reflectionSymmetricFinset (a + b) a).card := by
  rw [← reflectionPairFinset_card]
  have hcard := (Finset.card_image_iff.mpr
    (reflectionPair_projection_injOn ha hb hcoprime))
  rw [reflectionPair_projection_image] at hcard
  exact hcard.symm

end LatticePathOrdersKernel
