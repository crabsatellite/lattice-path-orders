import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0019 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52106 true 16)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51953 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51382 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49284 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46260 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46261 false 0)))))) (some (.node (some (.node none (some (.leaf 46262 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51830 true 16)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51231 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49140 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46884 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46885 false 0)))))) (some (.node (some (.node none (some (.leaf 46886 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50801 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48649 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47093 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47095 false 0)))))) (some (.node (some (.node none (some (.leaf 47096 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47195 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47197 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47198 false 0)))))) (some (.node (some (.node none (some (.leaf 47201 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47224 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47226 false 0)))))) (some (.node (some (.node none (some (.leaf 47227 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 47228 false 0)))))) (some (.node (some (.node none (some (.leaf 47229 false 0)))) none)))) none)))))))))))

theorem region_0019_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRRUUUURR") region_0019 = true := by
  unfold region_0019
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

