import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0095 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8041 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8002 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7863 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7363 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6343 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3552 true 9)))))) (some (.node (some (.node none (some (.leaf 3108 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7988 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7846 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7354 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6328 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3541 true 14)))))) (some (.node (some (.node none (some (.leaf 307 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7803 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7331 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6281 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3509 true 14)))))) (some (.node (some (.node none (some (.leaf 266 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7244 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6078 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3369 true 14)))))) (some (.node (some (.node none (some (.leaf 257 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5356 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2928 true 14)))))) (some (.node (some (.node none (some (.leaf 195 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1836 true 14)))))) (some (.node (some (.node none (some (.leaf 105 true 14)))) none)))) none)))))))))))

theorem region_0095_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRRURUR") region_0095 = true := by
  unfold region_0095
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

