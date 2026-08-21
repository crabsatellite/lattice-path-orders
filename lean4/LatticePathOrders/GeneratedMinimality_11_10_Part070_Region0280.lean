import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0280 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8492 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5728 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5556 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6905 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7999 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8323 false 0)))))) (some (.node (some (.node none (some (.leaf 8423 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5723 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5541 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5272 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4490 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2124 false 0)))))) (some (.node (some (.node none (some (.leaf 1496 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5456 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5226 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4444 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3760 false 0)))))) (some (.node (some (.node none (some (.leaf 3811 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5679 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6487 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6667 false 0)))))) (some (.node (some (.node none (some (.leaf 6744 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7521 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7740 false 0)))))) (some (.node (some (.node none (some (.leaf 7820 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 8128 false 0)))))) (some (.node (some (.node none (some (.leaf 8163 false 0)))) none)))) none)))))))))))

theorem region_0280_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRUURURRRRR") region_0280 = true := by
  unfold region_0280
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

