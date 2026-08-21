import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2472 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51891 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17192 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22006 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 40981 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47995 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 50066 false 0)))))) (some (.node (some (.node none (some (.leaf 51022 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22377 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16726 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15625 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10803 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3274 false 0)))))) (some (.node (some (.node none (some (.leaf 1302 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16595 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16120 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 19049 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19884 false 0)))))) (some (.node (some (.node none (some (.leaf 20056 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 31265 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36326 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37579 false 0)))))) (some (.node (some (.node none (some (.leaf 37854 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 43832 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 44390 false 0)))))) (some (.node (some (.node none (some (.leaf 44533 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 47605 false 0)))))) (some (.node (some (.node none (some (.leaf 47874 false 0)))) none)))) none)))))))))))

theorem region_2472_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURRRURRRR") region_2472 = true := by
  unfold region_2472
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

