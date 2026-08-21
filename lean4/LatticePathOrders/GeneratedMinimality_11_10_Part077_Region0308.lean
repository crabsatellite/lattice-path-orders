import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0308 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8277 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3908 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3822 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6124 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7243 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7540 false 0)))))) (some (.node (some (.node none (some (.leaf 7665 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3899 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3809 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3524 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2616 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1193 false 0)))))) (some (.node (some (.node none (some (.leaf 1194 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3777 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3486 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2584 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2148 false 0)))))) (some (.node (some (.node none (some (.leaf 2163 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4091 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4386 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4514 false 0)))))) (some (.node (some (.node none (some (.leaf 4541 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5173 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5309 false 0)))))) (some (.node (some (.node none (some (.leaf 5345 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5599 false 0)))))) (some (.node (some (.node none (some (.leaf 5689 false 0)))) none)))) none)))))))))))

theorem region_0308_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRRUURRR") region_0308 = true := by
  unfold region_0308
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

