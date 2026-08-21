import LatticePathOrdersKernel.LiteralPathSnakeMatching
import LatticePathOrdersKernel.MatrixBridge
import LatticePathOrders.CoverCertificate

/-!
# Perfect-matching value of the lattice-path snake graph

`sourceSnakePerfectMatching` is the literal edge-selection type of the finite
square snake: a value selects graph edges and the defining predicate checks
that every graph vertex is incident to exactly one selected edge.  The local
tile equivalences in `LatticePathOrdersClassical` reprove the
Canakci--Schiffler recurrence rather than assuming it.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

abbrev sourceSnakePerfectMatching (w : Path) :=
  SourcePathSnakePerfectMatching w

noncomputable def sourceMatchingNumber (w : Path) : Nat :=
  sourcePathSnakeMatchingNumber w

theorem sourceMatchingNumber_eq_matchingScore (w : Path) :
    sourceMatchingNumber w = matchingScore w :=
  sourcePathSnakeMatchingNumber_eq_matchingScore w

theorem sourceMatchingNumber_eq_continuant (w : Path) :
    sourceMatchingNumber w =
      LatticePathOrdersClassical.continuant (adjacencyDigits w) :=
  sourceMatchingNumber_eq_matchingScore w |>.trans
    (matchingScore_eq_continuant w)

theorem pullbackCover_matchingScore_iff_source
    {carrier : Path → Prop} {x y : Path} :
    PullbackCover carrier matchingScore x y ↔
      PullbackCover carrier sourceMatchingNumber x y := by
  simp only [PullbackCover, sourceMatchingNumber_eq_matchingScore]

theorem validCoverCertificate_matchingScore_iff_source
    {carrier : Path → Prop} {x y : Path} {cert : List (PrefixBound Nat)} :
    ValidCoverCertificate carrier matchingScore
        (matchingScore x) (matchingScore y) cert ↔
      ValidCoverCertificate carrier sourceMatchingNumber
        (sourceMatchingNumber x) (sourceMatchingNumber y) cert := by
  simp only [ValidCoverCertificate, PrefixBound.Sound, PrefixBound.Outside,
    sourceMatchingNumber_eq_matchingScore]

end LatticePathOrdersKernel
