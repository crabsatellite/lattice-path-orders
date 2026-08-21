import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0153 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8450 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7610 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7516 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7222 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7836 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8171 false 0)))))) (some (.node (some (.node none (some (.leaf 8291 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7590 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7504 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7208 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6094 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3378 false 0)))))) (some (.node (some (.node none (some (.leaf 2661 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7457 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7153 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6015 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3429 false 0)))))) (some (.node (some (.node none (some (.leaf 3462 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7046 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5911 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6175 false 0)))))) (some (.node (some (.node none (some (.leaf 6222 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7150 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7270 false 0)))))) (some (.node (some (.node none (some (.leaf 7295 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7612 false 0)))))) (some (.node (some (.node none (some (.leaf 7695 false 0)))) none)))) none)))))))))))

theorem region_0153_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRUURURRRR") region_0153 = true := by
  unfold region_0153
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

