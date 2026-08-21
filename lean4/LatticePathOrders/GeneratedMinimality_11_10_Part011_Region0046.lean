import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0046 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8367 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8326 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8185 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7862 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6784 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3843 true 9)))))) (some (.node (some (.node none (some (.leaf 3098 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8312 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8176 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7843 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6766 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3829 true 14)))))) (some (.node (some (.node none (some (.leaf 315 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8152 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7784 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6707 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3789 true 14)))))) (some (.node (some (.node none (some (.leaf 310 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7541 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6504 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3659 true 14)))))) (some (.node (some (.node none (some (.leaf 284 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5713 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3052 true 14)))))) (some (.node (some (.node none (some (.leaf 215 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1843 true 14)))))) (some (.node (some (.node none (some (.leaf 107 true 14)))) none)))) none)))))))))))

theorem region_0046_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURRURUR") region_0046 = true := by
  unfold region_0046
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

