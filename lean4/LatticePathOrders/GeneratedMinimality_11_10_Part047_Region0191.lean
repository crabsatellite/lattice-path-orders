import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0191 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8274 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6880 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6756 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6319 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7241 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7538 false 0)))))) (some (.node (some (.node none (some (.leaf 7661 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6867 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6742 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6303 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4894 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2614 true 10)))))) (some (.node (some (.node none (some (.leaf 896 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6699 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6256 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4872 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2590 true 10)))))) (some (.node (some (.node none (some (.leaf 2159 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6108 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4800 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4511 true 10)))))) (some (.node (some (.node none (some (.leaf 4537 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5170 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5306 true 10)))))) (some (.node (some (.node none (some (.leaf 5341 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 5593 true 10)))))) (some (.node (some (.node none (some (.leaf 5682 true 10)))) none)))) none)))))))))))

theorem region_0191_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRRUURRR") region_0191 = true := by
  unfold region_0191
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

