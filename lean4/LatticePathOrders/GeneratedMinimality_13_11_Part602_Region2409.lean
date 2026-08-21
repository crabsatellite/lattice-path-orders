import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2409 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 42045 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17464 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16977 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16018 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20114 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21988 false 0)))))) (some (.node (some (.node none (some (.leaf 22505 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17501 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16948 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15996 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11061 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3383 false 0)))))) (some (.node (some (.node none (some (.leaf 810 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16818 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15847 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10952 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3332 false 0)))))) (some (.node (some (.node none (some (.leaf 878 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15179 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 9527 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3155 false 0)))))) (some (.node (some (.node none (some (.leaf 1206 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7006 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2615 false 0)))))) (some (.node (some (.node none (some (.leaf 1328 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 9253 false 0)))))) (some (.node (some (.node none (some (.leaf 1351 false 0)))) none)))) none)))))))))))

theorem region_2409_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRURRRRRUR") region_2409 = true := by
  unfold region_2409
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

