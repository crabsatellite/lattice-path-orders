import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0028 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8441 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8414 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8310 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7987 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6894 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3919 true 9)))))) (some (.node (some (.node none (some (.leaf 3670 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8406 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8281 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7965 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6874 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3903 true 16)))))) (some (.node (some (.node none (some (.leaf 1645 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8229 true 16)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7910 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6826 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3869 true 16)))))) (some (.node (some (.node none (some (.leaf 1668 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7641 true 16)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6550 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3687 true 16)))))) (some (.node (some (.node none (some (.leaf 1671 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5803 true 16)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3103 true 16)))))) (some (.node (some (.node none (some (.leaf 1672 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1985 true 16)))))) (some (.node (some (.node none (some (.leaf 1674 false 0)))) none)))) none)))))))))))

theorem region_0028_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRUURRUR") region_0028 = true := by
  unfold region_0028
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

