import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0246 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8490 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6521 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6407 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6891 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7984 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8308 false 0)))))) (some (.node (some (.node none (some (.leaf 8413 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6516 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6399 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5855 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4729 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2933 false 0)))))) (some (.node (some (.node none (some (.leaf 2932 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6380 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5779 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4701 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3731 false 0)))))) (some (.node (some (.node none (some (.leaf 3778 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5595 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6448 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6627 false 0)))))) (some (.node (some (.node none (some (.leaf 6700 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7483 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7662 false 0)))))) (some (.node (some (.node none (some (.leaf 7768 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 8098 false 0)))))) (some (.node (some (.node none (some (.leaf 8129 false 0)))) none)))) none)))))))))))

theorem region_0246_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURUURRRRR") region_0246 = true := by
  unfold region_0246
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

