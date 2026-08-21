import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0048 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8364 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8324 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8184 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7860 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6782 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5672 true 9)))))) (some (.node (some (.node none (some (.leaf 5791 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8309 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8173 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7838 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6761 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3826 true 14)))))) (some (.node (some (.node none (some (.leaf 464 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8148 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7780 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6705 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3785 true 14)))))) (some (.node (some (.node none (some (.leaf 477 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7537 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6502 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3657 true 14)))))) (some (.node (some (.node none (some (.leaf 1156 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5709 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3050 true 14)))))) (some (.node (some (.node none (some (.leaf 1466 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1842 true 14)))))) (some (.node (some (.node none (some (.leaf 1762 true 14)))) none)))) none)))))))))))

theorem region_0048_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURRUURR") region_0048 = true := by
  unfold region_0048
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

