import LatticePathOrdersKernel.Lagrange54Score00
import LatticePathOrdersKernel.Lagrange54Score01
import LatticePathOrdersKernel.Lagrange54Score02
import LatticePathOrdersKernel.Lagrange54Score03
import LatticePathOrdersKernel.Lagrange54Score04
import LatticePathOrdersKernel.Lagrange54Score05
import LatticePathOrdersKernel.Lagrange54Score06
import LatticePathOrdersKernel.Lagrange54Score07
import LatticePathOrdersKernel.Lagrange54Score08
import LatticePathOrdersKernel.Lagrange54Score09
import LatticePathOrdersKernel.Lagrange54Score10
import LatticePathOrdersKernel.Lagrange54Score11
import LatticePathOrdersKernel.Lagrange54Score12
import LatticePathOrdersKernel.Lagrange54Score13

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem lagrange54_json_bounds_exact :
    lagrange54JsonCertificate = lagrangeCertificate 9 lagrange54Frontier := by
  simp only [lagrange54JsonCertificate, lagrange54Frontier, lagrangeCertificate,
    List.map_cons, List.map_nil, PrefixBound.pathPrefix,
    lagrange54_score_00_bound, lagrange54_score_01_bound, lagrange54_score_02_bound, lagrange54_score_03_bound, lagrange54_score_04_bound, lagrange54_score_05_bound, lagrange54_score_06_bound, lagrange54_score_07_bound, lagrange54_score_08_bound, lagrange54_score_09_bound, lagrange54_score_10_bound, lagrange54_score_11_bound, lagrange54_score_12_bound, lagrange54_score_13_bound]

theorem lagrange54_json_exact_leaf :
    lagrange54JsonCertificate =
      lagrange54Frontier.map (exactBound lagrangeSq) := by
  simp only [lagrange54JsonCertificate, lagrange54Frontier, List.map_cons,
    List.map_nil, PrefixBound.pathPrefix,
    lagrange54_score_00_exact, lagrange54_score_01_exact, lagrange54_score_02_exact, lagrange54_score_03_exact, lagrange54_score_04_exact, lagrange54_score_05_exact, lagrange54_score_06_exact, lagrange54_score_07_exact, lagrange54_score_08_exact, lagrange54_score_09_exact, lagrange54_score_10_exact, lagrange54_score_11_exact, lagrange54_score_12_exact, lagrange54_score_13_exact]

theorem lagrange54_endpoint_data :
    Carrier 5 4 lagrange54Lower ∧ Carrier 5 4 lagrange54Upper ∧
      lagrangeSq lagrange54Lower = ((14953685 : Rat) / (1456849 : Rat)) ∧
      lagrangeSq lagrange54Upper = ((14861021 : Rat) / (1428025 : Rat)) := by
  refine ⟨by decide, by decide, ?_, ?_⟩
  · simpa [lagrange54Lower] using lagrange54_score_11
  · simpa [lagrange54Upper] using lagrange54_score_04

theorem lagrange54_compressed_partition :
    partitionCheck 5 4 lagrange54Frontier (9 - 1) [Step.R] = true := by
  decide

theorem lagrange54_compressed_nonempty : ∀ p ∈ lagrange54Frontier, p ≠ [] := by
  intro p hp
  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem lagrange54_compressed_length : ∀ p ∈ lagrange54Frontier, p.length = 9 := by
  intro p hp
  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem lagrange54_compressed_outside : ∀ p ∈ lagrange54Frontier,
    lagrangeUpper 9 p ≤ lagrangeSq lagrange54Lower ∨
      lagrangeSq lagrange54Upper ≤ lagrangeLower 9 p := by
  intro p hp
  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [lagrange54Lower, lagrange54Upper, lagrange54_score_00, lagrange54_score_00_length, lagrange54_score_01, lagrange54_score_01_length, lagrange54_score_02, lagrange54_score_02_length, lagrange54_score_03, lagrange54_score_03_length, lagrange54_score_04, lagrange54_score_04_length, lagrange54_score_05, lagrange54_score_05_length, lagrange54_score_06, lagrange54_score_06_length, lagrange54_score_07, lagrange54_score_07_length, lagrange54_score_08, lagrange54_score_08_length, lagrange54_score_09, lagrange54_score_09_length, lagrange54_score_10, lagrange54_score_10_length, lagrange54_score_11, lagrange54_score_11_length, lagrange54_score_12, lagrange54_score_12_length, lagrange54_score_13, lagrange54_score_13_length, lagrange54_score_00_lower, lagrange54_score_01_lower, lagrange54_score_02_lower, lagrange54_score_03_lower, lagrange54_score_04_lower, lagrange54_score_05_lower, lagrange54_score_06_lower, lagrange54_score_07_lower, lagrange54_score_08_lower, lagrange54_score_09_lower, lagrange54_score_10_lower, lagrange54_score_11_lower, lagrange54_score_12_lower, lagrange54_score_13_lower, lagrange54_score_00_upper, lagrange54_score_01_upper, lagrange54_score_02_upper, lagrange54_score_03_upper, lagrange54_score_04_upper, lagrange54_score_05_upper, lagrange54_score_06_upper, lagrange54_score_07_upper, lagrange54_score_08_upper, lagrange54_score_09_upper, lagrange54_score_10_upper, lagrange54_score_11_upper, lagrange54_score_12_upper, lagrange54_score_13_upper] <;>
    norm_num

