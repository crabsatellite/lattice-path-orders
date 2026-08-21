import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0003 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8499 true 14)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8474 true 14)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8384 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8058 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6957 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5936 false 0)))))) (some (.node (some (.node none (some (.leaf 5937 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8451 true 14)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8359 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8034 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6935 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6614 false 0)))))) (some (.node (some (.node none (some (.leaf 6615 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8293 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7952 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6859 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6860 false 0)))))) (some (.node (some (.node none (some (.leaf 6861 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7725 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6935 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6936 false 0)))))) (some (.node (some (.node none (some (.leaf 6937 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6957 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6958 false 0)))))) (some (.node (some (.node none (some (.leaf 6959 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6961 false 0)))))) (some (.node (some (.node none (some (.leaf 6963 false 0)))) none)))) none)))))))))))

theorem region_0003_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRRRUUUR") region_0003 = true := by
  unfold region_0003
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

