import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0097 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8039 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8000 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7861 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7362 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6341 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5707 true 9)))))) (some (.node (some (.node none (some (.leaf 5809 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7985 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7841 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7351 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6322 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3539 true 14)))))) (some (.node (some (.node none (some (.leaf 1117 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7799 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7329 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6279 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3507 true 14)))))) (some (.node (some (.node none (some (.leaf 1161 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7240 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6076 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3368 true 14)))))) (some (.node (some (.node none (some (.leaf 1166 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5353 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2927 true 14)))))) (some (.node (some (.node none (some (.leaf 1488 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1787 true 14)))))) (some (.node (some (.node none (some (.leaf 1826 true 14)))) none)))) none)))))))))))

theorem region_0097_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRRUURR") region_0097 = true := by
  unfold region_0097
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

