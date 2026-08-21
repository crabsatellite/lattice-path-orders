import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0178 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6940 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6908 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6785 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6342 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4909 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3051 true 9)))))) (some (.node (some (.node none (some (.leaf 3112 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6895 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6769 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6329 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4903 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2630 false 0)))))) (some (.node (some (.node none (some (.leaf 281 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6729 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6287 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4885 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2609 false 0)))))) (some (.node (some (.node none (some (.leaf 254 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6125 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4812 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2515 false 0)))))) (some (.node (some (.node none (some (.leaf 157 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4550 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2084 false 0)))))) (some (.node (some (.node none (some (.leaf 135 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1826 false 0)))))) (some (.node (some (.node none (some (.leaf 105 false 0)))) none)))) none)))))))))))

theorem region_0178_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRRURUR") region_0178 = true := by
  unfold region_0178
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

