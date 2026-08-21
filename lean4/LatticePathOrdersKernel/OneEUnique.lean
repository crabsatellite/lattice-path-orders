import LatticePathOrdersKernel.PellOddChain

namespace LatticePathOrdersKernel
open LatticePathOrders

/-- The one-`E` carrier is the unique minimum candidate in manuscript
Theorem `thm:nonlocal`. -/
theorem one_E_carrier_eq_minimumLevelPath
    {n : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hone : (adjacencyBlocks word).count E = 1) :
    word = minimumLevelPath n := by
  have hdata := carrier_nn1_block_data hn hword
  have hdecomp := initial_one_E_decomposition hdata.2.1 hdata.2.2.2 hone
  apply carrier_adjacencyBlocks_injective (by omega) hword
    (minimumLevelPath_carrier hn)
  rw [minimumLevelPath_adjacencyBlocks hn]
  have htail : (adjacencyBlocks word).length - 1 = 2 * n - 3 := by
    omega
  rw [hdecomp, htail]

end LatticePathOrdersKernel
