import LatticePathOrdersKernel.LagrangePrefixBounds
import LatticePathOrdersKernel.MatchingCertificate
import LatticePathOrders.CarrierEnumeration

/-!
# Literal prefix-antichain characterization of all covers

The statements in this file use the exact matching and Lagrange intervals
displayed in the manuscript.  Necessity uses the finite full-leaf antichain;
sufficiency uses the proved prefix bounds.  Thus no cover oracle or unproved
interval input occurs in either direction.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def PathPrefixAntichain (frontier : List Path) : Prop :=
  ∀ p ∈ frontier, ∀ q ∈ frontier, IsPrefix p q → p = q

def FrontierCovers (carrier : Path → Prop) (frontier : List Path) : Prop :=
  ∀ word, carrier word → ∃ p ∈ frontier, IsPrefix p word

theorem carrierPaths_prefixAntichain (a b : Nat) :
    PathPrefixAntichain (carrierPaths a b) := by
  intro p hp q hq hpref
  have hpCarrier := carrierPaths_sound a b p hp
  have hqCarrier := carrierPaths_sound a b q hq
  exact eq_of_prefix_of_eq_length hpref
    ((carrier_length hpCarrier).trans (carrier_length hqCarrier).symm)

theorem carrierPaths_frontierCovers (a b : Nat) :
    FrontierCovers (Carrier a b) (carrierPaths a b) := by
  intro word hword
  exact ⟨word, carrierPaths_complete a b word hword, ⟨[], by simp⟩⟩

theorem carrierPath_ne_nil {a b : Nat} (ha : 0 < a)
    {word : Path} (hword : Carrier a b word) : word ≠ [] := by
  intro hnil
  have hc := carrier_components hword
  simp [hnil, Path.countR] at hc
  omega

theorem matchingBound_sound
    {a b : Nat} {pfx : Path} (hpfx : pfx ≠ []) :
    (matchingBound (a + b) pfx).Sound (Carrier a b) matchingScore := by
  intro word hword hpref
  simpa [matchingBound] using
    matching_prefix_bound_sound hpfx hpref (carrier_length hword)

theorem matchingBound_leaf_exact
    {a b : Nat} {word : Path} (hword : Carrier a b word) :
    (matchingBound (a + b) word).lower = matchingScore word ∧
      (matchingBound (a + b) word).upper = matchingScore word := by
  have hlen := carrier_length hword
  unfold matchingBound matchingLower matchingUpper
  simp only [hlen, Nat.sub_self, Mat2.pow_zero]
  constructor <;> exact congrArg Mat2.a11 (Mat2.mul_one _)

theorem lagrangeBound_leaf_exact
    {a b : Nat} {word : Path} (hword : Carrier a b word) :
    (lagrangeBound (a + b) word).lower = lagrangeSq word ∧
      (lagrangeBound (a + b) word).upper = lagrangeSq word := by
  have hlen := carrier_length hword
  simp [lagrangeBound, lagrangeLower, lagrangeUpper, hlen]

def MatchingFrontierOutside {a b : Nat}
    (x y : Path) (frontier : List Path) : Prop :=
  ∀ p ∈ frontier,
    matchingUpper p (a + b - p.length) ≤ matchingScore x ∨
      matchingScore y ≤ matchingLower p (a + b - p.length)

def LagrangeFrontierOutside {a b : Nat}
    (x y : Path) (frontier : List Path) : Prop :=
  ∀ p ∈ frontier,
    lagrangeUpper (a + b) p ≤ lagrangeSq x ∨
      lagrangeSq y ≤ lagrangeLower (a + b) p

theorem validMatchingFrontier
    {a b : Nat} {x y : Path} {frontier : List Path}
    (hcover : FrontierCovers (Carrier a b) frontier)
    (hnonempty : ∀ p ∈ frontier, p ≠ [])
    (houtside : MatchingFrontierOutside (a := a) (b := b) x y frontier) :
    ValidCoverCertificate (Carrier a b) matchingScore
      (matchingScore x) (matchingScore y)
      (frontier.map (matchingBound (a + b))) := by
  refine ⟨?_, ?_, ?_⟩
  · intro word hword
    rcases hcover word hword with ⟨p, hp, hpref⟩
    exact ⟨matchingBound (a + b) p,
      List.mem_map.mpr ⟨p, hp, rfl⟩, by simpa [matchingBound] using hpref⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    exact matchingBound_sound (hnonempty p hp)
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    simpa [PrefixBound.Outside, matchingBound] using houtside p hp

