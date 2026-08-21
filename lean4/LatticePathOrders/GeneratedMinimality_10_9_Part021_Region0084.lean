import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0084 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2061 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1218 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1193 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1111 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1111 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1193 false 0)))))) (some (.node (some (.node none (some (.leaf 1218 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1214 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1189 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1108 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 850 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 307 false 0)))))) (some (.node (some (.node none (some (.leaf 84 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1180 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1099 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 843 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 305 false 0)))))) (some (.node (some (.node none (some (.leaf 85 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1064 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 813 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 299 false 0)))))) (some (.node (some (.node none (some (.leaf 111 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 706 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 271 false 0)))))) (some (.node (some (.node none (some (.leaf 119 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 583 false 0)))))) (some (.node (some (.node none (some (.leaf 121 false 0)))) none)))) none)))))))))))

theorem region_0084_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRURRRRRUR") region_0084 = true := by
  unfold region_0084
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

