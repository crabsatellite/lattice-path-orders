import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2422 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51879 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17459 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 21989 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 40961 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47973 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 50055 false 0)))))) (some (.node (some (.node none (some (.leaf 51000 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22375 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16943 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15991 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11056 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3378 false 0)))))) (some (.node (some (.node none (some (.leaf 1299 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16813 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16085 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 19009 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19791 false 0)))))) (some (.node (some (.node none (some (.leaf 19987 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 31219 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36228 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37472 false 0)))))) (some (.node (some (.node none (some (.leaf 37760 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 43772 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 44324 false 0)))))) (some (.node (some (.node none (some (.leaf 44478 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 47482 false 0)))))) (some (.node (some (.node none (some (.leaf 47745 false 0)))) none)))) none)))))))))))

theorem region_2422_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRURRURRRR") region_2422 = true := by
  unfold region_2422
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

