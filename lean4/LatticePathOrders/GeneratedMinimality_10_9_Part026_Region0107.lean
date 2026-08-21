import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0107 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2485 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 980 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1217 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2048 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2349 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2438 false 0)))))) (some (.node (some (.node none (some (.leaf 2466 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1214 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 963 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 932 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 682 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 270 false 0)))))) (some (.node (some (.node none (some (.leaf 120 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 952 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 962 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1138 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1169 false 0)))))) (some (.node (some (.node none (some (.leaf 1184 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1719 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1937 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1985 false 0)))))) (some (.node (some (.node none (some (.leaf 2006 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2223 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2279 false 0)))))) (some (.node (some (.node none (some (.leaf 2300 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2388 false 0)))))) (some (.node (some (.node none (some (.leaf 2395 false 0)))) none)))) none)))))))))))

theorem region_0107_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRURURRRRR") region_0107 = true := by
  unfold region_0107
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

