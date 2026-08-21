import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0030 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8438 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8413 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8308 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7984 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6891 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6407 true 9)))))) (some (.node (some (.node none (some (.leaf 6521 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8405 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8278 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7963 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6872 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3901 true 16)))))) (some (.node (some (.node none (some (.leaf 2959 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8227 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7908 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6824 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3867 true 16)))))) (some (.node (some (.node none (some (.leaf 2961 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7638 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6548 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3685 true 16)))))) (some (.node (some (.node none (some (.leaf 2962 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5801 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3102 true 16)))))) (some (.node (some (.node none (some (.leaf 2963 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2960 false 0)))))) (some (.node (some (.node none (some (.leaf 2964 false 0)))) none)))) none)))))))))))

theorem region_0030_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRUURURR") region_0030 = true := by
  unfold region_0030
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

