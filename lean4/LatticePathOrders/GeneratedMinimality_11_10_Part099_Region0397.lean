import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0397 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8494 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3062 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3928 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6907 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 8001 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8325 false 0)))))) (some (.node (some (.node none (some (.leaf 8424 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3920 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2990 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2841 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2023 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 716 false 0)))))) (some (.node (some (.node none (some (.leaf 313 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2972 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3043 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3648 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3764 false 0)))))) (some (.node (some (.node none (some (.leaf 3815 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5690 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6491 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6676 false 0)))))) (some (.node (some (.node none (some (.leaf 6748 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7528 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7748 false 0)))))) (some (.node (some (.node none (some (.leaf 7824 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 8138 false 0)))))) (some (.node (some (.node none (some (.leaf 8166 false 0)))) none)))) none)))))))))))

theorem region_0397_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURURURRRRR") region_0397 = true := by
  unfold region_0397
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

