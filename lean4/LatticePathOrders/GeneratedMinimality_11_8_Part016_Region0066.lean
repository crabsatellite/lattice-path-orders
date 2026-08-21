import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0066 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1830 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1222 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 893 false 0)))))) (some (.node (some (.node none (some (.leaf 1433 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1144 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 530 true 7)))))) (some (.node (some (.node none (some (.leaf 310 true 7)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 342 true 7)))))) (some (.node (some (.node none (some (.leaf 424 true 7)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1155 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 491 true 12)))))) (some (.node (some (.node none (some (.leaf 204 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 322 true 12)))))) (some (.node (some (.node none (some (.leaf 139 true 12)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1310 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 487 true 12)))))) (some (.node (some (.node none (some (.leaf 477 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 317 true 12)))))) (some (.node (some (.node none (some (.leaf 190 true 12)))) none)))) none)))) none)) none)))) none)

theorem region_0066_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURURRUU") region_0066 = true := by
  unfold region_0066
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

