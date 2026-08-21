import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2374 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49178 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17519 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17074 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 28410 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 37879 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40867 false 0)))))) (some (.node (some (.node none (some (.leaf 41662 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 21057 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17025 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16060 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11103 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3403 false 0)))))) (some (.node (some (.node none (some (.leaf 851 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16844 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15905 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11001 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3843 false 0)))))) (some (.node (some (.node none (some (.leaf 3869 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15247 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13305 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 13835 false 0)))))) (some (.node (some (.node none (some (.leaf 14056 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 18958 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19510 false 0)))))) (some (.node (some (.node none (some (.leaf 19793 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 21392 false 0)))))) (some (.node (some (.node none (some (.leaf 21558 false 0)))) none)))) none)))))))))))

theorem region_2374_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRRURRRURR") region_2374 = true := by
  unfold region_2374
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

