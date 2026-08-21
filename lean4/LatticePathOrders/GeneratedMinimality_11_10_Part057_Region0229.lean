import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0229 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8367 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6556 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6499 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6326 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7352 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7840 false 0)))))) (some (.node (some (.node none (some (.leaf 7975 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6543 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6485 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6061 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4799 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2492 false 0)))))) (some (.node (some (.node none (some (.leaf 274 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6445 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5947 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4771 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2554 false 0)))))) (some (.node (some (.node none (some (.leaf 2583 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5693 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4769 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4845 false 0)))))) (some (.node (some (.node none (some (.leaf 4871 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6041 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6187 false 0)))))) (some (.node (some (.node none (some (.leaf 6246 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6624 false 0)))))) (some (.node (some (.node none (some (.leaf 6664 false 0)))) none)))) none)))))))))))

theorem region_0229_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURURRURRR") region_0229 = true := by
  unfold region_0229
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

