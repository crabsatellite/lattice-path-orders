import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0041 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52086 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51933 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51362 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49265 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42091 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22724 true 17)))))) (some (.node (some (.node none (some (.leaf 10203 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51787 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51212 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49122 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41967 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22635 true 17)))))) (some (.node (some (.node none (some (.leaf 10256 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50778 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48601 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41491 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22323 true 17)))))) (some (.node (some (.node none (some (.leaf 10272 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47104 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39909 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21291 true 17)))))) (some (.node (some (.node none (some (.leaf 10273 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35412 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17925 true 17)))))) (some (.node (some (.node none (some (.leaf 10274 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10782 true 17)))))) (some (.node (some (.node none (some (.leaf 10275 false 0)))) none)))) none)))))))))))

theorem region_0041_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUURRUUR") region_0041 = true := by
  unfold region_0041
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

