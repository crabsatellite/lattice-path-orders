import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0023 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8450 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8423 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8323 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7999 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6905 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5556 true 9)))))) (some (.node (some (.node none (some (.leaf 5728 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8412 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8297 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7974 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6883 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3910 true 16)))))) (some (.node (some (.node none (some (.leaf 478 true 16)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8237 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7919 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6835 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3877 true 16)))))) (some (.node (some (.node none (some (.leaf 462 true 16)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7660 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6559 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3695 true 16)))))) (some (.node (some (.node none (some (.leaf 1115 true 16)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5811 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3111 true 16)))))) (some (.node (some (.node none (some (.leaf 1349 true 16)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1997 true 16)))))) (some (.node (some (.node none (some (.leaf 1608 false 0)))) none)))) none)))))))))))

theorem region_0023_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRURUURR") region_0023 = true := by
  unfold region_0023
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

