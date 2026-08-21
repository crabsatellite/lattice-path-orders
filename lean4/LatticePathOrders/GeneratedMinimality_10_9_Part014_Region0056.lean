import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0056 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2450 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2030 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1994 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1894 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2176 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2305 false 0)))))) (some (.node (some (.node none (some (.leaf 2343 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2027 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1986 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1875 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1494 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 840 true 10)))))) (some (.node (some (.node none (some (.leaf 107 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1973 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1855 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1485 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 830 false 0)))))) (some (.node (some (.node none (some (.leaf 840 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1817 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1466 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1485 false 0)))))) (some (.node (some (.node none (some (.leaf 1494 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1817 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1855 false 0)))))) (some (.node (some (.node none (some (.leaf 1875 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1973 false 0)))))) (some (.node (some (.node none (some (.leaf 1986 false 0)))) none)))) none)))))))))))

theorem region_0056_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRURRURRR") region_0056 = true := by
  unfold region_0056
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

