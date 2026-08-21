import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0236 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8453 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6536 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6474 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6765 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7842 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8174 false 0)))))) (some (.node (some (.node none (some (.leaf 8298 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6531 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6469 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6014 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4787 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2478 false 0)))))) (some (.node (some (.node none (some (.leaf 301 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6426 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5905 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4756 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3442 false 0)))))) (some (.node (some (.node none (some (.leaf 3483 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5648 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5949 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6189 false 0)))))) (some (.node (some (.node none (some (.leaf 6255 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7179 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7278 false 0)))))) (some (.node (some (.node none (some (.leaf 7312 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7657 false 0)))))) (some (.node (some (.node none (some (.leaf 7738 false 0)))) none)))) none)))))))))))

theorem region_0236_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURURURRRR") region_0236 = true := by
  unfold region_0236
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

