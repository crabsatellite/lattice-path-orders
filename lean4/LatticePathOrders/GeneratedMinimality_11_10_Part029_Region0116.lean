import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0116 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7939 true 8)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7922 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7785 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7332 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6288 true 9)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3775 true 9)))))) (some (.node (some (.node none (some (.leaf 3874 true 9)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7911 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7751 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7320 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6268 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3499 true 12)))))) (some (.node (some (.node none (some (.leaf 304 true 12)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7676 true 12)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7281 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6194 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3447 true 12)))))) (some (.node (some (.node none (some (.leaf 262 true 12)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 7188 true 12)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5954 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3288 true 12)))))) (some (.node (some (.node none (some (.leaf 246 true 12)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 5312 true 12)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2895 true 12)))))) (some (.node (some (.node none (some (.leaf 249 true 12)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1829 true 12)))))) (some (.node (some (.node none (some (.leaf 273 true 12)))) none)))) none)))))))))))

theorem region_0116_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRRURURRRUR") region_0116 = true := by
  unfold region_0116
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

