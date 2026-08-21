import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0030 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52092 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51936 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51365 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49268 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42094 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22726 true 17)))))) (some (.node (some (.node none (some (.leaf 8548 true 17)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51799 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51215 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49125 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41970 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22638 true 17)))))) (some (.node (some (.node none (some (.leaf 1455 true 17)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50781 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48604 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41494 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22326 true 17)))))) (some (.node (some (.node none (some (.leaf 1409 true 17)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47113 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39912 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21294 true 17)))))) (some (.node (some (.node none (some (.leaf 1305 true 17)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35415 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17928 true 17)))))) (some (.node (some (.node none (some (.leaf 1036 true 17)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10785 true 17)))))) (some (.node (some (.node none (some (.leaf 517 true 17)))) none)))) none)))))))))))

theorem region_0030_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRURURUUR") region_0030 = true := by
  unfold region_0030
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

