import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0142 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8039 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7661 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7538 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7241 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6319 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6756 true 9)))))) (some (.node (some (.node none (some (.leaf 6880 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7639 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7527 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7230 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6114 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3391 true 10)))))) (some (.node (some (.node none (some (.leaf 1171 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7487 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7185 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6054 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3351 true 10)))))) (some (.node (some (.node none (some (.leaf 1172 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7055 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5701 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3168 true 10)))))) (some (.node (some (.node none (some (.leaf 2572 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5174 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3427 true 10)))))) (some (.node (some (.node none (some (.leaf 3460 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3718 true 10)))))) (some (.node (some (.node none (some (.leaf 3745 true 10)))) none)))) none)))))))))))

theorem region_0142_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRUURRRURR") region_0142 = true := by
  unfold region_0142
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

