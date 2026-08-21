import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2378 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51272 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17518 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 20053 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 37880 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 44546 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47871 false 0)))))) (some (.node (some (.node none (some (.leaf 48776 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22126 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17022 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16058 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11101 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3401 false 0)))))) (some (.node (some (.node none (some (.leaf 1171 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16843 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15902 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 13309 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 13836 false 0)))))) (some (.node (some (.node none (some (.leaf 14035 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 26019 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 27632 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 28066 false 0)))))) (some (.node (some (.node none (some (.leaf 28249 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36157 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37027 false 0)))))) (some (.node (some (.node none (some (.leaf 37473 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 40031 false 0)))))) (some (.node (some (.node none (some (.leaf 40310 false 0)))) none)))) none)))))))))))

theorem region_2378_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRRURRURRR") region_2378 = true := by
  unfold region_2378
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

