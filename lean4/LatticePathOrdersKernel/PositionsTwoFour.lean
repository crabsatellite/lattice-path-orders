import LatticePathOrdersKernel.ManyEAbove

namespace LatticePathOrdersKernel
open LatticePathOrders

theorem positions_two_four_not_carrier
    {n after : Nat} (hn : 4 ≤ n) {word : Path}
    (hword : Carrier n (n - 1) word)
    (hblocks : adjacencyBlocks word =
      [E, D, E, D, E] ++ List.replicate after D) : False := by
  rcases carrier_nn1_starts_RR (by omega) hword with ⟨tail, hwordEq⟩
  cases tail with
  | nil =>
      have hlen := carrier_length hword
      simp [hwordEq] at hlen
      omega
  | cons third rest =>
      cases rest with
      | nil =>
          have hlen := carrier_length hword
          simp [hwordEq] at hlen
          omega
      | cons fourth rest =>
          cases third with
          | R => norm_num [hwordEq, adjacencyBlocks, D, E, T, Mat2.mul] at hblocks
          | U =>
              cases fourth with
              | R =>
                  norm_num [hwordEq, adjacencyBlocks, D, E, T, Mat2.mul] at hblocks
                  exact Step.noConfusion hblocks.2.1
              | U =>
                  have hc := carrier_components hword
                  rw [hwordEq] at hc
                  have hineq := feasible_nextU
                    (p := [Step.R, Step.R, Step.U]) (rest := rest) hc.2.2
                  simp [Path.countR, Path.countU] at hineq
                  omega

end LatticePathOrdersKernel
