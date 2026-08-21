import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0257 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6946 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5814 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5712 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5355 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4549 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3841 true 9)))))) (some (.node (some (.node none (some (.leaf 3927 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5804 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5691 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5347 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4543 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2164 false 0)))))) (some (.node (some (.node none (some (.leaf 1228 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5601 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5311 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4516 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2149 false 0)))))) (some (.node (some (.node none (some (.leaf 1227 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5175 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4388 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2011 false 0)))))) (some (.node (some (.node none (some (.leaf 1225 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4092 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1392 false 0)))))) (some (.node (some (.node none (some (.leaf 1224 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1816 false 0)))))) (some (.node (some (.node none (some (.leaf 1223 false 0)))) none)))) none)))))))))))

theorem region_0257_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRUURRRRRUR") region_0257 = true := by
  unfold region_0257
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

