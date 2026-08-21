import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0374 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6948 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3114 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3053 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2929 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3551 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3842 false 0)))))) (some (.node (some (.node none (some (.leaf 3929 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3104 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3046 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2923 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2080 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 742 false 0)))))) (some (.node (some (.node none (some (.leaf 200 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3013 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2894 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2062 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 733 false 0)))))) (some (.node (some (.node none (some (.leaf 213 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2784 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1813 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 700 false 0)))))) (some (.node (some (.node none (some (.leaf 282 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1393 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 592 false 0)))))) (some (.node (some (.node none (some (.leaf 308 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1752 false 0)))))) (some (.node (some (.node none (some (.leaf 314 false 0)))) none)))) none)))))))))))

theorem region_0374_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURURRRRRUR") region_0374 = true := by
  unfold region_0374
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

