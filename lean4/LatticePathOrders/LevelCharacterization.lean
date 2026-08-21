import LatticePathOrders.CoverCertificate

namespace LatticePathOrders

def RealizedLevel {α : Type*} (carrier : Path → Prop)
    (score : Path → α) (s : α) : Prop :=
  ∃ w, carrier w ∧ score w = s

def ConsecutiveRealizedLevels {α : Type*} [LT α]
    (carrier : Path → Prop) (score : Path → α) (s t : α) : Prop :=
  s < t ∧ ∀ u, RealizedLevel carrier score u → ¬(s < u ∧ u < t)

/-- A scalar pullback cover is exactly a pair of consecutive distinct realized
levels.  Consequently every cover block is complete bipartite between its two
fibres. -/
theorem pullbackCover_iff_consecutive_levels {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {x y : Path}
    (hx : carrier x) (hy : carrier y) :
    PullbackCover carrier score x y ↔
      ConsecutiveRealizedLevels carrier score (score x) (score y) := by
  constructor
  · intro hcover
    refine ⟨hcover.2.2.1, ?_⟩
    rintro u ⟨w, hw, rfl⟩ hbetween
    exact hcover.2.2.2 w hw hbetween
  · intro hlevels
    refine ⟨hx, hy, hlevels.1, ?_⟩
    intro w hw hbetween
    exact hlevels.2 (score w) ⟨w, hw, rfl⟩ hbetween

theorem pullbackCover_complete_bipartite {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {s t : α}
    (hlevels : ConsecutiveRealizedLevels carrier score s t)
    {x y : Path} (hx : carrier x) (hy : carrier y)
    (hs : score x = s) (ht : score y = t) :
    PullbackCover carrier score x y := by
  apply (pullbackCover_iff_consecutive_levels hx hy).2
  simpa [hs, ht] using hlevels

end LatticePathOrders
