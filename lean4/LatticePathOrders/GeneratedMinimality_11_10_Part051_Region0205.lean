import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0205 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8351 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6832 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6694 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6286 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7330 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7781 false 0)))))) (some (.node (some (.node none (some (.leaf 7920 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6819 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6664 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6246 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4871 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2583 true 10)))))) (some (.node (some (.node none (some (.leaf 274 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6624 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6187 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4845 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2554 true 10)))))) (some (.node (some (.node none (some (.leaf 2492 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6041 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4769 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4771 true 10)))))) (some (.node (some (.node none (some (.leaf 4799 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5693 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5947 true 10)))))) (some (.node (some (.node none (some (.leaf 6061 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6445 true 10)))))) (some (.node (some (.node none (some (.leaf 6485 true 10)))) none)))) none)))))))))))

theorem region_0205_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRURURRR") region_0205 = true := by
  unfold region_0205
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

