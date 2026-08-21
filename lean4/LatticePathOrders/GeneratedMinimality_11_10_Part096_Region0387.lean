import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0387 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8465 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3098 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3843 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6784 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7862 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8185 false 0)))))) (some (.node (some (.node none (some (.leaf 8326 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3904 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3026 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2906 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2069 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 737 false 0)))))) (some (.node (some (.node none (some (.leaf 305 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3001 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 2922 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3362 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3492 false 0)))))) (some (.node (some (.node none (some (.leaf 3529 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5346 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6066 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6260 false 0)))))) (some (.node (some (.node none (some (.leaf 6309 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7231 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7318 false 0)))))) (some (.node (some (.node none (some (.leaf 7344 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 7777 false 0)))))) (some (.node (some (.node none (some (.leaf 7825 false 0)))) none)))) none)))))))))))

theorem region_0387_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURURRURRRR") region_0387 = true := by
  unfold region_0387
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

