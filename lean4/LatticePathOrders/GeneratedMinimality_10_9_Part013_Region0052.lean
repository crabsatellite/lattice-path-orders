import LatticePathOrders.GeneratedMinimality_10_9_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def region_0052 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2361 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2042 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2011 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1893 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1893 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2011 false 0)))))) (some (.node (some (.node none (some (.leaf 2042 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2039 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2007 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1888 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1499 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 847 true 10)))))) (some (.node (some (.node none (some (.leaf 109 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1997 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1877 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1493 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 841 true 10)))))) (some (.node (some (.node none (some (.leaf 304 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1833 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1474 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 829 true 10)))))) (some (.node (some (.node none (some (.leaf 842 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1398 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1080 true 10)))))) (some (.node (some (.node none (some (.leaf 1095 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1160 true 10)))))) (some (.node (some (.node none (some (.leaf 1170 true 10)))) none)))) none)))))))))))

theorem region_0052_check :
    AssignmentTree.check 10 9 classes 9 (mustParsePath "RRRURRRURR") region_0052 = true := by
  unfold region_0052
  rfl

end LatticePathOrders.GeneratedMinimality_10_9

