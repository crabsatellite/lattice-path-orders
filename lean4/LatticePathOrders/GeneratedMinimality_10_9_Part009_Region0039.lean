import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0039 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2471 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2258 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2225 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2143 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2293 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2390 false 0)))))) (some (.node (some (.node none (some (.leaf 2415 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2252 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2222 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2140 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1832 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1062 true 10)))))) (some (.node (some (.node none (some (.leaf 409 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2212 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2128 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1816 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1051 false 0)))))) (some (.node (some (.node none (some (.leaf 1062 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2091 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1721 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1816 false 0)))))) (some (.node (some (.node none (some (.leaf 1832 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2091 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2128 false 0)))))) (some (.node (some (.node none (some (.leaf 2140 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2212 false 0)))))) (some (.node (some (.node none (some (.leaf 2222 false 0)))) none)))) none)))))))))))

theorem region_0039_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRRUURRRR") region_0039 = true := by
  unfold region_0039
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

