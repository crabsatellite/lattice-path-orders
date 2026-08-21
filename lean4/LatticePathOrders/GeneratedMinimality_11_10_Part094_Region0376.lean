import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0376 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8050 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3112 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3051 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4909 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6342 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6785 false 0)))))) (some (.node (some (.node none (some (.leaf 6908 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3688 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3044 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2921 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2079 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 741 false 0)))))) (some (.node (some (.node none (some (.leaf 210 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3011 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2893 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2061 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 839 false 0)))))) (some (.node (some (.node none (some (.leaf 847 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2782 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2501 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2594 false 0)))))) (some (.node (some (.node none (some (.leaf 2619 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3392 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3494 false 0)))))) (some (.node (some (.node none (some (.leaf 3528 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3784 false 0)))))) (some (.node (some (.node none (some (.leaf 3816 false 0)))) none)))) none)))))))))))

theorem region_0376_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURURRRRURR") region_0376 = true := by
  unfold region_0376
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

