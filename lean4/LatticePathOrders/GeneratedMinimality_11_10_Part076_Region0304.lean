import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0304 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7941 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3912 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3828 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4813 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6079 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6505 false 0)))))) (some (.node (some (.node none (some (.leaf 6562 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3902 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3816 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3528 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2619 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 847 true 10)))))) (some (.node (some (.node none (some (.leaf 210 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3784 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3494 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2594 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 839 true 10)))))) (some (.node (some (.node none (some (.leaf 741 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3392 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2501 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2061 true 10)))))) (some (.node (some (.node none (some (.leaf 2079 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2782 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2893 true 10)))))) (some (.node (some (.node none (some (.leaf 2921 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3011 true 10)))))) (some (.node (some (.node none (some (.leaf 3044 true 10)))) none)))) none)))))))))))

theorem region_0304_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRURURR") region_0304 = true := by
  unfold region_0304
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

