import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0069 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8270 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8238 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8149 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7800 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6726 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6655 true 9)))))) (some (.node (some (.node none (some (.leaf 6811 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8228 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8137 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7776 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6713 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3783 true 10)))))) (some (.node (some (.node none (some (.leaf 1588 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8100 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7670 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6630 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3734 true 10)))))) (some (.node (some (.node none (some (.leaf 1589 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7486 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6451 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3614 true 10)))))) (some (.node (some (.node none (some (.leaf 2396 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5598 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3216 true 10)))))) (some (.node (some (.node none (some (.leaf 3243 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3570 true 10)))))) (some (.node (some (.node none (some (.leaf 3585 true 10)))) none)))) none)))))))))))

theorem region_0069_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRUURRURR") region_0069 = true := by
  unfold region_0069
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

