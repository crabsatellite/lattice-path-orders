import LatticePathOrdersKernel.InitialLevelOrderCore

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxHeartbeats 1000000

theorem initialLevelPath_score_ne_of_lt
    {n r s : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3)
    (hs : s ≤ n - 3) (hrs : r < s) :
    sourceMatchingNumber (initialLevelPath n r) ≠
      sourceMatchingNumber (initialLevelPath n s) :=
  (initialLevelPath_score_strict_of_lt hn hr hs hrs).ne'

end LatticePathOrdersKernel
