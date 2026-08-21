import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0059 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8345 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8291 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8171 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7836 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7222 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7516 true 9)))))) (some (.node (some (.node none (some (.leaf 7610 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8265 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8163 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7820 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6744 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3811 true 10)))))) (some (.node (some (.node none (some (.leaf 1496 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8128 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7740 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6667 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3760 true 10)))))) (some (.node (some (.node none (some (.leaf 2124 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7521 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6487 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4444 true 10)))))) (some (.node (some (.node none (some (.leaf 4490 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5679 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5226 true 10)))))) (some (.node (some (.node none (some (.leaf 5272 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5456 true 10)))))) (some (.node (some (.node none (some (.leaf 5541 true 10)))) none)))) none)))))))))))

theorem region_0059_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRURUURRR") region_0059 = true := by
  unfold region_0059
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

