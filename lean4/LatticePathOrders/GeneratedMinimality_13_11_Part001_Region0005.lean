import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0005 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52112 true 15)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51957 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51386 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49288 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47232 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47234 false 0)))))) (some (.node (some (.node none (some (.leaf 47235 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51839 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51237 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49144 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 48677 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 48678 false 0)))))) (some (.node (some (.node none (some (.leaf 48679 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50825 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49144 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 49157 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 49158 false 0)))))) (some (.node (some (.node none (some (.leaf 49159 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49288 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 49295 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 49296 false 0)))))) (some (.node (some (.node none (some (.leaf 49297 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 49334 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 49335 false 0)))))) (some (.node (some (.node none (some (.leaf 49336 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 49346 false 0)))))) (some (.node (some (.node none (some (.leaf 49347 false 0)))) none)))) none)))))))))))

theorem region_0005_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRRRUUUUR") region_0005 = true := by
  unfold region_0005
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

