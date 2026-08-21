import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2372 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 42014 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17521 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17076 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16104 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20067 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21926 false 0)))))) (some (.node (some (.node none (some (.leaf 22425 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17495 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17029 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16062 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11104 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3404 false 0)))))) (some (.node (some (.node none (some (.leaf 812 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16846 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15908 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11002 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3352 false 0)))))) (some (.node (some (.node none (some (.leaf 790 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15250 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 9565 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3174 false 0)))))) (some (.node (some (.node none (some (.leaf 1085 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7050 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2623 false 0)))))) (some (.node (some (.node none (some (.leaf 1128 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 9254 false 0)))))) (some (.node (some (.node none (some (.leaf 1315 false 0)))) none)))) none)))))))))))

theorem region_2372_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRRURRRRUR") region_2372 = true := by
  unfold region_2372
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

