import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0010 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8490 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8452 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8366 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8040 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6939 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3954 true 15)))))) (some (.node (some (.node none (some (.leaf 2965 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8440 true 15)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8350 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8025 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6927 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3945 true 15)))))) (some (.node (some (.node none (some (.leaf 3092 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8273 true 15)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7938 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6852 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3890 true 15)))))) (some (.node (some (.node none (some (.leaf 3156 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7703 true 15)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6586 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3706 true 15)))))) (some (.node (some (.node none (some (.leaf 3172 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5913 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3173 false 0)))))) (some (.node (some (.node none (some (.leaf 3175 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3174 false 0)))))) (some (.node (some (.node none (some (.leaf 3176 false 0)))) none)))) none)))))))))))

theorem region_0010_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRRRRUURUR") region_0010 = true := by
  unfold region_0010
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

