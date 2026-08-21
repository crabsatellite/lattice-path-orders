import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0053 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52081 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51928 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51358 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49261 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42087 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39234 false 0)))))) (some (.node (some (.node none (some (.leaf 39235 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51778 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51208 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49118 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41963 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39278 false 0)))))) (some (.node (some (.node none (some (.leaf 39279 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50772 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48597 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41487 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39280 false 0)))))) (some (.node (some (.node none (some (.leaf 39281 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47098 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39905 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39282 false 0)))))) (some (.node (some (.node none (some (.leaf 39286 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39283 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 39284 false 0)))))) (some (.node (some (.node none (some (.leaf 39287 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 39285 false 0)))))) (some (.node (some (.node none (some (.leaf 39288 false 0)))) none)))) none)))))))))))

theorem region_0053_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUUURURR") region_0053 = true := by
  unfold region_0053
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

