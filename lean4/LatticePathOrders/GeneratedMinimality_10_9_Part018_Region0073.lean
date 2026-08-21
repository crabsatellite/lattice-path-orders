import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0073 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2484 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1748 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1724 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2044 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2345 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2434 false 0)))))) (some (.node (some (.node none (some (.leaf 2463 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1746 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1717 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1626 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1397 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 705 false 0)))))) (some (.node (some (.node none (some (.leaf 422 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1691 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1616 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1390 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1159 false 0)))))) (some (.node (some (.node none (some (.leaf 1175 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1690 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1926 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1972 false 0)))))) (some (.node (some (.node none (some (.leaf 1996 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2211 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2260 false 0)))))) (some (.node (some (.node none (some (.leaf 2287 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2377 false 0)))))) (some (.node (some (.node none (some (.leaf 2387 false 0)))) none)))) none)))))))))))

theorem region_0073_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRUURRRRR") region_0073 = true := by
  unfold region_0073
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

