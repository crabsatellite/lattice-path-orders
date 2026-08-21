import LatticePathOrders.MatchingBounds
import LatticePathOrders.PartitionCertificate

namespace LatticePathOrdersKernel

open LatticePathOrders

def matchingBound (total : Nat) (pfx : Path) : PrefixBound Nat where
  pathPrefix := pfx
  lower := matchingLower pfx (total - pfx.length)
  upper := matchingUpper pfx (total - pfx.length)

def matchingCertificate (total : Nat) (frontier : List Path) :
    List (PrefixBound Nat) :=
  frontier.map (matchingBound total)

theorem validMatchingCertificate {a b : Nat} (ha : 0 < a)
    {x y : Path} {frontier : List Path}
    (hpartition : partitionCheck a b frontier (a + b - 1) [Step.R] = true)
    (hnonempty : ∀ p ∈ frontier, p ≠ [])
    (houtside : ∀ p ∈ frontier,
      matchingUpper p (a + b - p.length) ≤ matchingScore x ∨
        matchingScore y ≤ matchingLower p (a + b - p.length)) :
    ValidCoverCertificate (Carrier a b) matchingScore
      (matchingScore x) (matchingScore y)
      (matchingCertificate (a + b) frontier) := by
  refine ⟨?_, ?_, ?_⟩
  · intro w hw
    rcases coversCarrier_of_partitionCheck ha hpartition w hw with
      ⟨p, hp, hpref⟩
    exact ⟨matchingBound (a + b) p,
      List.mem_map.mpr ⟨p, hp, rfl⟩, by simpa [matchingBound] using hpref⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    intro w hw hpref
    simpa [matchingBound] using
      (matching_prefix_bound_sound (hnonempty p hp) hpref (carrier_length hw))
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    simpa [PrefixBound.Outside, matchingBound] using houtside p hp

theorem matchingCover_from_certificate {a b : Nat} (ha : 0 < a)
    {x y : Path} {frontier : List Path}
    (hx : Carrier a b x) (hy : Carrier a b y)
    (hxy : matchingScore x < matchingScore y)
    (hpartition : partitionCheck a b frontier (a + b - 1) [Step.R] = true)
    (hnonempty : ∀ p ∈ frontier, p ≠ [])
    (houtside : ∀ p ∈ frontier,
      matchingUpper p (a + b - p.length) ≤ matchingScore x ∨
        matchingScore y ≤ matchingLower p (a + b - p.length)) :
    PullbackCover (Carrier a b) matchingScore x y := by
  apply pullbackCover_of_certificate hx hy hxy
  exact validMatchingCertificate ha hpartition hnonempty houtside

end LatticePathOrdersKernel
