import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0048 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1835 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1430 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 921 false 0)))))) (some (.node (some (.node none (some (.leaf 1491 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1312 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 794 false 0)))))) (some (.node (some (.node none (some (.leaf 808 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 796 false 0)))))) (some (.node (some (.node none (some (.leaf 810 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1293 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 795 false 0)))))) (some (.node (some (.node none (some (.leaf 809 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 797 false 0)))))) (some (.node (some (.node none (some (.leaf 811 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1306 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 799 false 0)))))) (some (.node (some (.node none (some (.leaf 813 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 800 false 0)))))) (some (.node (some (.node none (some (.leaf 815 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0048_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRUURURU") region_0048 = true := by
  unfold region_0048
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

