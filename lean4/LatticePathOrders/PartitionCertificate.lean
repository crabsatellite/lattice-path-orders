import LatticePathOrders.CarrierFacts

namespace LatticePathOrders

/-!
# A kernel-checked frontier partition checker

The Boolean recursion mirrors the independent JSON verifier.  The theorem
below proves that a successful check really covers every rational-Dyck leaf;
the generated certificate modules may therefore close the finite computation
with ordinary `decide` while retaining a small trusted theorem.
-/

def partitionCheck (a b : Nat) (frontier : List Path) : Nat → Path → Bool
  | 0, pfx => pfx ∈ frontier
  | fuel + 1, pfx =>
      if pfx ∈ frontier then true
      else
        (if Path.countR pfx < a then
            partitionCheck a b frontier fuel (pfx ++ [Step.R])
          else true) &&
        (if Path.countU pfx < b ∧
              a * (Path.countU pfx + 1) ≤ b * Path.countR pfx then
            partitionCheck a b frontier fuel (pfx ++ [Step.U])
          else true)

theorem partitionCheck_sound {a b : Nat} {frontier : List Path} :
    ∀ {fuel : Nat} {pfx w : Path},
      partitionCheck a b frontier fuel pfx = true →
      Carrier a b w →
      IsPrefix pfx w →
      pfx.length + fuel = w.length →
      ∃ q ∈ frontier, IsPrefix q w := by
  intro fuel
  induction fuel with
  | zero =>
      intro pfx w hcheck _ hpref _
      have hpMem : pfx ∈ frontier := by
        simpa [partitionCheck] using hcheck
      exact ⟨pfx, hpMem, hpref⟩
  | succ fuel ih =>
      intro pfx w hcheck hw hpref hlength
      by_cases hpMem : pfx ∈ frontier
      · exact ⟨pfx, hpMem, hpref⟩
      · have hbranches :
            ((if Path.countR pfx < a then
                partitionCheck a b frontier fuel (pfx ++ [Step.R])
              else true) &&
             (if Path.countU pfx < b ∧
                   a * (Path.countU pfx + 1) ≤ b * Path.countR pfx then
                partitionCheck a b frontier fuel (pfx ++ [Step.U])
              else true)) = true := by
            simpa only [partitionCheck, if_neg hpMem] using hcheck
        rcases hpref with ⟨suffix, rfl⟩
        have hsuffixLength : suffix.length = fuel + 1 := by
          simp only [List.length_append] at hlength
          omega
        cases suffix with
        | nil => simp at hsuffixLength
        | cons next rest =>
            have hrestLength : rest.length = fuel := by
              simp at hsuffixLength
              omega
            have hc := carrier_components hw
            have hparts :
                (if Path.countR pfx < a then
                    partitionCheck a b frontier fuel (pfx ++ [Step.R])
                  else true) = true ∧
                (if Path.countU pfx < b ∧
                      a * (Path.countU pfx + 1) ≤ b * Path.countR pfx then
                    partitionCheck a b frontier fuel (pfx ++ [Step.U])
                  else true) = true := by
              simpa only [Bool.and_eq_true] using hbranches
            cases next with
            | R =>
                have hr : Path.countR pfx < a := by
                  have hrCount :
                      Path.countR pfx + (Path.countR rest + 1) = a := by
                    simpa [Path.countR, List.count_append, Nat.add_assoc] using hc.1
                  omega
                have hRpart := hparts.1
                have hRcheck :
                    partitionCheck a b frontier fuel (pfx ++ [Step.R]) = true := by
                  simpa [hr] using hRpart
                apply ih hRcheck hw
                · exact ⟨rest, by simp [List.append_assoc]⟩
                · simp [List.length_append, hrestLength]
                  omega
            | U =>
                have huCount : Path.countU pfx < b := by
                  have hu :
                      Path.countU pfx + (Path.countU rest + 1) = b := by
                    simpa [Path.countU, List.count_append, Nat.add_assoc] using hc.2.1
                  omega
                have huIneq :
                    a * (Path.countU pfx + 1) ≤ b * Path.countR pfx :=
                  feasible_nextU hc.2.2
                have hUpart := hparts.2
                have hUcheck :
                    partitionCheck a b frontier fuel (pfx ++ [Step.U]) = true := by
                  simpa [huCount, huIneq] using hUpart
                apply ih hUcheck hw
                · exact ⟨rest, by simp [List.append_assoc]⟩
                · simp [List.length_append, hrestLength]
                  omega

/-- Root form used by every committed certificate. -/
theorem coversCarrier_of_partitionCheck {a b : Nat} (ha : 0 < a)
    {frontier : List Path}
    (hcheck : partitionCheck a b frontier (a + b - 1) [Step.R] = true) :
    ∀ w, Carrier a b w → ∃ q ∈ frontier, IsPrefix q w := by
  intro w hw
  apply partitionCheck_sound hcheck hw (carrier_starts_R ha hw)
  have hwlen := carrier_length hw
  simp only [List.length_cons, List.length_nil]
  omega

end LatticePathOrders
