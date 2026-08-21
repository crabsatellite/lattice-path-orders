import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0223 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6940 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6562 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6505 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6079 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4813 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3828 true 9)))))) (some (.node (some (.node none (some (.leaf 3912 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6551 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6494 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6068 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4806 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2504 false 0)))))) (some (.node (some (.node none (some (.leaf 273 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6454 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5955 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4776 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2466 false 0)))))) (some (.node (some (.node none (some (.leaf 249 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5704 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4656 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2316 false 0)))))) (some (.node (some (.node none (some (.leaf 246 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4389 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1814 false 0)))))) (some (.node (some (.node none (some (.leaf 262 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1819 false 0)))))) (some (.node (some (.node none (some (.leaf 304 false 0)))) none)))) none)))))))))))

theorem region_0223_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURURRRRUR") region_0223 = true := by
  unfold region_0223
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

