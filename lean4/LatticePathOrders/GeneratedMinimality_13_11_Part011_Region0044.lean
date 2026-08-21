import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0044 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52085 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51932 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51361 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49264 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42090 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22723 true 17)))))) (some (.node (some (.node none (some (.leaf 17314 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51786 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51211 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49121 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41966 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22634 true 17)))))) (some (.node (some (.node none (some (.leaf 17408 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50777 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48600 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41490 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22322 true 17)))))) (some (.node (some (.node none (some (.leaf 17409 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47101 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39908 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21290 true 17)))))) (some (.node (some (.node none (some (.leaf 17411 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35411 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17924 true 17)))))) (some (.node (some (.node none (some (.leaf 17412 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 17410 false 0)))))) (some (.node (some (.node none (some (.leaf 17413 false 0)))) none)))) none)))))))))))

theorem region_0044_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUURURUR") region_0044 = true := by
  unfold region_0044
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

