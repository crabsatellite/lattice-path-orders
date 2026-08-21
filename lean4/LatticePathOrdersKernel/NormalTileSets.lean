import LatticePathOrdersKernel.NormalTileMap

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem normalTileVertexSet_vertex_formula
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n) :
    normalTileVertexSet steps (.vertex i) =
      {(i, cornerZero), (i, cornerOne), (i, cornerTwo), (i, cornerThree)} := by
  rw [normalTileVertexSet_eq_four]
  rfl

theorem normalTileVertexSet_midpoint_right
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    (hdir : steps i = .right) :
    normalTileVertexSet steps (.midpoint i) =
      {(i - 1, cornerOne), (i, cornerZero), (i, cornerThree),
        (i - 1, cornerTwo)} := by
  rw [normalTileVertexSet_eq_four]
  simp [normalFourVertexSet, normalTileCorner, normalizedBandPair, rawBandCornerPair,
    normalizeRawBandCorner, hdir]

theorem normalTileVertexSet_midpoint_up
    {n : Nat} (steps : ZMod n → Direction) (i : ZMod n)
    (hdir : steps i = .up) :
    normalTileVertexSet steps (.midpoint i) =
      {(i - 1, cornerThree), (i - 1, cornerTwo), (i, cornerOne),
        (i, cornerZero)} := by
  rw [normalTileVertexSet_eq_four]
  simp [normalFourVertexSet, normalTileCorner, normalizedBandPair, rawBandCornerPair,
    normalizeRawBandCorner, hdir]

end LatticePathOrdersKernel
