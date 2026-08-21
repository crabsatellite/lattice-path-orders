import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0129 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8438 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7892 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7721 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7307 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7797 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8146 false 0)))))) (some (.node (some (.node none (some (.leaf 8235 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7887 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7695 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7295 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6222 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3462 true 10)))))) (some (.node (some (.node none (some (.leaf 2661 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7612 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7270 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6175 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3429 true 10)))))) (some (.node (some (.node none (some (.leaf 3378 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7150 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5911 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6015 true 10)))))) (some (.node (some (.node none (some (.leaf 6094 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7046 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7153 true 10)))))) (some (.node (some (.node none (some (.leaf 7208 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7457 true 10)))))) (some (.node (some (.node none (some (.leaf 7504 true 10)))) none)))) none)))))))))))

theorem region_0129_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURUURRRR") region_0129 = true := by
  unfold region_0129
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

