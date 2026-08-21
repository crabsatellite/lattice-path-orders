import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0017 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52107 true 16)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51954 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51383 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49285 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42109 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39290 false 0)))))) (some (.node (some (.node none (some (.leaf 39291 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51831 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51232 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49141 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41984 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39673 false 0)))))) (some (.node (some (.node none (some (.leaf 39674 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50802 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48650 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41521 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39897 false 0)))))) (some (.node (some (.node none (some (.leaf 39898 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47197 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39925 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39926 false 0)))))) (some (.node (some (.node none (some (.leaf 39927 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39928 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39929 false 0)))))) (some (.node (some (.node none (some (.leaf 39930 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 39931 false 0)))))) (some (.node (some (.node none (some (.leaf 39932 false 0)))) none)))) none)))))))))))

theorem region_0017_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRRUUURUR") region_0017 = true := by
  unfold region_0017
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

