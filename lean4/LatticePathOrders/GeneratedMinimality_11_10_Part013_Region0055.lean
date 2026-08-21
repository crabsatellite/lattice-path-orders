import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0055 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8349 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8298 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8174 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7842 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6765 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6474 true 9)))))) (some (.node (some (.node none (some (.leaf 6536 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8279 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8166 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7824 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6748 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3815 true 10)))))) (some (.node (some (.node none (some (.leaf 313 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8138 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7748 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6676 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3764 true 10)))))) (some (.node (some (.node none (some (.leaf 716 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7528 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6491 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3648 true 10)))))) (some (.node (some (.node none (some (.leaf 2023 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5690 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3043 true 10)))))) (some (.node (some (.node none (some (.leaf 2841 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2972 true 10)))))) (some (.node (some (.node none (some (.leaf 2990 true 10)))) none)))) none)))))))))))

theorem region_0055_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURURURR") region_0055 = true := by
  unfold region_0055
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

