import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0340 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6942 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3698 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3660 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3370 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3542 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3831 false 0)))))) (some (.node (some (.node none (some (.leaf 3914 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3688 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3651 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3365 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2507 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 824 false 0)))))) (some (.node (some (.node none (some (.leaf 205 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3617 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3289 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2468 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 812 false 0)))))) (some (.node (some (.node none (some (.leaf 193 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3171 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2317 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 785 false 0)))))) (some (.node (some (.node none (some (.leaf 255 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2012 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 701 false 0)))))) (some (.node (some (.node none (some (.leaf 264 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1756 false 0)))))) (some (.node (some (.node none (some (.leaf 306 false 0)))) none)))) none)))))))))))

theorem region_0340_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRURRRRUR") region_0340 = true := by
  unfold region_0340
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

