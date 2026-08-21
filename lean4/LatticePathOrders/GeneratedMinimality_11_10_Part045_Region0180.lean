import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0180 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7704 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6906 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6783 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6340 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5354 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5710 true 9)))))) (some (.node (some (.node none (some (.leaf 5812 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6892 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6764 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6323 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4902 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2628 false 0)))))) (some (.node (some (.node none (some (.leaf 1358 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6725 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6285 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4884 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2608 false 0)))))) (some (.node (some (.node none (some (.leaf 1477 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6123 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4811 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2514 false 0)))))) (some (.node (some (.node none (some (.leaf 1493 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4548 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2083 false 0)))))) (some (.node (some (.node none (some (.leaf 1495 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1787 false 0)))))) (some (.node (some (.node none (some (.leaf 1836 false 0)))) none)))) none)))))))))))

theorem region_0180_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRRUURR") region_0180 = true := by
  unfold region_0180
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

