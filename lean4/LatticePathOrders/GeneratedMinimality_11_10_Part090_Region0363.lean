import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0363 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8491 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3670 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3919 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6894 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7987 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8310 false 0)))))) (some (.node (some (.node none (some (.leaf 8414 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3917 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3585 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3243 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2396 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1589 false 0)))))) (some (.node (some (.node none (some (.leaf 1588 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3570 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3216 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3614 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3734 false 0)))))) (some (.node (some (.node none (some (.leaf 3783 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5598 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6451 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6630 false 0)))))) (some (.node (some (.node none (some (.leaf 6713 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7486 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7670 false 0)))))) (some (.node (some (.node none (some (.leaf 7776 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 8100 false 0)))))) (some (.node (some (.node none (some (.leaf 8137 false 0)))) none)))) none)))))))))))

theorem region_0363_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRUURRRRR") region_0363 = true := by
  unfold region_0363
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

