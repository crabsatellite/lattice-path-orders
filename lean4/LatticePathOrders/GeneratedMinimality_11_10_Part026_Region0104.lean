import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0104 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8024 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7975 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7840 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7352 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6326 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6499 true 9)))))) (some (.node (some (.node none (some (.leaf 6556 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7964 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7825 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7344 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6309 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3529 true 10)))))) (some (.node (some (.node none (some (.leaf 305 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7777 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7318 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6260 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3492 true 10)))))) (some (.node (some (.node none (some (.leaf 737 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7231 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6066 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3362 true 10)))))) (some (.node (some (.node none (some (.leaf 2069 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5346 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2922 true 10)))))) (some (.node (some (.node none (some (.leaf 2906 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3001 true 10)))))) (some (.node (some (.node none (some (.leaf 3026 true 10)))) none)))) none)))))))))))

theorem region_0104_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURRURURR") region_0104 = true := by
  unfold region_0104
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

