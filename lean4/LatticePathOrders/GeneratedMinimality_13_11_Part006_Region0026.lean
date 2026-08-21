import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0026 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52096 true 14)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51938 true 14)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51366 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49269 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42095 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22727 true 14)))))) (some (.node (some (.node none (some (.leaf 11688 true 14)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51806 true 14)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51216 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49126 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41971 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22639 true 14)))))) (some (.node (some (.node none (some (.leaf 13631 true 14)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50783 true 14)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48605 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41495 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22327 true 14)))))) (some (.node (some (.node none (some (.leaf 14143 true 14)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47115 true 14)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39913 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21295 true 14)))))) (some (.node (some (.node none (some (.leaf 14273 true 14)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35417 true 14)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17929 true 14)))))) (some (.node (some (.node none (some (.leaf 14307 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 14312 true 14)))))) (some (.node (some (.node none (some (.leaf 14316 true 14)))) none)))) none)))))))))))

theorem region_0026_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRURRUUUR") region_0026 = true := by
  unfold region_0026
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

