import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0185 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6928 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6886 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6768 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6330 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4904 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3658 true 9)))))) (some (.node (some (.node none (some (.leaf 3696 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6875 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6751 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6312 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4898 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2622 true 12)))))) (some (.node (some (.node none (some (.leaf 280 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6717 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6269 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4878 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2600 true 12)))))) (some (.node (some (.node none (some (.leaf 253 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6117 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4807 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2508 true 12)))))) (some (.node (some (.node none (some (.leaf 156 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4544 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2081 true 12)))))) (some (.node (some (.node none (some (.leaf 190 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1824 true 12)))))) (some (.node (some (.node none (some (.leaf 209 true 12)))) none)))) none)))))))))))

theorem region_0185_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRURRUR") region_0185 = true := by
  unfold region_0185
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

