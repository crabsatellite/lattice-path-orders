import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0033 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52090 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51935 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51364 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49267 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42093 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22725 true 17)))))) (some (.node (some (.node none (some (.leaf 16441 true 17)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51796 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51214 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49124 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41969 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22637 true 17)))))) (some (.node (some (.node none (some (.leaf 1454 true 17)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50780 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48603 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41493 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22325 true 17)))))) (some (.node (some (.node none (some (.leaf 1408 true 17)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47112 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39911 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21293 true 17)))))) (some (.node (some (.node none (some (.leaf 1304 true 17)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35414 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17927 true 17)))))) (some (.node (some (.node none (some (.leaf 1035 true 17)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10784 true 17)))))) (some (.node (some (.node none (some (.leaf 908 false 0)))) none)))) none)))))))))))

theorem region_0033_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRURUURUR") region_0033 = true := by
  unfold region_0033
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

