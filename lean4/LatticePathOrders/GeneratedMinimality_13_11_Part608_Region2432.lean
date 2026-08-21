import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2432 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52052 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17452 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22504 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 41782 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 48918 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 50998 false 0)))))) (some (.node (some (.node none (some (.leaf 51611 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22448 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16936 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15984 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11050 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3373 false 0)))))) (some (.node (some (.node none (some (.leaf 1346 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16807 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17053 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20747 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21556 false 0)))))) (some (.node (some (.node none (some (.leaf 21834 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 33697 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 38959 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40308 false 0)))))) (some (.node (some (.node none (some (.leaf 40752 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 45679 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47277 false 0)))))) (some (.node (some (.node none (some (.leaf 47744 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 49763 false 0)))))) (some (.node (some (.node none (some (.leaf 49938 false 0)))) none)))) none)))))))))))

theorem region_2432_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRURURRRRR") region_2432 = true := by
  unfold region_2432
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

