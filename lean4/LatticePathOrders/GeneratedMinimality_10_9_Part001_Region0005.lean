import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0005 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2475 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2466 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2438 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2349 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2048 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1217 true 9)))))) (some (.node (some (.node none (some (.leaf 980 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2464 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2432 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2342 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2041 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1212 true 14)))))) (some (.node (some (.node none (some (.leaf 126 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2416 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2327 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2029 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1203 true 14)))))) (some (.node (some (.node none (some (.leaf 123 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2259 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1953 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1148 true 14)))))) (some (.node (some (.node none (some (.leaf 114 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1749 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 979 true 14)))))) (some (.node (some (.node none (some (.leaf 87 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 658 true 14)))))) (some (.node (some (.node none (some (.leaf 50 false 0)))) none)))) none)))))))))))

theorem region_0005_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRRRURUR") region_0005 = true := by
  unfold region_0005
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

