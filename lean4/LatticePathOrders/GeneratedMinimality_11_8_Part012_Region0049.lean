import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0049 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2048 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1744 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1717 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1751 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1968 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2027 false 0)))))) (some (.node (some (.node none (some (.leaf 2042 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1743 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1716 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1615 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1288 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 760 false 0)))))) (some (.node (some (.node none (some (.leaf 122 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1708 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1608 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1285 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1074 false 0)))))) (some (.node (some (.node none (some (.leaf 1083 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1577 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1674 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1727 false 0)))))) (some (.node (some (.node none (some (.leaf 1741 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1891 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1942 false 0)))))) (some (.node (some (.node none (some (.leaf 1957 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2000 false 0)))))) (some (.node (some (.node none (some (.leaf 2016 false 0)))) none)))) none)))))))))))

theorem region_0049_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURRRRRR") region_0049 = true := by
  unfold region_0049
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

