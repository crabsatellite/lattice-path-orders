import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0122 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8349 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7916 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7766 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7326 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7326 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7766 false 0)))))) (some (.node (some (.node none (some (.leaf 7916 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7902 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7738 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7312 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6255 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3483 true 10)))))) (some (.node (some (.node none (some (.leaf 301 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7657 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7278 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6189 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3442 true 10)))))) (some (.node (some (.node none (some (.leaf 2478 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7179 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5949 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4756 true 10)))))) (some (.node (some (.node none (some (.leaf 4787 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5648 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5905 true 10)))))) (some (.node (some (.node none (some (.leaf 6014 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6426 true 10)))))) (some (.node (some (.node none (some (.leaf 6469 true 10)))) none)))) none)))))))))))

theorem region_0122_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURURURRR") region_0122 = true := by
  unfold region_0122
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

