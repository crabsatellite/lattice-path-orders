import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0094 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1850 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 663 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 926 false 0)))))) (some (.node (some (.node none (some (.leaf 1496 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 636 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 224 false 0)))))) (some (.node (some (.node none (some (.leaf 35 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 340 false 0)))))) (some (.node (some (.node none (some (.leaf 529 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1182 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 210 true 5)))))) (some (.node (some (.node none (some (.leaf 210 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 148 true 3)))))) (some (.node (some (.node none (some (.leaf 2 true 15)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1353 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 208 false 0)))))) (some (.node (some (.node none (some (.leaf 489 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 146 false 0)))))) (some (.node (some (.node none (some (.leaf 2 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0094_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRURURU") region_0094 = true := by
  unfold region_0094
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

