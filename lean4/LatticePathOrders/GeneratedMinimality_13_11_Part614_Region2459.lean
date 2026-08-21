import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2459 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 42056 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17197 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16761 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15733 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 20127 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22003 false 0)))))) (some (.node (some (.node none (some (.leaf 22522 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17502 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16731 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15630 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10809 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3278 false 0)))))) (some (.node (some (.node none (some (.leaf 805 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16600 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15525 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10486 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3248 false 0)))))) (some (.node (some (.node none (some (.leaf 926 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15079 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 9150 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3044 false 0)))))) (some (.node (some (.node none (some (.leaf 1242 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6674 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2581 false 0)))))) (some (.node (some (.node none (some (.leaf 1375 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 9250 false 0)))))) (some (.node (some (.node none (some (.leaf 1419 false 0)))) none)))) none)))))))))))

theorem region_2459_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURRRRRRUR") region_2459 = true := by
  unfold region_2459
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

