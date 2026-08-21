import LatticePathOrders.GeneratedMinimality_14_11_Part320
import LatticePathOrders.GeneratedMinimality_14_11_Part321
import LatticePathOrders.GeneratedMinimality_14_11_Part322
import LatticePathOrders.GeneratedMinimality_14_11_Part323
import LatticePathOrders.GeneratedMinimality_14_11_Part324
import LatticePathOrders.GeneratedMinimality_14_11_Part325
import LatticePathOrders.GeneratedMinimality_14_11_Part326
import LatticePathOrders.GeneratedMinimality_14_11_Part327
import LatticePathOrders.GeneratedMinimality_14_11_Part328
import LatticePathOrders.GeneratedMinimality_14_11_Part329
import LatticePathOrders.GeneratedMinimality_14_11_Part330
import LatticePathOrders.GeneratedMinimality_14_11_Part331
import LatticePathOrders.GeneratedMinimality_14_11_Part332
import LatticePathOrders.GeneratedMinimality_14_11_Part333
import LatticePathOrders.GeneratedMinimality_14_11_Part334
import LatticePathOrders.GeneratedMinimality_14_11_Part335

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regionsGroup020 : List (Path × Nat × AssignmentTree) :=
  regionsPart320 ++ (regionsPart321 ++ (regionsPart322 ++ (regionsPart323 ++ (regionsPart324 ++ (regionsPart325 ++ (regionsPart326 ++ (regionsPart327 ++ (regionsPart328 ++ (regionsPart329 ++ (regionsPart330 ++ (regionsPart331 ++ (regionsPart332 ++ (regionsPart333 ++ (regionsPart334 ++ (regionsPart335)))))))))))))))

theorem regionsGroup020_valid : ∀ region ∈ regionsGroup020,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsGroup020, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsPart320_valid region h
  · exact regionsPart321_valid region h
  · exact regionsPart322_valid region h
  · exact regionsPart323_valid region h
  · exact regionsPart324_valid region h
  · exact regionsPart325_valid region h
  · exact regionsPart326_valid region h
  · exact regionsPart327_valid region h
  · exact regionsPart328_valid region h
  · exact regionsPart329_valid region h
  · exact regionsPart330_valid region h
  · exact regionsPart331_valid region h
  · exact regionsPart332_valid region h
  · exact regionsPart333_valid region h
  · exact regionsPart334_valid region h
  · exact regionsPart335_valid region h

end LatticePathOrders.GeneratedMinimality_14_11
