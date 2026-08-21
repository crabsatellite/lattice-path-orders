import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2482 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52059 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17185 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22521 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 41800 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 48937 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 51017 false 0)))))) (some (.node (some (.node none (some (.leaf 51622 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22453 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16720 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15619 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10794 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3270 false 0)))))) (some (.node (some (.node none (some (.leaf 1349 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16590 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17094 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20798 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21679 false 0)))))) (some (.node (some (.node none (some (.leaf 21903 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 33808 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39023 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 40479 false 0)))))) (some (.node (some (.node none (some (.leaf 40845 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 45742 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 47493 false 0)))))) (some (.node (some (.node none (some (.leaf 47847 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 49841 false 0)))))) (some (.node (some (.node none (some (.leaf 49995 false 0)))) none)))) none)))))))))))

theorem region_2482_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURRURRRRR") region_2482 = true := by
  unfold region_2482
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

