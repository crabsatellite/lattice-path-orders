import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2465 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51321 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17195 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 20129 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 37974 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 44598 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47996 false 0)))))) (some (.node (some (.node none (some (.leaf 48942 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22138 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16728 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15627 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10805 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3275 false 0)))))) (some (.node (some (.node none (some (.leaf 1187 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16598 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15522 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13616 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 14125 false 0)))))) (some (.node (some (.node none (some (.leaf 14233 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 26232 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 27868 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 28297 false 0)))))) (some (.node (some (.node none (some (.leaf 28400 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36621 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37616 false 0)))))) (some (.node (some (.node none (some (.leaf 37855 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 40619 false 0)))))) (some (.node (some (.node none (some (.leaf 40870 false 0)))) none)))) none)))))))))))

theorem region_2465_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURRRRURRR") region_2465 = true := by
  unfold region_2465
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

