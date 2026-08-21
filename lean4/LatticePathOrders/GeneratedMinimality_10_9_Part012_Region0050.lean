import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0050 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2059 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2049 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2017 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1897 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1503 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1190 true 9)))))) (some (.node (some (.node none (some (.leaf 1213 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2045 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2012 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1892 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1501 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 851 false 0)))))) (some (.node (some (.node none (some (.leaf 110 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2000 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1881 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1496 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 844 false 0)))))) (some (.node (some (.node none (some (.leaf 99 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1835 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1476 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 814 false 0)))))) (some (.node (some (.node none (some (.leaf 100 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1400 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 683 false 0)))))) (some (.node (some (.node none (some (.leaf 104 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 602 false 0)))))) (some (.node (some (.node none (some (.leaf 118 false 0)))) none)))) none)))))))))))

theorem region_0050_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRURRRRUR") region_0050 = true := by
  unfold region_0050
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

