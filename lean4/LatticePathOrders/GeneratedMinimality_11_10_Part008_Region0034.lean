import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0034 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8435 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8409 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8301 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7979 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7193 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7468 true 9)))))) (some (.node (some (.node none (some (.leaf 7561 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8402 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8271 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7960 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6869 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5412 false 0)))))) (some (.node (some (.node none (some (.leaf 5420 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8222 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7905 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6821 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5427 false 0)))))) (some (.node (some (.node none (some (.leaf 5436 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7632 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6545 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5428 false 0)))))) (some (.node (some (.node none (some (.leaf 5437 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5799 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5429 false 0)))))) (some (.node (some (.node none (some (.leaf 5438 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5430 false 0)))))) (some (.node (some (.node none (some (.leaf 5439 false 0)))) none)))) none)))))))))))

theorem region_0034_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRUUURRR") region_0034 = true := by
  unfold region_0034
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

