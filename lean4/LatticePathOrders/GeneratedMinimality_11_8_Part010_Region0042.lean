import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0042 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1833 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1489 true 6)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 919 false 0)))))) (some (.node (some (.node none (some (.leaf 1489 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1350 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 808 true 16)))))) (some (.node (some (.node none (some (.leaf 68 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 452 true 16)))))) (some (.node (some (.node none (some (.leaf 509 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1309 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 776 true 16)))))) (some (.node (some (.node none (some (.leaf 205 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 416 true 16)))))) (some (.node (some (.node none (some (.leaf 69 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1304 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 772 true 16)))))) (some (.node (some (.node none (some (.leaf 479 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 408 true 16)))))) (some (.node (some (.node none (some (.leaf 70 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0042_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRURUURU") region_0042 = true := by
  unfold region_0042
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

