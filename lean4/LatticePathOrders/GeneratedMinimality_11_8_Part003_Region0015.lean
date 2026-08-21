import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0015 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2043 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2020 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1990 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1931 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1931 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1990 false 0)))))) (some (.node (some (.node none (some (.leaf 2020 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2018 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1989 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1929 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1715 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1067 true 10)))))) (some (.node (some (.node none (some (.leaf 117 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1985 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1919 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1704 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1058 true 10)))))) (some (.node (some (.node none (some (.leaf 997 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1859 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1652 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1607 true 10)))))) (some (.node (some (.node none (some (.leaf 1616 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1802 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1818 true 10)))))) (some (.node (some (.node none (some (.leaf 1822 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1922 true 10)))))) (some (.node (some (.node none (some (.leaf 1930 true 10)))) none)))) none)))))))))))

theorem region_0015_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRURRRR") region_0015 = true := by
  unfold region_0015
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

