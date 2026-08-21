import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0292 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5915 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3933 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3846 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3555 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2639 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2000 false 0)))))) (some (.node (some (.node none (some (.leaf 2001 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3925 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3837 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3547 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3110 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3117 false 0)))))) (some (.node (some (.node none (some (.leaf 3118 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3803 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3681 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3694 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3701 false 0)))))) (some (.node (some (.node none (some (.leaf 3702 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3862 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3876 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3883 false 0)))))) (some (.node (some (.node none (some (.leaf 3884 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3911 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3918 false 0)))))) (some (.node (some (.node none (some (.leaf 3923 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3932 false 0)))))) (some (.node (some (.node none (some (.leaf 3934 false 0)))) none)))) none)))))))))))

theorem region_0292_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRRRUUR") region_0292 = true := by
  unfold region_0292
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

