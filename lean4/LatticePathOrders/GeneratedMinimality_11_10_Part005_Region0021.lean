import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0021 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8453 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8424 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8325 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8001 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6907 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3928 true 9)))))) (some (.node (some (.node none (some (.leaf 3062 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8415 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8303 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7977 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6885 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3913 true 16)))))) (some (.node (some (.node none (some (.leaf 330 true 16)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8241 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7921 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6837 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3879 true 16)))))) (some (.node (some (.node none (some (.leaf 321 true 16)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7666 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6561 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3697 true 16)))))) (some (.node (some (.node none (some (.leaf 293 true 16)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5815 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3113 true 16)))))) (some (.node (some (.node none (some (.leaf 221 true 16)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1999 true 16)))))) (some (.node (some (.node none (some (.leaf 121 true 16)))) none)))) none)))))))))))

theorem region_0021_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRURURUR") region_0021 = true := by
  unfold region_0021
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

