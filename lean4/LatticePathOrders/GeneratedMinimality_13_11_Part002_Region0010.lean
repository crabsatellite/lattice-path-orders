import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0010 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52109 true 16)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51956 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51385 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49287 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42111 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22739 true 16)))))) (some (.node (some (.node none (some (.leaf 6162 true 16)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51833 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51234 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49143 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41986 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22649 true 16)))))) (some (.node (some (.node none (some (.leaf 1458 true 16)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50804 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48654 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41523 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22350 true 16)))))) (some (.node (some (.node none (some (.leaf 1416 true 16)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47201 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39927 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21305 true 16)))))) (some (.node (some (.node none (some (.leaf 1308 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35450 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17938 true 16)))))) (some (.node (some (.node none (some (.leaf 1313 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10797 true 16)))))) (some (.node (some (.node none (some (.leaf 1314 false 0)))) none)))) none)))))))))))

theorem region_0010_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRRURUUUR") region_0010 = true := by
  unfold region_0010
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

