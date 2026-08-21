import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0067 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8274 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8240 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8151 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7802 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6728 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3799 true 9)))))) (some (.node (some (.node none (some (.leaf 3860 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8230 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8139 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7782 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6716 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3787 true 12)))))) (some (.node (some (.node none (some (.leaf 1223 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8101 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7673 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6632 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3736 true 12)))))) (some (.node (some (.node none (some (.leaf 1224 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7488 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6453 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3616 true 12)))))) (some (.node (some (.node none (some (.leaf 1225 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5600 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3012 true 12)))))) (some (.node (some (.node none (some (.leaf 1227 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1833 true 12)))))) (some (.node (some (.node none (some (.leaf 1228 true 12)))) none)))) none)))))))))))

theorem region_0067_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRUURRRUR") region_0067 = true := by
  unfold region_0067
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

