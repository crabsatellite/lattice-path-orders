import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0088 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1849 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 688 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 923 false 0)))))) (some (.node (some (.node none (some (.leaf 1493 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 635 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 506 false 0)))))) (some (.node (some (.node none (some (.leaf 508 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 507 false 0)))))) (some (.node (some (.node none (some (.leaf 512 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1181 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 515 false 0)))))) (some (.node (some (.node none (some (.leaf 519 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 516 false 0)))))) (some (.node (some (.node none (some (.leaf 520 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1352 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 590 false 0)))))) (some (.node (some (.node none (some (.leaf 592 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 591 false 0)))))) (some (.node (some (.node none (some (.leaf 594 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0088_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRRUURU") region_0088 = true := by
  unfold region_0088
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

