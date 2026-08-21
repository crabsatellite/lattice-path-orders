import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0056 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1826 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1308 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1292 false 0)))))) (some (.node (some (.node none (some (.leaf 1412 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1189 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1172 false 0)))))) (some (.node (some (.node none (some (.leaf 1173 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1174 false 0)))))) (some (.node (some (.node none (some (.leaf 1175 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1189 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1190 false 0)))))) (some (.node (some (.node none (some (.leaf 1191 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1194 false 0)))))) (some (.node (some (.node none (some (.leaf 1196 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1308 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1245 false 0)))))) (some (.node (some (.node none (some (.leaf 1246 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1249 false 0)))))) (some (.node (some (.node none (some (.leaf 1250 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0056_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURRRUUU") region_0056 = true := by
  unfold region_0056
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

