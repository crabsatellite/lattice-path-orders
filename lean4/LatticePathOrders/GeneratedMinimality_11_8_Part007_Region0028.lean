import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0028 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1832 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1617 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1619 false 0)))))) (some (.node (some (.node none (some (.leaf 1626 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1618 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1620 false 0)))))) (some (.node (some (.node none (some (.leaf 1627 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1621 false 0)))))) (some (.node (some (.node none (some (.leaf 1628 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1622 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1623 false 0)))))) (some (.node (some (.node none (some (.leaf 1629 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1624 false 0)))))) (some (.node (some (.node none (some (.leaf 1631 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1634 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1637 false 0)))))) (some (.node (some (.node none (some (.leaf 1642 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1638 false 0)))))) (some (.node (some (.node none (some (.leaf 1643 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0028_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRUUURU") region_0028 = true := by
  unfold region_0028
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

