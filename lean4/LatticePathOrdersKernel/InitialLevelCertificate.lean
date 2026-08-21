import LatticePathOrdersKernel.InitialLevelCertificateDefs

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem initial_matching_levels_certificate
    {n : Nat} (hn : 4 ≤ n) : InitialMatchingLevelsCertificate n := by
  refine {
    minimum_carrier := minimumLevelPath_carrier hn
    minimum_block_word := minimumLevelPath_adjacencyBlocks hn
    candidate_carrier := fun _ hr => initialLevelPath_carrier hn hr
    candidate_block_word := ?_
    candidate_index_count := initialLevel_index_count hn
    minimum_below_candidates := fun _ hr =>
      minimumLevelPath_lt_initialLevelPath hn hr
    candidates_strictly_listed := fun _ _ hr hs hrs =>
      initialLevelPath_score_strict_of_lt hn hr hs hrs
    candidates_below_Y := fun _ hr => initialLevelPath_lt_nonlocalY hn hr
    below_Y_exhaustive := fun _ hword hlt =>
      below_nonlocalY_classification hn hword hlt
    minimum_singleton := fun _ hword hscore =>
      minimumLevelPath_score_unique hn hword hscore
    candidate_singleton := fun _ hr _ hword hscore =>
      initialLevelPath_score_unique hn hr hword hscore
    Y_carrier := nonlocalY_carrier hn
    Y_singleton := fun _ hword hscore => nonlocalY_score_unique hn hword hscore
    X_is_top_candidate := initialLevelPath_zero hn }
  intro r hr
  have hblocks := initialLevelPath_adjacencyBlocks hn hr
  have hexponent : 2 * n - 2 * r - 5 = 2 * n - 5 - 2 * r := by omega
  rw [hexponent] at hblocks
  exact hblocks

end LatticePathOrdersKernel
