import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0026 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2361 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2350 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2311 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2178 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1898 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1178 true 9)))))) (some (.node (some (.node none (some (.leaf 1204 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2346 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2306 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2175 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1891 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1109 true 12)))))) (some (.node (some (.node none (some (.leaf 118 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2294 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2168 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1880 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1100 true 12)))))) (some (.node (some (.node none (some (.leaf 104 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2144 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1823 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1057 true 12)))))) (some (.node (some (.node none (some (.leaf 100 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1629 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 934 true 12)))))) (some (.node (some (.node none (some (.leaf 99 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 605 true 12)))))) (some (.node (some (.node none (some (.leaf 110 true 12)))) none)))) none)))))))))))

theorem region_0026_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRURRRUR") region_0026 = true := by
  unfold region_0026
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

