import LatticePathOrdersKernel.Problem63BandNoniso

/-!
# Kernel-only resolution of Schiffler's Problem 6.3
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem problem63_kernel_counterexample :
    Carrier 17 9 problem63Left ∧
    Carrier 17 9 problem63Right ∧
    sourceLagrangeValue problem63Left = sourceLagrangeValue problem63Right ∧
    ¬ PathBandIso 26 problem63Left problem63Right := by
  exact ⟨problem63Left_mem, problem63Right_mem,
    problem63_sourceLagrange_equal, problem63_path_band_noniso⟩

end LatticePathOrdersKernel
