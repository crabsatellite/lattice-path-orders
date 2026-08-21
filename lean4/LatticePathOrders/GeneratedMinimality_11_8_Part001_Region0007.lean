import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0007 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2043 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2035 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2019 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1960 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1823 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1932 true 9)))))) (some (.node (some (.node none (some (.leaf 1961 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2034 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2016 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1957 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1741 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1083 true 10)))))) (some (.node (some (.node none (some (.leaf 122 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2000 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1942 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1727 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1074 true 10)))))) (some (.node (some (.node none (some (.leaf 760 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1891 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1674 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1285 true 10)))))) (some (.node (some (.node none (some (.leaf 1288 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1577 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1608 true 10)))))) (some (.node (some (.node none (some (.leaf 1615 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1708 true 10)))))) (some (.node (some (.node none (some (.leaf 1716 true 10)))) none)))) none)))))))))))

theorem region_0007_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRRURRR") region_0007 = true := by
  unfold region_0007
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

