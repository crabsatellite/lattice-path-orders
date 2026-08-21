import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0029 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2047 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1961 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1932 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1823 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1960 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2019 false 0)))))) (some (.node (some (.node none (some (.leaf 2035 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1959 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1930 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1822 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1616 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 997 false 0)))))) (some (.node (some (.node none (some (.leaf 117 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1922 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1818 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1607 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1058 false 0)))))) (some (.node (some (.node none (some (.leaf 1067 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1802 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1652 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1704 false 0)))))) (some (.node (some (.node none (some (.leaf 1715 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1859 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1919 false 0)))))) (some (.node (some (.node none (some (.leaf 1929 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1985 false 0)))))) (some (.node (some (.node none (some (.leaf 1989 false 0)))) none)))) none)))))))))))

theorem region_0029_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRURRRRR") region_0029 = true := by
  unfold region_0029
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

