import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0163 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8489 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7561 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7468 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7193 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7979 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8301 false 0)))))) (some (.node (some (.node none (some (.leaf 8409 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7556 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7443 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7170 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6034 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5364 false 0)))))) (some (.node (some (.node none (some (.leaf 5363 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7403 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7100 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5933 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5362 false 0)))))) (some (.node (some (.node none (some (.leaf 5361 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7020 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6434 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6611 false 0)))))) (some (.node (some (.node none (some (.leaf 6683 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7463 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7636 false 0)))))) (some (.node (some (.node none (some (.leaf 7745 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 8090 false 0)))))) (some (.node (some (.node none (some (.leaf 8115 false 0)))) none)))) none)))))))))))

theorem region_0163_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRUUURRRRR") region_0163 = true := by
  unfold region_0163
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

