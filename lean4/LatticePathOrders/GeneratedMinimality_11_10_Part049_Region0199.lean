import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0199 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6928 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6838 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6708 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6282 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4886 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3786 true 9)))))) (some (.node (some (.node none (some (.leaf 3878 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6827 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6679 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6263 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4879 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2597 true 12)))))) (some (.node (some (.node none (some (.leaf 278 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6633 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6195 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4848 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2562 true 12)))))) (some (.node (some (.node none (some (.leaf 252 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6057 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4777 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2469 true 12)))))) (some (.node (some (.node none (some (.leaf 155 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4517 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2063 true 12)))))) (some (.node (some (.node none (some (.leaf 252 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1822 true 12)))))) (some (.node (some (.node none (some (.leaf 278 false 0)))) none)))) none)))))))))))

theorem region_0199_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRURRRUR") region_0199 = true := by
  unfold region_0199
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