theorem lagrange54_compressed_score_outside : ∀ p ∈ lagrange54Frontier,
    lagrangeSq p ≤ lagrangeSq lagrange54Lower ∨
      lagrangeSq lagrange54Upper ≤ lagrangeSq p := by
  intro p hp
  simp only [lagrange54Frontier, lagrange54JsonCertificate, List.map_cons, List.map_nil,
    List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [lagrange54Lower, lagrange54Upper, lagrange54_score_00, lagrange54_score_00_length, lagrange54_score_01, lagrange54_score_01_length, lagrange54_score_02, lagrange54_score_02_length, lagrange54_score_03, lagrange54_score_03_length, lagrange54_score_04, lagrange54_score_04_length, lagrange54_score_05, lagrange54_score_05_length, lagrange54_score_06, lagrange54_score_06_length, lagrange54_score_07, lagrange54_score_07_length, lagrange54_score_08, lagrange54_score_08_length, lagrange54_score_09, lagrange54_score_09_length, lagrange54_score_10, lagrange54_score_10_length, lagrange54_score_11, lagrange54_score_11_length, lagrange54_score_12, lagrange54_score_12_length, lagrange54_score_13, lagrange54_score_13_length] <;>
    norm_num

theorem lagrange54_json_certificate_valid :
    ValidCoverCertificate (Carrier 5 4) lagrangeSq
      (lagrangeSq lagrange54Lower) (lagrangeSq lagrange54Upper)
      lagrange54JsonCertificate := by
  rw [lagrange54_json_exact_leaf]
  exact validExactLeafCertificate lagrange54Frontier
    (coversCarrier_of_partitionCheck (a := 5) (b := 4) (by decide)
      lagrange54_compressed_partition)
    (fun _ hw => carrier_length hw) lagrange54_compressed_length
    lagrange54_compressed_score_outside

theorem lagrange54_leaf_partition :
    partitionCheck 5 4 lagrange54Leaves (9 - 1) [Step.R] = true := by
  decide

theorem lagrange54_leaf_length : ∀ p ∈ lagrange54Leaves, p.length = 9 := by
  intro p hp
  simp only [lagrange54Leaves, List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem lagrange54_leaf_outside : ∀ p ∈ lagrange54Leaves,
    lagrangeSq p ≤ lagrangeSq lagrange54Lower ∨
      lagrangeSq lagrange54Upper ≤ lagrangeSq p := by
  intro p hp
  simp only [lagrange54Leaves, List.mem_cons, List.mem_nil_iff, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [lagrange54Lower, lagrange54Upper, lagrange54_score_00, lagrange54_score_00_length, lagrange54_score_01, lagrange54_score_01_length, lagrange54_score_02, lagrange54_score_02_length, lagrange54_score_03, lagrange54_score_03_length, lagrange54_score_04, lagrange54_score_04_length, lagrange54_score_05, lagrange54_score_05_length, lagrange54_score_06, lagrange54_score_06_length, lagrange54_score_07, lagrange54_score_07_length, lagrange54_score_08, lagrange54_score_08_length, lagrange54_score_09, lagrange54_score_09_length, lagrange54_score_10, lagrange54_score_10_length, lagrange54_score_11, lagrange54_score_11_length, lagrange54_score_12, lagrange54_score_12_length, lagrange54_score_13, lagrange54_score_13_length] <;>
    norm_num

theorem lagrange54_leaf_replay_cover :
    PullbackCover (Carrier 5 4) lagrangeSq lagrange54Lower lagrange54Upper := by
  apply pullbackCover_of_leaf_partition lagrange54Leaves
    lagrange54_endpoint_data.1 lagrange54_endpoint_data.2.1 (by
      rw [lagrange54_endpoint_data.2.2.1, lagrange54_endpoint_data.2.2.2]
      norm_num)
    (coversCarrier_of_partitionCheck (a := 5) (b := 4) (by decide) lagrange54_leaf_partition)
    (fun _ hw => carrier_length hw) lagrange54_leaf_length lagrange54_leaf_outside

theorem lagrange54_matrix_cover :
    PullbackCover (Carrier 5 4) lagrangeSq lagrange54Lower lagrange54Upper := by
  apply pullbackCover_of_certificate lagrange54_endpoint_data.1 lagrange54_endpoint_data.2.1
  · rw [lagrange54_endpoint_data.2.2.1, lagrange54_endpoint_data.2.2.2]
    norm_num
  · exact lagrange54_json_certificate_valid

end LatticePathOrdersKernel

