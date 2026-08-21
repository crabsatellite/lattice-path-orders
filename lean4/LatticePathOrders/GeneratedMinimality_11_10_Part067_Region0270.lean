import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0270 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8461 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5791 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5672 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6782 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7860 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8184 false 0)))))) (some (.node (some (.node none (some (.leaf 8324 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5786 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5653 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5325 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4525 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2154 false 0)))))) (some (.node (some (.node none (some (.leaf 917 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5575 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5290 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4497 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3484 false 0)))))) (some (.node (some (.node none (some (.leaf 3522 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5340 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6062 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6247 false 0)))))) (some (.node (some (.node none (some (.leaf 6304 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7224 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7313 false 0)))))) (some (.node (some (.node none (some (.leaf 7341 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7764 false 0)))))) (some (.node (some (.node none (some (.leaf 7818 false 0)))) none)))) none)))))))))))

theorem region_0270_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRUURRURRRR") region_0270 = true := by
  unfold region_0270
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

