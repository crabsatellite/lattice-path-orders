import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0043 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8373 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8330 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8187 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7866 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6788 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3847 true 13)))))) (some (.node (some (.node none (some (.leaf 1973 true 13)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8319 true 13)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8180 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7852 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6775 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3838 true 13)))))) (some (.node (some (.node none (some (.leaf 2086 true 13)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8155 true 13)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7791 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6720 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3794 true 13)))))) (some (.node (some (.node none (some (.leaf 2518 true 13)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7544 true 13)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6508 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3663 true 13)))))) (some (.node (some (.node none (some (.leaf 2612 true 13)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5716 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3055 true 13)))))) (some (.node (some (.node none (some (.leaf 2636 true 13)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2640 true 13)))))) (some (.node (some (.node none (some (.leaf 2642 true 13)))) none)))) none)))))))))))

theorem region_0043_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURRRUUR") region_0043 = true := by
  unfold region_0043
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

