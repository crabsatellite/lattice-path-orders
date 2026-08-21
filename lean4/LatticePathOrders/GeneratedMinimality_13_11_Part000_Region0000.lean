import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0000 : AssignmentTree :=
  (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52233 false 0)))))))))))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52232 true 13)))))))))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52229 true 13)))))))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52218 true 13)))))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52177 true 13)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52023 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52023 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52177 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 52218 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 52229 false 0)))))) (some (.node (some (.node none (some (.leaf 52232 false 0)))) none)))))))))))))))))))))

theorem region_0000_check :
    AssignmentTree.check 13 11 classes 12 (mustParsePath "RRRRRRRRRRRR") region_0000 = true := by
  unfold region_0000
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

