import LatticePathOrders.CarrierFacts
import LatticePathOrders.MatrixScore
import LatticePathOrdersClassical.PeriodicContinuedFraction

/-!
# Exact source domain for rational-Dyck paths

These lemmas discharge the domain facts that were absent from the old
Reference Gates: a source path starts in `R`, ends in `U`, its coefficient word
is positive, and its closed periodic word has even length.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem carrier_ne_nil {a b : Nat} (ha : 0 < a) {w : Path}
    (hw : Carrier a b w) : w ≠ [] := by
  intro hwNil
  have hc := carrier_components hw
  simp [hwNil, Path.countR] at hc
  omega

theorem carrier_ends_U {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {w : Path} (hw : Carrier a b w) : ∃ pfx, w = pfx ++ [Step.U] := by
  have hne := carrier_ne_nil ha hw
  let last := w.getLast hne
  have hdecomp : w.dropLast ++ [last] = w := by
    exact List.dropLast_append_getLast hne
  cases hlast : last with
  | U => exact ⟨w.dropLast, by simpa [hlast] using hdecomp.symm⟩
  | R =>
      have hc := carrier_components hw
      have hall := List.all_eq_true.mp hc.2.2
      have hk : w.dropLast.length ∈ List.range (w.length + 1) := by
        apply List.mem_range.mpr
        simp only [List.length_dropLast]
        omega
      have hineq := hall w.dropLast.length hk
      have htake : w.take w.dropLast.length = w.dropLast := by
        rw [← hdecomp]
        simp [hlast]
      rw [htake] at hineq
      have hcountR := hc.1
      have hcountU := hc.2.1
      rw [← hdecomp] at hcountR hcountU
      simp [hlast, Path.countR, Path.countU] at hcountR hcountU
      have hineqProp :
          a * Path.countU w.dropLast ≤ b * Path.countR w.dropLast := by
        simpa using hineq
      rw [← hcountR, ← hcountU] at hineqProp
      rw [← hcountU] at hb
      change
        (List.count Step.R w.dropLast + 1) * List.count Step.U w.dropLast ≤
          List.count Step.U w.dropLast * List.count Step.R w.dropLast at hineqProp
      rw [Nat.add_mul, Nat.one_mul,
        Nat.mul_comm (List.count Step.U w.dropLast)] at hineqProp
      omega

theorem adjacencyDigits_mem {w : Path} {digit : Nat}
    (hdigit : digit ∈ adjacencyDigits w) : digit = 1 ∨ digit = 2 := by
  induction w with
  | nil => simp [adjacencyDigits] at hdigit
  | cons first tail ih =>
      cases tail with
      | nil => simp [adjacencyDigits] at hdigit
      | cons next rest =>
          rw [adjacencyDigits] at hdigit
          rcases List.mem_append.mp hdigit with hlocal | hrest
          · by_cases hsame : first = next
            · simp [hsame] at hlocal
              exact Or.inl hlocal
            · simp [hsame] at hlocal
              exact Or.inr hlocal
          · exact ih hrest

theorem adjacencyDigits_positive (w : Path) :
    LatticePathOrdersClassical.PositiveDigits (adjacencyDigits w) := by
  intro digit hdigit
  rcases adjacencyDigits_mem hdigit with rfl | rfl <;> norm_num

theorem cyclicDigits_positive (w : Path) :
    LatticePathOrdersClassical.PositiveDigits (cyclicDigits w) := by
  intro digit hdigit
  simp only [cyclicDigits, List.mem_cons] at hdigit
  rcases hdigit with rfl | hdigit
  · norm_num
  · exact adjacencyDigits_positive w digit hdigit

def lastAfter (previous : Step) : Path → Step
  | [] => previous
  | next :: rest => lastAfter next rest

def changeCount (previous : Step) : Path → Nat
  | [] => 0
  | next :: rest => (if previous = next then 0 else 1) + changeCount next rest

theorem adjacencyDigits_length_mod_two (first : Step) (tail : Path) :
    (adjacencyDigits (first :: tail)).length % 2 = changeCount first tail % 2 := by
  induction tail generalizing first with
  | nil => simp [adjacencyDigits, changeCount]
  | cons next rest ih =>
      cases first <;> cases next
      · have hrec := ih Step.R
        simp [adjacencyDigits, changeCount] at hrec ⊢
        omega
      · have hrec := ih Step.U
        simp [adjacencyDigits, changeCount] at hrec ⊢
        omega
      · have hrec := ih Step.R
        simp [adjacencyDigits, changeCount] at hrec ⊢
        omega
      · have hrec := ih Step.U
        simp [adjacencyDigits, changeCount] at hrec ⊢
        omega

theorem changeCount_mod_two (first : Step) (tail : Path) :
    changeCount first tail % 2 = if first = lastAfter first tail then 0 else 1 := by
  induction tail generalizing first with
  | nil => simp [changeCount, lastAfter]
  | cons next rest ih =>
      cases first with
      | R =>
          cases next with
          | R => simpa [changeCount, lastAfter] using ih Step.R
          | U =>
              have hrec := ih Step.U
              cases hlast : lastAfter Step.U rest <;>
                simp [changeCount, lastAfter, hlast] at hrec ⊢ <;> omega
      | U =>
          cases next with
          | R =>
              have hrec := ih Step.R
              cases hlast : lastAfter Step.R rest <;>
                simp [changeCount, lastAfter, hlast] at hrec ⊢ <;> omega
          | U => simpa [changeCount, lastAfter] using ih Step.U

theorem getLast?_eq_lastAfter (first : Step) (tail : Path) :
    (first :: tail).getLast? = some (lastAfter first tail) := by
  induction tail generalizing first with
  | nil => simp [lastAfter]
  | cons next rest ih =>
      simpa [lastAfter] using ih next

theorem cyclicDigits_even_of_endpoints {w : Path}
    (hstart : IsPrefix [Step.R] w)
    (hend : ∃ pfx, w = pfx ++ [Step.U]) :
    Even (cyclicDigits w).length := by
  rcases hstart with ⟨tail, htail⟩
  simp only [List.singleton_append] at htail
  subst w
  have hlast : lastAfter Step.R tail = Step.U := by
    have hget := getLast?_eq_lastAfter Step.R tail
    rcases hend with ⟨pfx, hend⟩
    rw [hend] at hget
    simp at hget
    exact hget.symm
  rw [show (cyclicDigits (Step.R :: tail)).length =
      1 + (adjacencyDigits (Step.R :: tail)).length by
        simp [cyclicDigits, Nat.add_comm]]
  apply Nat.even_iff.mpr
  rw [Nat.add_mod, adjacencyDigits_length_mod_two,
    changeCount_mod_two, hlast]
  decide

theorem carrier_cyclicDigits_even {a b : Nat}
    (ha : 0 < a) (hb : 0 < b) {w : Path} (hw : Carrier a b w) :
    Even (cyclicDigits w).length :=
  cyclicDigits_even_of_endpoints (carrier_starts_R ha hw)
    (carrier_ends_U ha hb hw)

end LatticePathOrdersKernel
