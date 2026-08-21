import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0090 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2452 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1204 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1178 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1898 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2178 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2311 false 0)))))) (some (.node (some (.node none (some (.leaf 2350 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1201 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1170 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1095 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 842 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 304 false 0)))))) (some (.node (some (.node none (some (.leaf 109 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1160 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1080 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 829 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 841 false 0)))))) (some (.node (some (.node none (some (.leaf 847 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1398 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1474 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1493 false 0)))))) (some (.node (some (.node none (some (.leaf 1499 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1833 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1877 false 0)))))) (some (.node (some (.node none (some (.leaf 1888 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1997 false 0)))))) (some (.node (some (.node none (some (.leaf 2007 false 0)))) none)))) none)))))))))))

theorem region_0090_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRURRRURRR") region_0090 = true := by
  unfold region_0090
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

