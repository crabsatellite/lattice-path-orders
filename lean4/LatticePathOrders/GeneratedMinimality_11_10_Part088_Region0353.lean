import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0353 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8458 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3679 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3832 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6770 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7847 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8177 false 0)))))) (some (.node (some (.node none (some (.leaf 8304 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3902 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3630 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3328 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2482 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 816 false 0)))))) (some (.node (some (.node none (some (.leaf 302 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3601 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3268 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3286 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3445 false 0)))))) (some (.node (some (.node none (some (.leaf 3495 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5310 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5952 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6192 false 0)))))) (some (.node (some (.node none (some (.leaf 6267 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7186 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7280 false 0)))))) (some (.node (some (.node none (some (.leaf 7319 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7671 false 0)))))) (some (.node (some (.node none (some (.leaf 7749 false 0)))) none)))) none)))))))))))

theorem region_0353_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRURURRRR") region_0353 = true := by
  unfold region_0353
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

