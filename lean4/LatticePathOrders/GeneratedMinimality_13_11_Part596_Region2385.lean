import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2385 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51825 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17515 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 21927 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 40885 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 47890 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 50009 false 0)))))) (some (.node (some (.node none (some (.leaf 50865 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22364 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17017 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16052 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11097 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3399 false 0)))))) (some (.node (some (.node none (some (.leaf 1286 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16840 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15926 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 18599 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 19509 false 0)))))) (some (.node (some (.node none (some (.leaf 19794 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 30991 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35524 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 37026 false 0)))))) (some (.node (some (.node none (some (.leaf 37500 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 43455 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 44070 false 0)))))) (some (.node (some (.node none (some (.leaf 44323 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 46716 false 0)))))) (some (.node (some (.node none (some (.leaf 47278 false 0)))) none)))) none)))))))))))

theorem region_2385_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURRRURURRRR") region_2385 = true := by
  unfold region_2385
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

