import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0140 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7704 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7665 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7540 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7243 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6124 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3822 true 9)))))) (some (.node (some (.node none (some (.leaf 3908 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7642 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7529 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7232 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6116 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3393 true 12)))))) (some (.node (some (.node none (some (.leaf 1170 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7489 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7187 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6056 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3353 true 12)))))) (some (.node (some (.node none (some (.leaf 1169 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7056 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5703 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3170 true 12)))))) (some (.node (some (.node none (some (.leaf 1168 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5176 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2783 true 12)))))) (some (.node (some (.node none (some (.leaf 1169 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1828 true 12)))))) (some (.node (some (.node none (some (.leaf 1170 false 0)))) none)))) none)))))))))))

theorem region_0140_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRUURRRRUR") region_0140 = true := by
  unfold region_0140
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

