import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0092 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8047 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8006 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7867 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7365 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6347 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3556 true 13)))))) (some (.node (some (.node none (some (.leaf 1995 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7995 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7853 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7358 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6337 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3548 true 13)))))) (some (.node (some (.node none (some (.leaf 2931 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7806 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7335 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6289 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3515 true 13)))))) (some (.node (some (.node none (some (.leaf 3372 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7247 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6082 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3515 false 0)))))) (some (.node (some (.node none (some (.leaf 3517 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5359 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3548 false 0)))))) (some (.node (some (.node none (some (.leaf 3550 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3556 false 0)))))) (some (.node (some (.node none (some (.leaf 3558 false 0)))) none)))) none)))))))))))

theorem region_0092_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRRRUUR") region_0092 = true := by
  unfold region_0092
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

