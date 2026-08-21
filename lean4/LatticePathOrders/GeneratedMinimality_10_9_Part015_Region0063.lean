import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0063 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2475 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1954 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1941 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2013 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2307 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2398 false 0)))))) (some (.node (some (.node none (some (.leaf 2433 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1951 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1938 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1820 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1473 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 811 false 0)))))) (some (.node (some (.node none (some (.leaf 115 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1927 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1787 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1465 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1079 false 0)))))) (some (.node (some (.node none (some (.leaf 1096 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1722 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1786 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1854 false 0)))))) (some (.node (some (.node none (some (.leaf 1876 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2129 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2155 false 0)))))) (some (.node (some (.node none (some (.leaf 2165 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2262 false 0)))))) (some (.node (some (.node none (some (.leaf 2280 false 0)))) none)))) none)))))))))))

theorem region_0063_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRURURRRR") region_0063 = true := by
  unfold region_0063
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

