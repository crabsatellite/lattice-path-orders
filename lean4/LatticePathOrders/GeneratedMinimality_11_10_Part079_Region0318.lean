import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0318 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8028 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3878 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3786 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4886 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6282 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6708 false 0)))))) (some (.node (some (.node none (some (.leaf 6838 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3868 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3765 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3493 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2599 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 840 true 10)))))) (some (.node (some (.node none (some (.leaf 207 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3735 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3446 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2559 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 833 true 10)))))) (some (.node (some (.node none (some (.leaf 822 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3352 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2463 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2464 true 10)))))) (some (.node (some (.node none (some (.leaf 2506 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3169 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3287 true 10)))))) (some (.node (some (.node none (some (.leaf 3363 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3615 true 10)))))) (some (.node (some (.node none (some (.leaf 3649 true 10)))) none)))) none)))))))))))

theorem region_0318_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRURRURR") region_0318 = true := by
  unfold region_0318
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

