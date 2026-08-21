import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0302 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6854 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3914 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3831 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3542 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3370 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3660 true 9)))))) (some (.node (some (.node none (some (.leaf 3698 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3904 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3818 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3530 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2621 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 848 true 12)))))) (some (.node (some (.node none (some (.leaf 211 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3788 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3498 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2596 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 841 true 12)))))) (some (.node (some (.node none (some (.leaf 191 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3394 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2503 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 823 true 12)))))) (some (.node (some (.node none (some (.leaf 133 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2165 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 743 true 12)))))) (some (.node (some (.node none (some (.leaf 191 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1760 true 12)))))) (some (.node (some (.node none (some (.leaf 211 false 0)))) none)))) none)))))))))))

theorem region_0302_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRURRUR") region_0302 = true := by
  unfold region_0302
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

