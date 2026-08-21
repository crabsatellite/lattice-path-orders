import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0380 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8375 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3108 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3552 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6343 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7363 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7863 false 0)))))) (some (.node (some (.node none (some (.leaf 8002 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3870 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3039 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2917 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2075 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 740 false 0)))))) (some (.node (some (.node none (some (.leaf 279 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3007 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2891 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2505 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2598 false 0)))))) (some (.node (some (.node none (some (.leaf 2620 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4542 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4804 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4876 false 0)))))) (some (.node (some (.node none (some (.leaf 4897 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6115 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6266 false 0)))))) (some (.node (some (.node none (some (.leaf 6310 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6714 false 0)))))) (some (.node (some (.node none (some (.leaf 6749 false 0)))) none)))) none)))))))))))

theorem region_0380_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURURRRURRR") region_0380 = true := by
  unfold region_0380
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

