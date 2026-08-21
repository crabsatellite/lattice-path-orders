import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0018 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8461 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8426 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8329 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8005 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6911 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3932 true 13)))))) (some (.node (some (.node none (some (.leaf 1915 true 13)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8419 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8311 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7986 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6893 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3918 true 13)))))) (some (.node (some (.node none (some (.leaf 747 true 13)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8244 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7925 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6841 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3883 true 13)))))) (some (.node (some (.node none (some (.leaf 828 true 13)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7672 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6565 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3701 true 13)))))) (some (.node (some (.node none (some (.leaf 846 true 13)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5818 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3117 true 13)))))) (some (.node (some (.node none (some (.leaf 852 true 13)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2000 true 13)))))) (some (.node (some (.node none (some (.leaf 854 true 13)))) none)))) none)))))))))))

theorem region_0018_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRURRUUR") region_0018 = true := by
  unfold region_0018
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

