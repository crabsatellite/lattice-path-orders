import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0295 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6588 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3929 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3842 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3551 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2929 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3053 true 9)))))) (some (.node (some (.node none (some (.leaf 3114 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3920 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3830 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3540 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2629 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 849 false 0)))))) (some (.node (some (.node none (some (.leaf 212 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3800 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3508 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2605 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 844 false 0)))))) (some (.node (some (.node none (some (.leaf 192 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3398 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2512 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 826 false 0)))))) (some (.node (some (.node none (some (.leaf 134 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2168 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 745 false 0)))))) (some (.node (some (.node none (some (.leaf 106 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1762 false 0)))))) (some (.node (some (.node none (some (.leaf 107 false 0)))) none)))) none)))))))))))

theorem region_0295_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRRURUR") region_0295 = true := by
  unfold region_0295
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

