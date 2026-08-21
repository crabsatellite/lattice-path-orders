import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2415 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51310 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17462 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 20115 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 37955 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 44588 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47974 false 0)))))) (some (.node (some (.node none (some (.leaf 48920 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22136 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16945 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15993 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11058 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3380 false 0)))))) (some (.node (some (.node none (some (.leaf 1185 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16816 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15844 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13553 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 14055 false 0)))))) (some (.node (some (.node none (some (.leaf 14187 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 26194 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 27822 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 28248 false 0)))))) (some (.node (some (.node none (some (.leaf 28363 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36573 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37501 false 0)))))) (some (.node (some (.node none (some (.leaf 37761 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 40536 false 0)))))) (some (.node (some (.node none (some (.leaf 40754 false 0)))) none)))) none)))))))))))

theorem region_2415_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRURRRURRR") region_2415 = true := by
  unfold region_2415
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

