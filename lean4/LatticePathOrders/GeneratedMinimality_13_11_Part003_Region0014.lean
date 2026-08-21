import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0014 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52108 true 16)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51955 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51384 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49286 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42110 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22738 true 16)))))) (some (.node (some (.node none (some (.leaf 20959 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51832 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51233 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49142 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41985 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22648 true 16)))))) (some (.node (some (.node none (some (.leaf 21184 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50803 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48653 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41522 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22349 true 16)))))) (some (.node (some (.node none (some (.leaf 21288 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47198 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39926 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21304 false 0)))))) (some (.node (some (.node none (some (.leaf 21305 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35449 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21306 false 0)))))) (some (.node (some (.node none (some (.leaf 21307 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 21308 false 0)))))) (some (.node (some (.node none (some (.leaf 21309 false 0)))) none)))) none)))))))))))

theorem region_0014_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRRUURUUR") region_0014 = true := by
  unfold region_0014
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

