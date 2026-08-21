import LatticePathOrdersKernel.LocalBandEdge

/-! # Nondependent witnesses for local band edges -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

inductive LocalBandEdgeWitness where
  | within (i : Int) (corner : CornerIndex)
  | rightFalse (i : Int)
  | rightTrue (i : Int)
  | upFalse (i : Int)
  | upTrue (i : Int)

def localEdgeWitnessSource : LocalBandEdgeWitness → LocalBandVertex
  | .within i corner => (i, corner)
  | .rightFalse i => (i - 1, cornerOne)
  | .rightTrue i => (i - 1, cornerTwo)
  | .upFalse i => (i - 1, cornerTwo)
  | .upTrue i => (i - 1, cornerThree)

def localEdgeWitnessTarget : LocalBandEdgeWitness → LocalBandVertex
  | .within i corner => (i, cornerSuccessor corner)
  | .rightFalse i => (i, cornerZero)
  | .rightTrue i => (i, cornerThree)
  | .upFalse i => (i, cornerOne)
  | .upTrue i => (i, cornerZero)

def LocalBandEdgeWitness.Valid (directions : Int → Direction) :
    LocalBandEdgeWitness → Prop
  | .within _ _ => True
  | .rightFalse i | .rightTrue i => directions i = .right
  | .upFalse i | .upTrue i => directions i = .up

def WitnessedLocalBandBaseEdge (directions : Int → Direction)
    (left right : LocalBandVertex) : Prop :=
  ∃ witness, witness.Valid directions ∧
    left = localEdgeWitnessSource witness ∧
    right = localEdgeWitnessTarget witness

def WitnessedLocalBandEdge (directions : Int → Direction)
    (left right : LocalBandVertex) : Prop :=
  WitnessedLocalBandBaseEdge directions left right ∨
    WitnessedLocalBandBaseEdge directions right left

theorem localBandBaseEdge_iff_witnessed
    (directions : Int → Direction) (left right : LocalBandVertex) :
    LocalBandBaseEdge directions left right ↔
      WitnessedLocalBandBaseEdge directions left right := by
  constructor
  · intro h
    cases h with
    | within i corner => exact ⟨.within i corner, trivial, rfl, rfl⟩
    | rightFalse i hdir => exact ⟨.rightFalse i, hdir, rfl, rfl⟩
    | rightTrue i hdir => exact ⟨.rightTrue i, hdir, rfl, rfl⟩
    | upFalse i hdir => exact ⟨.upFalse i, hdir, rfl, rfl⟩
    | upTrue i hdir => exact ⟨.upTrue i, hdir, rfl, rfl⟩
  · rintro ⟨witness, hvalid, rfl, rfl⟩
    cases witness with
    | within i corner => exact .within i corner
    | rightFalse i => exact .rightFalse i hvalid
    | rightTrue i => exact .rightTrue i hvalid
    | upFalse i => exact .upFalse i hvalid
    | upTrue i => exact .upTrue i hvalid

theorem localBandAdj_iff_witnessedEdge
    (directions : Int → Direction) (left right : LocalBandVertex) :
    LocalBandAdj directions left right ↔
      WitnessedLocalBandEdge directions left right := by
  rw [localBandAdj_iff_edge]
  exact or_congr (localBandBaseEdge_iff_witnessed directions left right)
    (localBandBaseEdge_iff_witnessed directions right left)

end LatticePathOrdersKernel
