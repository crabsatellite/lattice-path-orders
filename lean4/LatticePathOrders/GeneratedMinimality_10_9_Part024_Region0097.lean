import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0097 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2477 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1149 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1194 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2016 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2310 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2400 false 0)))))) (some (.node (some (.node none (some (.leaf 2439 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1210 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1139 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1055 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 812 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 298 false 0)))))) (some (.node (some (.node none (some (.leaf 117 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1128 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1031 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1054 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1093 false 0)))))) (some (.node (some (.node none (some (.leaf 1105 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1627 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1821 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1874 false 0)))))) (some (.node (some (.node none (some (.leaf 1887 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2141 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2166 false 0)))))) (some (.node (some (.node none (some (.leaf 2173 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2288 false 0)))))) (some (.node (some (.node none (some (.leaf 2301 false 0)))) none)))) none)))))))))))

theorem region_0097_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRURRURRRR") region_0097 = true := by
  unfold region_0097
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

