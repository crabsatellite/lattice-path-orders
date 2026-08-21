import LatticePathOrdersKernel.Problem63CoordinateRightSurjective

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Right_coordinate_side_forward :
    ∀ tile : BandTile 26, ∀ corner : CornerIndex,
      gluedRawCoordinate problem63Right ⟨tile, cornerSuccessor corner⟩ ∈
        tableNeighbors problem63RightAlgorithmTable
          (gluedRawCoordinate problem63Right ⟨tile, corner⟩) := by
  decide

theorem problem63Right_coordinate_side_reverse :
    ∀ tile : BandTile 26, ∀ corner : CornerIndex,
      gluedRawCoordinate problem63Right ⟨tile, corner⟩ ∈
        tableNeighbors problem63RightAlgorithmTable
          (gluedRawCoordinate problem63Right
            ⟨tile, cornerSuccessor corner⟩) := by
  decide

theorem problem63Right_coordinate_edge_complete :
    problem63RightAlgorithmTable.Forall fun row =>
      row.2.Forall fun right =>
        TableCoordinateSide (n := 26) problem63Right row.1 right := by
  decide

end LatticePathOrdersKernel
