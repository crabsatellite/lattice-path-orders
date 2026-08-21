import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0297 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7706 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3927 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3841 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4549 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5355 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5712 false 0)))))) (some (.node (some (.node none (some (.leaf 5814 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3917 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3827 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3538 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2627 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1610 false 0)))))) (some (.node (some (.node none (some (.leaf 1611 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3798 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3506 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2604 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1764 false 0)))))) (some (.node (some (.node none (some (.leaf 1765 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3397 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2511 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1832 false 0)))))) (some (.node (some (.node none (some (.leaf 1835 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2167 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1840 false 0)))))) (some (.node (some (.node none (some (.leaf 1841 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1842 false 0)))))) (some (.node (some (.node none (some (.leaf 1843 false 0)))) none)))) none)))))))))))

theorem region_0297_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRRUURR") region_0297 = true := by
  unfold region_0297
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

