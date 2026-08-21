import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0102 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8026 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7978 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7845 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7355 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6331 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3655 true 9)))))) (some (.node (some (.node none (some (.leaf 3692 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7966 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7827 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7345 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6311 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3531 true 12)))))) (some (.node (some (.node none (some (.leaf 306 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7783 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7321 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6262 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3496 true 12)))))) (some (.node (some (.node none (some (.leaf 264 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7233 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6069 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3364 true 12)))))) (some (.node (some (.node none (some (.leaf 255 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5348 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2924 true 12)))))) (some (.node (some (.node none (some (.leaf 193 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1831 true 12)))))) (some (.node (some (.node none (some (.leaf 205 true 12)))) none)))) none)))))))))))

theorem region_0102_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRURRUR") region_0102 = true := by
  unfold region_0102
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

