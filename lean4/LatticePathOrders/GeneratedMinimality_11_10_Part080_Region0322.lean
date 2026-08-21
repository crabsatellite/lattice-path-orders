import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0322 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8353 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3874 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3775 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6288 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7332 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7785 false 0)))))) (some (.node (some (.node none (some (.leaf 7922 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3865 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3758 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3481 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2589 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 837 false 0)))))) (some (.node (some (.node none (some (.leaf 270 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3728 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3440 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2556 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2462 false 0)))))) (some (.node (some (.node none (some (.leaf 2502 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4387 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4655 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4774 false 0)))))) (some (.node (some (.node none (some (.leaf 4805 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5702 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5953 false 0)))))) (some (.node (some (.node none (some (.leaf 6067 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6452 false 0)))))) (some (.node (some (.node none (some (.leaf 6492 false 0)))) none)))) none)))))))))))

theorem region_0322_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRURURRR") region_0322 = true := by
  unfold region_0322
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

