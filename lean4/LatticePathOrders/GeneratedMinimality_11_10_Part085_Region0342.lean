import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0342 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8043 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3696 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3658 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4904 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6330 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6768 false 0)))))) (some (.node (some (.node none (some (.leaf 6886 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3686 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3649 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3363 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2506 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 822 false 0)))))) (some (.node (some (.node none (some (.leaf 207 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3615 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3287 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2464 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 833 false 0)))))) (some (.node (some (.node none (some (.leaf 840 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3169 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2463 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2559 false 0)))))) (some (.node (some (.node none (some (.leaf 2599 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3352 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3446 false 0)))))) (some (.node (some (.node none (some (.leaf 3493 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3735 false 0)))))) (some (.node (some (.node none (some (.leaf 3765 false 0)))) none)))) none)))))))))))

theorem region_0342_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRURRRURR") region_0342 = true := by
  unfold region_0342
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

