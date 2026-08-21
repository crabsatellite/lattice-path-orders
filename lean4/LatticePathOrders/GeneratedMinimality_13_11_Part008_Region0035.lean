import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0035 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52087 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51934 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51363 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49266 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42092 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 31647 true 17)))))) (some (.node (some (.node none (some (.leaf 31901 true 17)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51791 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51213 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49123 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41968 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22636 true 17)))))) (some (.node (some (.node none (some (.leaf 7604 true 17)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50779 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48602 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41492 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22324 true 17)))))) (some (.node (some (.node none (some (.leaf 4275 true 17)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47111 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39910 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21292 true 17)))))) (some (.node (some (.node none (some (.leaf 4173 true 17)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35413 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17926 true 17)))))) (some (.node (some (.node none (some (.leaf 5806 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10783 true 17)))))) (some (.node (some (.node none (some (.leaf 6084 false 0)))) none)))) none)))))))))))

theorem region_0035_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRURUUURR") region_0035 = true := by
  unfold region_0035
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

