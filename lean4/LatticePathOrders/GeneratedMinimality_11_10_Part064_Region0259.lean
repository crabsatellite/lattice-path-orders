import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0259 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8047 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5812 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5710 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5354 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6340 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6783 false 0)))))) (some (.node (some (.node none (some (.leaf 6906 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5802 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5689 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5345 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4541 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2163 true 10)))))) (some (.node (some (.node none (some (.leaf 1194 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5599 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5309 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4514 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2148 true 10)))))) (some (.node (some (.node none (some (.leaf 1193 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5173 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4386 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2584 true 10)))))) (some (.node (some (.node none (some (.leaf 2616 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4091 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3486 true 10)))))) (some (.node (some (.node none (some (.leaf 3524 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3777 true 10)))))) (some (.node (some (.node none (some (.leaf 3809 true 10)))) none)))) none)))))))))))

theorem region_0259_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRUURRRRURR") region_0259 = true := by
  unfold region_0259
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

