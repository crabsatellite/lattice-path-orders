import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0028 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2357 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2343 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2305 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2176 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1894 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1994 true 9)))))) (some (.node (some (.node none (some (.leaf 2030 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2340 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2301 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2173 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1887 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1105 true 10)))))) (some (.node (some (.node none (some (.leaf 117 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2288 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2166 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1874 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1093 true 10)))))) (some (.node (some (.node none (some (.leaf 298 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2141 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1821 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1054 true 10)))))) (some (.node (some (.node none (some (.leaf 812 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1627 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1031 true 10)))))) (some (.node (some (.node none (some (.leaf 1055 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1128 true 10)))))) (some (.node (some (.node none (some (.leaf 1139 true 10)))) none)))) none)))))))))))

theorem region_0028_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRURRURR") region_0028 = true := by
  unfold region_0028
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

