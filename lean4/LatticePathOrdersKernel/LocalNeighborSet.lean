import LatticePathOrdersKernel.LocalBandWitness

/-! # Closed neighbor sets in the integer square-band strip -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem LocalBandAdj.symm
    {directions : Int → Direction} {left right : LocalBandVertex}
    (h : LocalBandAdj directions left right) :
    LocalBandAdj directions right left := by
  rcases h with h | ⟨i, endpoint, h | h⟩
  · exact Or.inl ⟨h.1.symm, h.2.symm⟩
  · exact Or.inr ⟨i, endpoint, Or.inr ⟨h.1, h.2⟩⟩
  · exact Or.inr ⟨i, endpoint, Or.inl ⟨h.1, h.2⟩⟩

def localBandNeighbors (directions : Int → Direction) :
    LocalBandVertex → Finset LocalBandVertex
  | (i, corner) =>
      if corner = cornerZero then
        match directions i with
        | .right => {(i, cornerOne), (i, cornerThree), (i - 1, cornerOne)}
        | .up => {(i, cornerOne), (i, cornerThree), (i - 1, cornerThree)}
      else if corner = cornerOne then
        match directions i, directions (i + 1) with
        | .right, .right => {(i, cornerZero), (i, cornerTwo), (i + 1, cornerZero)}
        | .right, .up => {(i, cornerZero), (i, cornerTwo)}
        | .up, .right =>
            {(i, cornerZero), (i, cornerTwo), (i - 1, cornerTwo),
              (i + 1, cornerZero)}
        | .up, .up => {(i, cornerZero), (i, cornerTwo), (i - 1, cornerTwo)}
      else if corner = cornerTwo then
        match directions (i + 1) with
        | .right => {(i, cornerOne), (i, cornerThree), (i + 1, cornerThree)}
        | .up => {(i, cornerOne), (i, cornerThree), (i + 1, cornerOne)}
      else
        match directions i, directions (i + 1) with
        | .right, .right => {(i, cornerZero), (i, cornerTwo), (i - 1, cornerTwo)}
        | .right, .up =>
            {(i, cornerZero), (i, cornerTwo), (i - 1, cornerTwo),
              (i + 1, cornerZero)}
        | .up, .right => {(i, cornerZero), (i, cornerTwo)}
        | .up, .up => {(i, cornerZero), (i, cornerTwo), (i + 1, cornerZero)}

theorem mem_localBandNeighbors_of_adj
    (directions : Int → Direction) {left right : LocalBandVertex}
    (h : LocalBandAdj directions left right) :
    right ∈ localBandNeighbors directions left := by
  rw [localBandAdj_iff_witnessedEdge] at h
  rcases h with ⟨witness, hvalid, hleft, hright⟩ |
    ⟨witness, hvalid, hright, hleft⟩
  · rw [hleft, hright]
    cases witness with
    | within i corner =>
        fin_cases corner <;>
          cases hin : directions i <;> cases hout : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, cornerSuccessor,
            hin, hout]
    | rightFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hprev : directions (i - 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hprev]
    | rightTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hnext : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hnext]
    | upFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hnext : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hnext]
    | upTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hprev : directions (i - 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hprev]
  · rw [hleft, hright]
    cases witness with
    | within i corner =>
        fin_cases corner <;>
          cases hin : directions i <;> cases hout : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, cornerSuccessor,
            hin, hout]
    | rightFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighbors, hvalid]
    | rightTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hnext : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hnext]
    | upFalse i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        cases hnext : directions (i + 1) <;>
          simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
            localEdgeWitnessTarget, localBandNeighbors, hvalid, hnext]
    | upTrue i =>
        simp [LocalBandEdgeWitness.Valid] at hvalid
        simp [LocalBandEdgeWitness.Valid, localEdgeWitnessSource,
          localEdgeWitnessTarget, localBandNeighbors, hvalid]

end LatticePathOrdersKernel
