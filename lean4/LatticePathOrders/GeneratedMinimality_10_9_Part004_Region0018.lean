import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0018 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2425 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2415 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2390 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2293 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2143 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2225 true 9)))))) (some (.node (some (.node none (some (.leaf 2258 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2413 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2387 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2287 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1996 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1175 true 10)))))) (some (.node (some (.node none (some (.leaf 422 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2377 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2260 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1972 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1159 true 10)))))) (some (.node (some (.node none (some (.leaf 705 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2211 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1926 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1390 true 10)))))) (some (.node (some (.node none (some (.leaf 1397 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1690 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1616 true 10)))))) (some (.node (some (.node none (some (.leaf 1626 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1691 true 10)))))) (some (.node (some (.node none (some (.leaf 1717 true 10)))) none)))) none)))))))))))

theorem region_0018_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRRUURRR") region_0018 = true := by
  unfold region_0018
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

