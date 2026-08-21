import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0118 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8024 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7920 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7781 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7330 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6286 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6694 true 9)))))) (some (.node (some (.node none (some (.leaf 6832 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7909 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7749 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7319 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6267 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3495 true 10)))))) (some (.node (some (.node none (some (.leaf 302 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7671 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7280 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6192 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3445 true 10)))))) (some (.node (some (.node none (some (.leaf 816 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7186 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5952 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3286 true 10)))))) (some (.node (some (.node none (some (.leaf 2482 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5310 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3268 true 10)))))) (some (.node (some (.node none (some (.leaf 3328 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3601 true 10)))))) (some (.node (some (.node none (some (.leaf 3630 true 10)))) none)))) none)))))))))))

theorem region_0118_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURURRURR") region_0118 = true := by
  unfold region_0118
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

