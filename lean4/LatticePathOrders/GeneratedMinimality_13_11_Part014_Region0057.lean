import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0057 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52080 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51927 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51357 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49260 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46000 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46002 false 0)))))) (some (.node (some (.node none (some (.leaf 46004 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51774 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51207 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49117 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46190 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46191 false 0)))))) (some (.node (some (.node none (some (.leaf 46192 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50768 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48596 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46217 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46218 false 0)))))) (some (.node (some (.node none (some (.leaf 46219 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47097 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46220 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46221 false 0)))))) (some (.node (some (.node none (some (.leaf 46225 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46222 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 46223 false 0)))))) (some (.node (some (.node none (some (.leaf 46226 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 46224 false 0)))))) (some (.node (some (.node none (some (.leaf 46227 false 0)))) none)))) none)))))))))))

theorem region_0057_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUUUURRR") region_0057 = true := by
  unfold region_0057
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

