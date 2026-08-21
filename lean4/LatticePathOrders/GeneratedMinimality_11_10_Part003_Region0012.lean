import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0012 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8489 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8449 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8363 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8038 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6938 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5489 false 0)))))) (some (.node (some (.node none (some (.leaf 5494 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8437 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8348 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8023 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6926 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5776 false 0)))))) (some (.node (some (.node none (some (.leaf 5777 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8269 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7937 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6851 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5860 false 0)))))) (some (.node (some (.node none (some (.leaf 5863 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7702 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6585 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5907 false 0)))))) (some (.node (some (.node none (some (.leaf 5909 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5910 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5913 false 0)))))) (some (.node (some (.node none (some (.leaf 5917 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5914 false 0)))))) (some (.node (some (.node none (some (.leaf 5920 false 0)))) none)))) none)))))))))))

theorem region_0012_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRRUUURR") region_0012 = true := by
  unfold region_0012
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

