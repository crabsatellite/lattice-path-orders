import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0212 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8441 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6811 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6655 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6726 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7800 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8149 false 0)))))) (some (.node (some (.node none (some (.leaf 8238 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6806 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6647 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6216 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4858 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2568 false 0)))))) (some (.node (some (.node none (some (.leaf 1234 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6602 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6171 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4837 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3344 false 0)))))) (some (.node (some (.node none (some (.leaf 3387 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6004 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5698 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6045 false 0)))))) (some (.node (some (.node none (some (.leaf 6109 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7053 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7182 false 0)))))) (some (.node (some (.node none (some (.leaf 7225 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7481 false 0)))))) (some (.node (some (.node none (some (.leaf 7522 false 0)))) none)))) none)))))))))))

theorem region_0212_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRUURRRR") region_0212 = true := by
  unfold region_0212
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

