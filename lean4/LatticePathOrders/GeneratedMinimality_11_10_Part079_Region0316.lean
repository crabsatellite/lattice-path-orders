import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0316 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6930 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3880 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3790 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3510 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3510 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3790 false 0)))))) (some (.node (some (.node none (some (.leaf 3880 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3870 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3767 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3497 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2601 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 842 false 0)))))) (some (.node (some (.node none (some (.leaf 209 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3737 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3448 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2561 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 834 false 0)))))) (some (.node (some (.node none (some (.leaf 190 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3354 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2467 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 813 false 0)))))) (some (.node (some (.node none (some (.leaf 156 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2150 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 734 false 0)))))) (some (.node (some (.node none (some (.leaf 253 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1758 false 0)))))) (some (.node (some (.node none (some (.leaf 280 false 0)))) none)))) none)))))))))))

theorem region_0316_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRURRRUR") region_0316 = true := by
  unfold region_0316
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

