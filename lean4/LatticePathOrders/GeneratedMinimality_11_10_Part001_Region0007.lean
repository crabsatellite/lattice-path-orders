import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0007 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8492 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8459 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8370 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8044 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6943 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3957 true 15)))))) (some (.node (some (.node none (some (.leaf 1673 true 15)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8444 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8354 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8029 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6931 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3948 true 15)))))) (some (.node (some (.node none (some (.leaf 336 true 15)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8280 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7942 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6855 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3892 true 15)))))) (some (.node (some (.node none (some (.leaf 326 true 15)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7707 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6592 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3708 true 15)))))) (some (.node (some (.node none (some (.leaf 298 true 15)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5917 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3175 true 15)))))) (some (.node (some (.node none (some (.leaf 243 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2016 true 15)))))) (some (.node (some (.node none (some (.leaf 244 false 0)))) none)))) none)))))))))))

theorem region_0007_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRRURUUR") region_0007 = true := by
  unfold region_0007
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

