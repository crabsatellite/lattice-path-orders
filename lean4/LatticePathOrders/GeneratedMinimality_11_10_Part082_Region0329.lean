import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0329 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8443 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3860 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3799 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6728 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7802 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8151 false 0)))))) (some (.node (some (.node none (some (.leaf 8240 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3899 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3745 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3460 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2572 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1172 false 0)))))) (some (.node (some (.node none (some (.leaf 1171 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3718 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3427 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3168 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3351 false 0)))))) (some (.node (some (.node none (some (.leaf 3391 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5174 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5701 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6054 false 0)))))) (some (.node (some (.node none (some (.leaf 6114 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7055 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7185 false 0)))))) (some (.node (some (.node none (some (.leaf 7230 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7487 false 0)))))) (some (.node (some (.node none (some (.leaf 7527 false 0)))) none)))) none)))))))))))

theorem region_0329_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRRUURRRR") region_0329 = true := by
  unfold region_0329
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

