import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2395 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52037 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17509 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22449 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 41707 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 48831 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 50905 false 0)))))) (some (.node (some (.node none (some (.leaf 51552 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22437 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17012 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16047 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11093 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6048 false 0)))))) (some (.node (some (.node none (some (.leaf 6047 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16834 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16866 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20540 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21387 false 0)))))) (some (.node (some (.node none (some (.leaf 21658 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 33135 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 38700 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40025 false 0)))))) (some (.node (some (.node none (some (.leaf 40528 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 45408 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46704 false 0)))))) (some (.node (some (.node none (some (.leaf 47467 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 49520 false 0)))))) (some (.node (some (.node none (some (.leaf 49758 false 0)))) none)))) none)))))))))))

theorem region_2395_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRRUURRRRR") region_2395 = true := by
  unfold region_2395
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

