import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0046 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52082 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51929 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51359 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49262 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42088 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 32652 true 17)))))) (some (.node (some (.node none (some (.leaf 33879 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51781 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51209 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49119 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41964 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22633 true 17)))))) (some (.node (some (.node none (some (.leaf 20952 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50773 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48598 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41488 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22321 true 17)))))) (some (.node (some (.node none (some (.leaf 20953 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47099 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39906 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21289 true 17)))))) (some (.node (some (.node none (some (.leaf 20956 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35409 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 20954 false 0)))))) (some (.node (some (.node none (some (.leaf 20957 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 20955 false 0)))))) (some (.node (some (.node none (some (.leaf 20958 false 0)))) none)))) none)))))))))))

theorem region_0046_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUURUURR") region_0046 = true := by
  unfold region_0046
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

