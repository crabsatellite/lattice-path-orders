import LatticePathOrdersKernel.LocalNeighborSet

/-! # Four fixed neighbor slots at every local band vertex -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def localBandNeighborAt (directions : Int → Direction)
    (vertex : LocalBandVertex) (slot : CornerIndex) : LocalBandVertex :=
  let i := vertex.1
  let corner := vertex.2
  if corner = cornerZero then
    if slot = cornerZero then (i, cornerOne)
    else if slot = cornerOne then (i, cornerThree)
    else if slot = cornerTwo then
      match directions i with
      | .right => (i - 1, cornerOne)
      | .up => (i - 1, cornerThree)
    else (i, cornerOne)
  else if corner = cornerOne then
    if slot = cornerZero then (i, cornerZero)
    else if slot = cornerOne then (i, cornerTwo)
    else if slot = cornerTwo then
      match directions i with
      | .up => (i - 1, cornerTwo)
      | .right => (i, cornerZero)
    else
      match directions (i + 1) with
      | .right => (i + 1, cornerZero)
      | .up => (i, cornerTwo)
  else if corner = cornerTwo then
    if slot = cornerZero then (i, cornerOne)
    else if slot = cornerOne then (i, cornerThree)
    else if slot = cornerTwo then
      match directions (i + 1) with
      | .right => (i + 1, cornerThree)
      | .up => (i + 1, cornerOne)
    else (i, cornerOne)
  else
    if slot = cornerZero then (i, cornerZero)
    else if slot = cornerOne then (i, cornerTwo)
    else if slot = cornerTwo then
      match directions i with
      | .right => (i - 1, cornerTwo)
      | .up => (i, cornerZero)
    else
      match directions (i + 1) with
      | .up => (i + 1, cornerZero)
      | .right => (i, cornerTwo)

theorem exists_localBandNeighborAt_of_adj
    (directions : Int → Direction) {left right : LocalBandVertex}
    (h : LocalBandAdj directions left right) :
    ∃ slot, right = localBandNeighborAt directions left slot := by
  rw [localBandAdj_iff_witnessedEdge] at h
  rcases h with ⟨witness, hvalid, hleft, hright⟩ |
    ⟨witness, hvalid, hright, hleft⟩
  · rw [hleft, hright]
    cases witness with
    | within i corner =>
        fin_cases corner
        · exact ⟨cornerZero, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerOne, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerOne, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerZero, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
    | rightFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerThree, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | rightTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | upFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | upTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerThree, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
  · rw [hleft, hright]
    cases witness with
    | within i corner =>
        fin_cases corner
        · exact ⟨cornerZero, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerZero, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerOne, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
        · exact ⟨cornerOne, by simp [localEdgeWitnessSource,
              localEdgeWitnessTarget, localBandNeighborAt, cornerSuccessor]⟩
    | rightFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | rightTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | upFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩
    | upTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        exact ⟨cornerTwo, by simp [localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighborAt, hvalid]⟩

end LatticePathOrdersKernel
