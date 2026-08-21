import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0003 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2047 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2042 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2027 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1968 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1751 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1717 true 9)))))) (some (.node (some (.node none (some (.leaf 1744 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2038 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2023 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1964 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1747 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1087 true 10)))))) (some (.node (some (.node none (some (.leaf 123 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2009 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1949 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1734 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1079 true 10)))))) (some (.node (some (.node none (some (.leaf 278 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1901 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1684 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1045 true 10)))))) (some (.node (some (.node none (some (.leaf 759 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1534 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 992 true 10)))))) (some (.node (some (.node none (some (.leaf 996 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1061 true 10)))))) (some (.node (some (.node none (some (.leaf 1066 true 10)))) none)))) none)))))))))))

theorem region_0003_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRRRURR") region_0003 = true := by
  unfold region_0003
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

