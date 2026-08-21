import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0074 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1841 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1134 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 925 false 0)))))) (some (.node (some (.node none (some (.leaf 1495 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1102 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 424 false 0)))))) (some (.node (some (.node none (some (.leaf 310 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 342 false 0)))))) (some (.node (some (.node none (some (.leaf 530 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1160 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 392 true 5)))))) (some (.node (some (.node none (some (.leaf 312 true 5)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 287 false 0)))))) (some (.node (some (.node none (some (.leaf 320 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1323 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 386 false 0)))))) (some (.node (some (.node none (some (.leaf 486 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 288 false 0)))))) (some (.node (some (.node none (some (.leaf 321 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0074_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRUURRURU") region_0074 = true := by
  unfold region_0074
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

