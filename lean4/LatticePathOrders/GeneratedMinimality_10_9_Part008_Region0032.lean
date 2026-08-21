import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0032 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2446 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2328 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2290 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2169 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2169 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2290 false 0)))))) (some (.node (some (.node none (some (.leaf 2328 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2325 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2280 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2165 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1876 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1096 true 10)))))) (some (.node (some (.node none (some (.leaf 115 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2262 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2155 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1854 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1079 true 10)))))) (some (.node (some (.node none (some (.leaf 811 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2129 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1786 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1465 true 10)))))) (some (.node (some (.node none (some (.leaf 1473 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1722 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1787 true 10)))))) (some (.node (some (.node none (some (.leaf 1820 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1927 true 10)))))) (some (.node (some (.node none (some (.leaf 1938 true 10)))) none)))) none)))))))))))

theorem region_0032_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRURURRR") region_0032 = true := by
  unfold region_0032
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

