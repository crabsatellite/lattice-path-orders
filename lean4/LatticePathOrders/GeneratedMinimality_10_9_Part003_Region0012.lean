import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0012 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2450 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2439 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2400 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2310 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2016 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1194 true 9)))))) (some (.node (some (.node none (some (.leaf 1149 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2435 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2397 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2304 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2010 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1188 true 12)))))) (some (.node (some (.node none (some (.leaf 121 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2391 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2289 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1993 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1177 true 12)))))) (some (.node (some (.node none (some (.leaf 119 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2226 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1940 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1141 true 12)))))) (some (.node (some (.node none (some (.leaf 111 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1725 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 965 true 12)))))) (some (.node (some (.node none (some (.leaf 85 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 608 true 12)))))) (some (.node (some (.node none (some (.leaf 84 true 12)))) none)))) none)))))))))))

theorem region_0012_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRRURRUR") region_0012 = true := by
  unfold region_0012
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

