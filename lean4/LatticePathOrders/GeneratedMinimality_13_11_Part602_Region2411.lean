import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2411 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49217 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17463 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16976 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 28440 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 37954 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40962 false 0)))))) (some (.node (some (.node none (some (.leaf 41784 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 21065 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16947 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15995 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11060 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3382 false 0)))))) (some (.node (some (.node none (some (.leaf 862 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16817 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15846 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10951 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3868 false 0)))))) (some (.node (some (.node none (some (.leaf 3907 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15178 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13535 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 14033 false 0)))))) (some (.node (some (.node none (some (.leaf 14186 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 19208 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19792 false 0)))))) (some (.node (some (.node none (some (.leaf 19986 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 21670 false 0)))))) (some (.node (some (.node none (some (.leaf 21835 false 0)))) none)))) none)))))))))))

theorem region_2411_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRURRRRURR") region_2411 = true := by
  unfold region_2411
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

