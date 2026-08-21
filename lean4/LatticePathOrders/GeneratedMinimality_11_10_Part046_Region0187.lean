import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0187 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7939 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6884 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6763 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6324 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6077 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6503 true 9)))))) (some (.node (some (.node none (some (.leaf 6560 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6873 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6749 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6310 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4897 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2620 true 10)))))) (some (.node (some (.node none (some (.leaf 279 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6714 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6266 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4876 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2598 true 10)))))) (some (.node (some (.node none (some (.leaf 740 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6115 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4804 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2505 true 10)))))) (some (.node (some (.node none (some (.leaf 2075 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4542 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2891 true 10)))))) (some (.node (some (.node none (some (.leaf 2917 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3007 true 10)))))) (some (.node (some (.node none (some (.leaf 3039 true 10)))) none)))) none)))))))))))

theorem region_0187_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRURURR") region_0187 = true := by
  unfold region_0187
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

