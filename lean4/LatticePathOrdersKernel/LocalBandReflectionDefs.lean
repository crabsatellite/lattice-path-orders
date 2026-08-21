import LatticePathOrdersKernel.LocalFourCycleCase1

/-! # Half-turn reflection of the integer square band -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def cornerHalfTurn (corner : CornerIndex) : CornerIndex :=
  if corner = cornerZero then cornerTwo
  else if corner = cornerOne then cornerThree
  else if corner = cornerTwo then cornerZero
  else cornerOne

def reflectLocalDirections (directions : Int → Direction) : Int → Direction :=
  fun i => directions (1 - i)

def reflectLocalBandVertex (vertex : LocalBandVertex) : LocalBandVertex :=
  (-vertex.1, cornerHalfTurn vertex.2)

def reflectLocalBandTile : LocalBandTile → LocalBandTile
  | .vertex i => .vertex (-i)
  | .midpoint i => .midpoint (1 - i)

@[simp] theorem cornerHalfTurn_involution (corner : CornerIndex) :
    cornerHalfTurn (cornerHalfTurn corner) = corner := by
  fin_cases corner <;> rfl

theorem cornerHalfTurn_injective : Function.Injective cornerHalfTurn :=
  Function.LeftInverse.injective cornerHalfTurn_involution

@[simp] theorem cornerHalfTurn_successor (corner : CornerIndex) :
    cornerHalfTurn (cornerSuccessor corner) =
      cornerSuccessor (cornerHalfTurn corner) := by
  fin_cases corner <;> rfl

@[simp] theorem reflectLocalDirections_involution (directions : Int → Direction) :
    reflectLocalDirections (reflectLocalDirections directions) = directions := by
  funext i
  unfold reflectLocalDirections
  congr 1
  ring

@[simp] theorem reflectLocalBandVertex_involution (vertex : LocalBandVertex) :
    reflectLocalBandVertex (reflectLocalBandVertex vertex) = vertex := by
  rcases vertex with ⟨i, corner⟩
  simp [reflectLocalBandVertex]

theorem reflectLocalBandVertex_injective :
    Function.Injective reflectLocalBandVertex :=
  Function.LeftInverse.injective reflectLocalBandVertex_involution

@[simp] theorem reflectLocalBandTile_involution (tile : LocalBandTile) :
    reflectLocalBandTile (reflectLocalBandTile tile) = tile := by
  cases tile <;> simp [reflectLocalBandTile] <;> ring

end LatticePathOrdersKernel
