import LatticePathOrdersKernel.YUniqueThree

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

/-- A carrier path with one equal-adjacency block cannot have the score of `Y_n`.
This is the one-`E` branch in the uniqueness part of Theorem 6.5. -/
theorem one_E_score_ne_nonlocalY
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hone : (adjacencyBlocks word).count E = 1) :
    sourceMatchingNumber word ≠ sourceMatchingNumber (nonlocalY n) := by
  intro hscore
  let blocks := adjacencyBlocks word
  have hdata := carrier_nn1_block_data hn hword
  dsimp only at hdata
  have hdecomp := initial_one_E_decomposition hdata.2.1 hdata.2.2.2 hone
  have hbelow :
      sourceMatchingNumber word ≤ sourceMatchingNumber (nonlocalX n) := by
    rw [sourceMatchingNumber_eq_matchingScore, nonlocalX_score hn]
    unfold matchingScore
    rw [hdecomp, one_E_score (by omega)]
    have hbase : blocks.length + 1 = 2 * n - 1 := by
      dsimp [blocks]
      omega
    rw [hbase]
    omega
  rw [hscore] at hbelow
  exact (not_lt_of_ge hbelow) (nonlocalX_lt_nonlocalY hn)

end LatticePathOrdersKernel
