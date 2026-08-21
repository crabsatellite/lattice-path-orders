import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0075 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2049 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1085 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1091 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1752 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1969 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2028 false 0)))))) (some (.node (some (.node none (some (.leaf 2044 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1084 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1066 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 996 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 759 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 278 false 0)))))) (some (.node (some (.node none (some (.leaf 123 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1061 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 992 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1045 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1079 false 0)))))) (some (.node (some (.node none (some (.leaf 1087 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1534 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1684 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1734 false 0)))))) (some (.node (some (.node none (some (.leaf 1747 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1901 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1949 false 0)))))) (some (.node (some (.node none (some (.leaf 1964 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2009 false 0)))))) (some (.node (some (.node none (some (.leaf 2023 false 0)))) none)))) none)))))))))))

theorem region_0075_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRRRRRR") region_0075 = true := by
  unfold region_0075
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

