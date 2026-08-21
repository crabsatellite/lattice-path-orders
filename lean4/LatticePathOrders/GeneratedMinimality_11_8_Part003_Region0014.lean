import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0014 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1860 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1861 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1862 false 0)))))) (some (.node (some (.node none (some (.leaf 1864 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1863 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1865 false 0)))))) (some (.node (some (.node none (some (.leaf 1867 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1866 false 0)))))) (some (.node (some (.node none (some (.leaf 1868 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1873 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1875 false 0)))))) (some (.node (some (.node none (some (.leaf 1880 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1877 false 0)))))) (some (.node (some (.node none (some (.leaf 1883 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1933 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1934 false 0)))))) (some (.node (some (.node none (some (.leaf 1936 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1935 false 0)))))) (some (.node (some (.node none (some (.leaf 1937 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0014_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRRUUUU") region_0014 = true := by
  unfold region_0014
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

