import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0108 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8270 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7971 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7832 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7349 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7238 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7535 true 9)))))) (some (.node (some (.node none (some (.leaf 7653 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7957 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7818 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7341 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6304 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3522 true 10)))))) (some (.node (some (.node none (some (.leaf 917 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7764 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7313 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6247 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3484 true 10)))))) (some (.node (some (.node none (some (.leaf 2154 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7224 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6062 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4497 true 10)))))) (some (.node (some (.node none (some (.leaf 4525 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5340 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5290 true 10)))))) (some (.node (some (.node none (some (.leaf 5325 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5575 true 10)))))) (some (.node (some (.node none (some (.leaf 5653 true 10)))) none)))) none)))))))))))

theorem region_0108_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRUURRR") region_0108 = true := by
  unfold region_0108
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

