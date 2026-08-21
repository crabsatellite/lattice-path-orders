import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2461 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49226 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17196 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16760 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 28447 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 37973 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40982 false 0)))))) (some (.node (some (.node none (some (.leaf 41804 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 21067 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16730 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15629 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10807 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3277 false 0)))))) (some (.node (some (.node none (some (.leaf 864 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16599 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15524 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10485 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3887 false 0)))))) (some (.node (some (.node none (some (.leaf 3912 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15078 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13595 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 14100 false 0)))))) (some (.node (some (.node none (some (.leaf 14221 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 19241 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19872 false 0)))))) (some (.node (some (.node none (some (.leaf 20040 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 21743 false 0)))))) (some (.node (some (.node none (some (.leaf 21904 false 0)))) none)))) none)))))))))))

theorem region_2461_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURRRRRURR") region_2461 = true := by
  unfold region_2461
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

