import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0086 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2363 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1213 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1190 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1503 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1897 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2017 false 0)))))) (some (.node (some (.node none (some (.leaf 2049 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1210 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1185 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1104 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 846 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 306 true 10)))))) (some (.node (some (.node none (some (.leaf 83 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1176 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1094 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 839 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 303 false 0)))))) (some (.node (some (.node none (some (.leaf 306 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1063 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 810 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 839 false 0)))))) (some (.node (some (.node none (some (.leaf 846 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1063 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1094 false 0)))))) (some (.node (some (.node none (some (.leaf 1104 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1176 false 0)))))) (some (.node (some (.node none (some (.leaf 1185 false 0)))) none)))) none)))))))))))

theorem region_0086_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRURRRRURR") region_0086 = true := by
  unfold region_0086
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

