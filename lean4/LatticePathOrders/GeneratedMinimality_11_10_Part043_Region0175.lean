import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0175 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6946 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6912 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6789 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6346 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4911 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2640 false 0)))))) (some (.node (some (.node none (some (.leaf 1998 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6902 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6776 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6336 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4907 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3055 false 0)))))) (some (.node (some (.node none (some (.leaf 3056 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6732 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6293 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4889 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3663 false 0)))))) (some (.node (some (.node none (some (.leaf 3664 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6128 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4816 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3794 false 0)))))) (some (.node (some (.node none (some (.leaf 3795 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4553 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3838 false 0)))))) (some (.node (some (.node none (some (.leaf 3840 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3847 false 0)))))) (some (.node (some (.node none (some (.leaf 3849 false 0)))) none)))) none)))))))))))

theorem region_0175_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRRRUUR") region_0175 = true := by
  unfold region_0175
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

