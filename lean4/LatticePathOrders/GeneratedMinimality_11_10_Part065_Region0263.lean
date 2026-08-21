import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0263 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8373 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5809 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5707 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6341 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7362 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7861 false 0)))))) (some (.node (some (.node none (some (.leaf 8000 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5797 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5682 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5341 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4537 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2159 false 0)))))) (some (.node (some (.node none (some (.leaf 896 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5593 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5306 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4511 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2590 false 0)))))) (some (.node (some (.node none (some (.leaf 2614 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5170 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4800 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4872 false 0)))))) (some (.node (some (.node none (some (.leaf 4894 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6108 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6256 false 0)))))) (some (.node (some (.node none (some (.leaf 6303 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6699 false 0)))))) (some (.node (some (.node none (some (.leaf 6742 false 0)))) none)))) none)))))))))))

theorem region_0263_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRUURRRURRR") region_0263 = true := by
  unfold region_0263
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

