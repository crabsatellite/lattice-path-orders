import LatticePathOrdersKernel.Problem63CoordinateLeftAdjacency
import LatticePathOrdersKernel.Problem63CoordinateRightAdjacency

/-! # Kernel-checked coordinate presentations for the Problem 6.3 pair -/

namespace LatticePathOrdersKernel

def problem63LeftBandCoordinateCertificate :
    BandCoordinateCertificate 26 problem63Left
      problem63LeftAlgorithmTable where
  raw_vertex := problem63Left_coordinate_raw_vertex
  glue_preserves := problem63Left_coordinate_glue_preserves
  coordinate_complete := problem63Left_coordinate_complete
  raw_surjective point hpoint :=
    List.forall_iff_forall_mem.mp
      problem63Left_coordinate_surjective_list point hpoint
  side_forward := problem63Left_coordinate_side_forward
  side_reverse := problem63Left_coordinate_side_reverse
  edge_complete := problem63Left_coordinate_edge_complete
  valid := problem63Left_explicit_table_valid

def problem63RightBandCoordinateCertificate :
    BandCoordinateCertificate 26 problem63Right
      problem63RightAlgorithmTable where
  raw_vertex := problem63Right_coordinate_raw_vertex
  glue_preserves := problem63Right_coordinate_glue_preserves
  coordinate_complete := problem63Right_coordinate_complete
  raw_surjective point hpoint :=
    List.forall_iff_forall_mem.mp
      problem63Right_coordinate_surjective_list point hpoint
  side_forward := problem63Right_coordinate_side_forward
  side_reverse := problem63Right_coordinate_side_reverse
  edge_complete := problem63Right_coordinate_edge_complete
  valid := problem63Right_explicit_table_valid

end LatticePathOrdersKernel
