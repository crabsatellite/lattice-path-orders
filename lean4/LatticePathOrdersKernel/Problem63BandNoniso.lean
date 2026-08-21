import LatticePathOrdersKernel.Problem63GraphLeftProfile
import LatticePathOrdersKernel.Problem63GraphRightProfile
import LatticePathOrdersKernel.Problem63CoordinateCertificates

namespace LatticePathOrdersKernel

def SourceBandIso (x y : LatticePathOrders.Path) : Prop :=
  Nonempty (NeighborTableIso (literalBandTable x) (literalBandTable y))

theorem problem63_literal_band_noniso :
    ¬ SourceBandIso problem63Left problem63Right := by
  intro e
  rcases e with ⟨e⟩
  have hinvariant := hasDegreeWalkProfile_iff e
    problem63Left_literal_table_valid
    problem63Right_literal_table_valid 2 4 4
  apply problem63Left_no_profile_four
  exact hinvariant.mpr problem63Right_has_profile_four

theorem problem63_pathBandIso_implies_sourceBandIso :
    PathBandIso 26 problem63Left problem63Right →
      SourceBandIso problem63Left problem63Right := by
  rintro ⟨iso⟩
  let tableIso := bandGraphIsoToTableGraphIso
    problem63LeftBandCoordinateCertificate
    problem63RightBandCoordinateCertificate iso
  let neighborIso := tableIso.toNeighborTableIso
    problem63Left_explicit_table_valid
    problem63Right_explicit_table_valid
  refine ⟨?_⟩
  rw [problem63Left_literal_table_eq_explicit,
    problem63Right_literal_table_eq_explicit]
  exact neighborIso

theorem problem63_path_band_noniso :
    ¬ PathBandIso 26 problem63Left problem63Right := by
  intro h
  exact problem63_literal_band_noniso
    (problem63_pathBandIso_implies_sourceBandIso h)

end LatticePathOrdersKernel
