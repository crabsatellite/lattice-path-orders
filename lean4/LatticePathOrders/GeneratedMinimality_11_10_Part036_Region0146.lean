import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0146 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8364 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7653 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7535 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7238 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7349 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7832 false 0)))))) (some (.node (some (.node none (some (.leaf 7971 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7629 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7522 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7225 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6109 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3387 true 10)))))) (some (.node (some (.node none (some (.leaf 1234 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7481 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7182 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6045 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3344 true 10)))))) (some (.node (some (.node none (some (.leaf 2568 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7053 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5698 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4837 true 10)))))) (some (.node (some (.node none (some (.leaf 4858 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6004 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6171 true 10)))))) (some (.node (some (.node none (some (.leaf 6216 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6602 true 10)))))) (some (.node (some (.node none (some (.leaf 6647 true 10)))) none)))) none)))))))))))

theorem region_0146_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRUURRURRR") region_0146 = true := by
  unfold region_0146
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

