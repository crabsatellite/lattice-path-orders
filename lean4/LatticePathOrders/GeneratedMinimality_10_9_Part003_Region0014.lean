import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0014 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2446 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2433 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2398 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2307 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2013 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1941 true 9)))))) (some (.node (some (.node none (some (.leaf 1954 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2428 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2395 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2300 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2006 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1184 true 10)))))) (some (.node (some (.node none (some (.leaf 120 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2388 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2279 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1985 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1169 true 10)))))) (some (.node (some (.node none (some (.leaf 270 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2223 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1937 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1138 true 10)))))) (some (.node (some (.node none (some (.leaf 682 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1719 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 962 true 10)))))) (some (.node (some (.node none (some (.leaf 932 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 952 true 10)))))) (some (.node (some (.node none (some (.leaf 963 true 10)))) none)))) none)))))))))))

theorem region_0014_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRRURURR") region_0014 = true := by
  unfold region_0014
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

