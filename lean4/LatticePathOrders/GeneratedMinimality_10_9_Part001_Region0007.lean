import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0007 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2471 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2463 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2434 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2345 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2044 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1724 true 9)))))) (some (.node (some (.node none (some (.leaf 1748 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2461 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2426 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2339 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2038 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1209 true 14)))))) (some (.node (some (.node none (some (.leaf 556 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2412 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2324 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2026 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1200 true 14)))))) (some (.node (some (.node none (some (.leaf 634 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2251 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1950 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1146 true 14)))))) (some (.node (some (.node none (some (.leaf 652 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1745 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 977 true 14)))))) (some (.node (some (.node none (some (.leaf 657 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 655 false 0)))))) (some (.node (some (.node none (some (.leaf 658 false 0)))) none)))) none)))))))))))

theorem region_0007_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRRRUURR") region_0007 = true := by
  unfold region_0007
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

