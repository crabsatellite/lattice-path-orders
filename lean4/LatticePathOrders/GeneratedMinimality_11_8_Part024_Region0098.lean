import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0098 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1842 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 541 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 897 false 0)))))) (some (.node (some (.node none (some (.leaf 1443 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 637 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 285 false 0)))))) (some (.node (some (.node none (some (.leaf 286 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 300 false 0)))))) (some (.node (some (.node none (some (.leaf 429 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1183 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 317 false 0)))))) (some (.node (some (.node none (some (.leaf 318 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 322 false 0)))))) (some (.node (some (.node none (some (.leaf 323 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1354 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 487 false 0)))))) (some (.node (some (.node none (some (.leaf 488 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 491 false 0)))))) (some (.node (some (.node none (some (.leaf 492 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0098_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURURRRUU") region_0098 = true := by
  unfold region_0098
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

