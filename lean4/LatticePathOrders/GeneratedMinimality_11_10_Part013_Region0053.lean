import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0053 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8351 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8304 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8177 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7847 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6770 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3832 true 9)))))) (some (.node (some (.node none (some (.leaf 3679 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8284 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8167 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7826 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6750 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3817 true 12)))))) (some (.node (some (.node none (some (.leaf 314 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8140 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7750 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6678 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3766 true 12)))))) (some (.node (some (.node none (some (.leaf 308 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7530 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6493 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3650 true 12)))))) (some (.node (some (.node none (some (.leaf 282 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5694 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3045 true 12)))))) (some (.node (some (.node none (some (.leaf 213 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1839 true 12)))))) (some (.node (some (.node none (some (.leaf 200 true 12)))) none)))) none)))))))))))

theorem region_0053_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURURRUR") region_0053 = true := by
  unfold region_0053
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

