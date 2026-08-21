import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0001 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2048 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2044 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2028 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1969 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1752 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1091 true 9)))))) (some (.node (some (.node none (some (.leaf 1085 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2040 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2025 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1966 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1749 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1089 true 12)))))) (some (.node (some (.node none (some (.leaf 124 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2012 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1951 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1736 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1081 true 12)))))) (some (.node (some (.node none (some (.leaf 121 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1905 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1687 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1048 true 12)))))) (some (.node (some (.node none (some (.leaf 114 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1539 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 918 true 12)))))) (some (.node (some (.node none (some (.leaf 121 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 620 true 12)))))) (some (.node (some (.node none (some (.leaf 124 false 0)))) none)))) none)))))))))))

theorem region_0001_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRRRRUR") region_0001 = true := by
  unfold region_0001
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

