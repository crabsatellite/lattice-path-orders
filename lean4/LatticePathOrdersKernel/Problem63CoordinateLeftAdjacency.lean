import LatticePathOrdersKernel.Problem63CoordinateLeftSurjective

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem problem63Left_coordinate_side_forward :
    ∀ tile : BandTile 26, ∀ corner : CornerIndex,
      gluedRawCoordinate problem63Left ⟨tile, cornerSuccessor corner⟩ ∈
        tableNeighbors problem63LeftAlgorithmTable
          (gluedRawCoordinate problem63Left ⟨tile, corner⟩) := by
  decide

theorem problem63Left_coordinate_side_reverse :
    ∀ tile : BandTile 26, ∀ corner : CornerIndex,
      gluedRawCoordinate problem63Left ⟨tile, corner⟩ ∈
        tableNeighbors problem63LeftAlgorithmTable
          (gluedRawCoordinate problem63Left
            ⟨tile, cornerSuccessor corner⟩) := by
  decide

theorem problem63Left_coordinate_edge_complete :
    problem63LeftAlgorithmTable.Forall fun row =>
      row.2.Forall fun right =>
        TableCoordinateSide (n := 26) problem63Left row.1 right := by
  decide

end LatticePathOrdersKernel