theorem validLagrangeFrontier
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {x y : Path} {frontier : List Path}
    (hcover : FrontierCovers (Carrier a b) frontier)
    (hnonempty : ∀ p ∈ frontier, p ≠ [])
    (houtside : LagrangeFrontierOutside (a := a) (b := b) x y frontier) :
    ValidCoverCertificate (Carrier a b) lagrangeSq
      (lagrangeSq x) (lagrangeSq y)
      (frontier.map (lagrangeBound (a + b))) := by
  refine ⟨?_, ?_, ?_⟩
  · intro word hword
    rcases hcover word hword with ⟨p, hp, hpref⟩
    exact ⟨lagrangeBound (a + b) p,
      List.mem_map.mpr ⟨p, hp, rfl⟩, by simpa [lagrangeBound] using hpref⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    exact lagrangeBound_sound ha hb (hnonempty p hp)
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    simpa [PrefixBound.Outside, lagrangeBound] using houtside p hp

/-- Matching half of manuscript Proposition `prop:antichain`. -/
theorem matching_cover_iff_prefix_antichain
    {a b : Nat} (ha : 0 < a) {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y)
    (hxy : matchingScore x < matchingScore y) :
    PullbackCover (Carrier a b) matchingScore x y ↔
      ∃ frontier,
        PathPrefixAntichain frontier ∧
        FrontierCovers (Carrier a b) frontier ∧
        (∀ p ∈ frontier, p ≠ []) ∧
        MatchingFrontierOutside (a := a) (b := b) x y frontier := by
  constructor
  · intro hcover
    refine ⟨carrierPaths a b, carrierPaths_prefixAntichain a b,
      carrierPaths_frontierCovers a b, ?_, ?_⟩
    · intro p hp
      exact carrierPath_ne_nil ha (carrierPaths_sound a b p hp)
    · intro p hp
      have hpCarrier := carrierPaths_sound a b p hp
      have hexact := matchingBound_leaf_exact hpCarrier
      by_cases hbelow : matchingScore p ≤ matchingScore x
      · left
        change (matchingBound (a + b) p).upper ≤ matchingScore x
        rw [hexact.2]
        exact hbelow
      · right
        have hxp : matchingScore x < matchingScore p := lt_of_not_ge hbelow
        change matchingScore y ≤ (matchingBound (a + b) p).lower
        rw [hexact.1]
        by_contra hnot
        have hpy : matchingScore p < matchingScore y := lt_of_not_ge hnot
        exact hcover.2.2.2 p hpCarrier ⟨hxp, hpy⟩
  · rintro ⟨frontier, _, hfrontier, hnonempty, houtside⟩
    exact pullbackCover_of_certificate hx hy hxy
      (validMatchingFrontier hfrontier hnonempty houtside)

/-- Lagrange half of manuscript Proposition `prop:antichain`. -/
theorem lagrange_cover_iff_prefix_antichain
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y)
    (hxy : lagrangeSq x < lagrangeSq y) :
    PullbackCover (Carrier a b) lagrangeSq x y ↔
      ∃ frontier,
        PathPrefixAntichain frontier ∧
        FrontierCovers (Carrier a b) frontier ∧
        (∀ p ∈ frontier, p ≠ []) ∧
        LagrangeFrontierOutside (a := a) (b := b) x y frontier := by
  constructor
  · intro hcover
    refine ⟨carrierPaths a b, carrierPaths_prefixAntichain a b,
      carrierPaths_frontierCovers a b, ?_, ?_⟩
    · intro p hp
      exact carrierPath_ne_nil ha (carrierPaths_sound a b p hp)
    · intro p hp
      have hpCarrier := carrierPaths_sound a b p hp
      have hexact := lagrangeBound_leaf_exact hpCarrier
      by_cases hbelow : lagrangeSq p ≤ lagrangeSq x
      · left
        change (lagrangeBound (a + b) p).upper ≤ lagrangeSq x
        rw [hexact.2]
        exact hbelow
      · right
        have hxp : lagrangeSq x < lagrangeSq p := lt_of_not_ge hbelow
        change lagrangeSq y ≤ (lagrangeBound (a + b) p).lower
        rw [hexact.1]
        by_contra hnot
        have hpy : lagrangeSq p < lagrangeSq y := lt_of_not_ge hnot
        exact hcover.2.2.2 p hpCarrier ⟨hxp, hpy⟩
  · rintro ⟨frontier, _, hfrontier, hnonempty, houtside⟩
    exact pullbackCover_of_certificate hx hy hxy
      (validLagrangeFrontier ha hb hfrontier hnonempty houtside)

end LatticePathOrdersKernel
