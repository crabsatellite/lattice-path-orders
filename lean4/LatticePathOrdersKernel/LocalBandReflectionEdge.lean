import LatticePathOrdersKernel.LocalBandReflectionDefs

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem reflectLocalBandBaseEdge
    {directions : Int → Direction} {left right : LocalBandVertex}
    (h : LocalBandBaseEdge directions left right) :
    LocalBandBaseEdge (reflectLocalDirections directions)
        (reflectLocalBandVertex left) (reflectLocalBandVertex right) ∨
      LocalBandBaseEdge (reflectLocalDirections directions)
        (reflectLocalBandVertex right) (reflectLocalBandVertex left) := by
  cases h with
  | within i corner =>
      left
      simpa [reflectLocalBandVertex] using
        (LocalBandBaseEdge.within (directions := reflectLocalDirections directions)
          (-i) (cornerHalfTurn corner))
  | rightFalse i hdir =>
      right
      have hdir' : reflectLocalDirections directions (1 - i) = .right := by
        unfold reflectLocalDirections
        rw [show 1 - (1 - i) = i by ring]
        exact hdir
      simpa [reflectLocalBandVertex, cornerHalfTurn] using
        (LocalBandBaseEdge.rightTrue (directions := reflectLocalDirections directions)
          (1 - i) hdir')
  | rightTrue i hdir =>
      right
      have hdir' : reflectLocalDirections directions (1 - i) = .right := by
        unfold reflectLocalDirections
        rw [show 1 - (1 - i) = i by ring]
        exact hdir
      simpa [reflectLocalBandVertex, cornerHalfTurn] using
        (LocalBandBaseEdge.rightFalse (directions := reflectLocalDirections directions)
          (1 - i) hdir')
  | upFalse i hdir =>
      right
      have hdir' : reflectLocalDirections directions (1 - i) = .up := by
        unfold reflectLocalDirections
        rw [show 1 - (1 - i) = i by ring]
        exact hdir
      simpa [reflectLocalBandVertex, cornerHalfTurn] using
        (LocalBandBaseEdge.upTrue (directions := reflectLocalDirections directions)
          (1 - i) hdir')
  | upTrue i hdir =>
      right
      have hdir' : reflectLocalDirections directions (1 - i) = .up := by
        unfold reflectLocalDirections
        rw [show 1 - (1 - i) = i by ring]
        exact hdir
      simpa [reflectLocalBandVertex, cornerHalfTurn] using
        (LocalBandBaseEdge.upFalse (directions := reflectLocalDirections directions)
          (1 - i) hdir')

theorem reflectLocalBandAdj
    {directions : Int → Direction} {left right : LocalBandVertex}
    (h : LocalBandAdj directions left right) :
    LocalBandAdj (reflectLocalDirections directions)
      (reflectLocalBandVertex left) (reflectLocalBandVertex right) := by
  rw [localBandAdj_iff_edge] at h ⊢
  rcases h with h | h
  · rcases reflectLocalBandBaseEdge h with h | h
    · exact Or.inl h
    · exact Or.inr h
  · rcases reflectLocalBandBaseEdge h with h | h
    · exact Or.inr h
    · exact Or.inl h

theorem localBandAdj_reflect_iff
    (directions : Int → Direction) (left right : LocalBandVertex) :
    LocalBandAdj (reflectLocalDirections directions)
        (reflectLocalBandVertex left) (reflectLocalBandVertex right) ↔
      LocalBandAdj directions left right := by
  constructor
  · intro h
    have hreflect := reflectLocalBandAdj h
    simpa using hreflect
  · exact reflectLocalBandAdj

end LatticePathOrdersKernel
