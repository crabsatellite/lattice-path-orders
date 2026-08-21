import LatticePathOrdersKernel.MatchingCertificate

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- SHA-256 `2c88960016cf6cf0c81e98fa09a6ba332523d9c2cc932451f17f847c5663ac48` of `data/matching-cover-certificate-5-4.json`. -/
def matching54JsonCertificate : List (PrefixBound Nat) := [
  { pathPrefix := mustParsePath "RRURUR", lower := 985, upper := 1142 },
  { pathPrefix := mustParsePath "RRURRUUR", lower := 1103, upper := 1103 },
  { pathPrefix := mustParsePath "RRURRUR", lower := 1045, upper := 1120 },
  { pathPrefix := mustParsePath "RRURRRU", lower := 1130, upper := 1205 },
  { pathPrefix := mustParsePath "RRRUURU", lower := 1115, upper := 1195 },
  { pathPrefix := mustParsePath "RRRUURRU", lower := 1177, upper := 1177 },
  { pathPrefix := mustParsePath "RRRURUUR", lower := 1117, upper := 1117 },
  { pathPrefix := mustParsePath "RRRURUR", lower := 1055, upper := 1130 },
  { pathPrefix := mustParsePath "RRRURRU", lower := 1120, upper := 1195 },
  { pathPrefix := mustParsePath "RRRRUU", lower := 1207, upper := 1429 },
  { pathPrefix := mustParsePath "RRRRURUU", lower := 1223, upper := 1223 },
  { pathPrefix := mustParsePath "RRRRR", lower := 1238, upper := 1597 }
]

def matching54Frontier : List Path :=
  matching54JsonCertificate.map PrefixBound.pathPrefix

def matching54Lower : Path := mustParsePath "RRURRRUUU"
def matching54Upper : Path := mustParsePath "RRRRUURUU"

theorem matching54_json_bounds_exact :
    matching54JsonCertificate = matchingCertificate 9 matching54Frontier := by
  decide

theorem matching54_endpoint_data :
    Carrier 5 4 matching54Lower ∧ Carrier 5 4 matching54Upper ∧
      matchingScore matching54Lower = 1205 ∧
      matchingScore matching54Upper = 1207 := by
  decide

theorem matching54_partition :
    partitionCheck 5 4 matching54Frontier (9 - 1) [Step.R] = true := by
  decide

theorem matching54_nonempty : ∀ p ∈ matching54Frontier, p ≠ [] := by
  intro p hp
  simp only [matching54Frontier, matching54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem matching54_outside : ∀ p ∈ matching54Frontier,
    matchingUpper p (9 - p.length) ≤ matchingScore matching54Lower ∨
      matchingScore matching54Upper ≤ matchingLower p (9 - p.length) := by
  intro p hp
  simp only [matching54Frontier, matching54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem matching54_json_certificate_valid :
    ValidCoverCertificate (Carrier 5 4) matchingScore
      (matchingScore matching54Lower) (matchingScore matching54Upper)
      matching54JsonCertificate := by
  rw [matching54_json_bounds_exact]
  exact validMatchingCertificate (a := 5) (b := 4) (by decide)
    matching54_partition matching54_nonempty matching54_outside

theorem matching54_matrix_cover :
    PullbackCover (Carrier 5 4) matchingScore matching54Lower matching54Upper := by
  apply matchingCover_from_certificate (a := 5) (b := 4) (by decide)
    matching54_endpoint_data.1 matching54_endpoint_data.2.1 (by decide)
    matching54_partition matching54_nonempty matching54_outside

end LatticePathOrdersKernel

