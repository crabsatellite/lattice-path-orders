import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_0051 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52083 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51930 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51360 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49263 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 42089 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 34231 false 0)))))) (some (.node (some (.node none (some (.leaf 34232 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51785 true 17)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 51210 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 49120 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41965 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 34362 false 0)))))) (some (.node (some (.node none (some (.leaf 34363 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 50775 true 17)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 48599 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 41489 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 34364 false 0)))))) (some (.node (some (.node none (some (.leaf 34365 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 47100 true 17)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39907 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 34366 false 0)))))) (some (.node (some (.node none (some (.leaf 34369 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 35410 true 17)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 34367 false 0)))))) (some (.node (some (.node none (some (.leaf 34370 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 34368 false 0)))))) (some (.node (some (.node none (some (.leaf 34371 false 0)))) none)))) none)))))))))))

theorem region_0051_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRRRRRRRUUURRUR") region_0051 = true := by
  unfold region_0051
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

