import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0073 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8345 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8235 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8146 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7797 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7307 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7721 true 9)))))) (some (.node (some (.node none (some (.leaf 7892 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8220 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8129 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7768 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6700 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3778 true 10)))))) (some (.node (some (.node none (some (.leaf 2932 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8098 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7662 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6627 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3731 true 10)))))) (some (.node (some (.node none (some (.leaf 2933 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7483 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6448 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4701 true 10)))))) (some (.node (some (.node none (some (.leaf 4729 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5595 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5779 true 10)))))) (some (.node (some (.node none (some (.leaf 5855 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6380 true 10)))))) (some (.node (some (.node none (some (.leaf 6399 true 10)))) none)))) none)))))))))))

theorem region_0073_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRUURURRR") region_0073 = true := by
  unfold region_0073
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

