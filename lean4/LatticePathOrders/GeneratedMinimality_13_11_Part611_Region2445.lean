import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2445 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52094 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17439 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22657 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 42003 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 49165 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 51254 false 0)))))) (some (.node (some (.node none (some (.leaf 51797 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22478 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16901 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15955 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11034 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8509 false 0)))))) (some (.node (some (.node none (some (.leaf 8507 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16787 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17496 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 21058 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22128 false 0)))))) (some (.node (some (.node none (some (.leaf 22366 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 34526 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39464 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 41221 false 0)))))) (some (.node (some (.node none (some (.leaf 41582 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46512 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 48278 false 0)))))) (some (.node (some (.node none (some (.leaf 48689 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 50331 false 0)))))) (some (.node (some (.node none (some (.leaf 50687 false 0)))) none)))) none)))))))))))

theorem region_2445_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRUURRRRRR") region_2445 = true := by
  unfold region_2445
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

