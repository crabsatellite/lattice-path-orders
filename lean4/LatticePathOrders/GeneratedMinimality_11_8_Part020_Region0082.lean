import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0082 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1834 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1318 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1320 false 0)))))) (some (.node (some (.node none (some (.leaf 1414 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1332 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1333 false 0)))))) (some (.node (some (.node none (some (.leaf 1334 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1335 false 0)))))) (some (.node (some (.node none (some (.leaf 1337 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1360 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1361 false 0)))))) (some (.node (some (.node none (some (.leaf 1362 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1365 false 0)))))) (some (.node (some (.node none (some (.leaf 1367 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1510 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1511 false 0)))))) (some (.node (some (.node none (some (.leaf 1512 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1514 false 0)))))) (some (.node (some (.node none (some (.leaf 1517 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0082_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRRRUUU") region_0082 = true := by
  unfold region_0082
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

