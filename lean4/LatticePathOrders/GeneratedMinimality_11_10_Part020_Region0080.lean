import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0080 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8435 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8216 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8134 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7774 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7774 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8134 false 0)))))) (some (.node (some (.node none (some (.leaf 8216 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8204 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8115 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7745 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6683 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5361 true 10)))))) (some (.node (some (.node none (some (.leaf 5363 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8090 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7636 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6611 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5362 true 10)))))) (some (.node (some (.node none (some (.leaf 5364 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7463 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6434 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5933 true 10)))))) (some (.node (some (.node none (some (.leaf 6034 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7020 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7100 true 10)))))) (some (.node (some (.node none (some (.leaf 7170 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7403 true 10)))))) (some (.node (some (.node none (some (.leaf 7443 true 10)))) none)))) none)))))))))))

theorem region_0080_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRUUURRRR") region_0080 = true := by
  unfold region_0080
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

