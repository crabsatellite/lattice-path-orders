import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0100 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1851 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 534 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 927 false 0)))))) (some (.node (some (.node none (some (.leaf 1497 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 639 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 197 false 0)))))) (some (.node (some (.node none (some (.leaf 36 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 346 false 0)))))) (some (.node (some (.node none (some (.leaf 533 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1186 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 188 false 0)))))) (some (.node (some (.node none (some (.leaf 211 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 137 false 0)))))) (some (.node (some (.node none (some (.leaf 1 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1357 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 187 false 0)))))) (some (.node (some (.node none (some (.leaf 490 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 148 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0100_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURURRURU") region_0100 = true := by
  unfold region_0100
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

