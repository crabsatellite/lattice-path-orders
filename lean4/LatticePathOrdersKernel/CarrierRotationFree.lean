import LatticePathOrdersKernel.BalancedPathCount

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem carrier_rotation_injective
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hword : Carrier a b word) :
    Function.Injective
      (fun k : Fin (a + b) => word.rotate k.val) := by
  intro k l hkl
  have hlength := carrier_length hword
  have hnpos : 0 < a + b := by omega
  have hkLe : k.val ≤ a + b := k.isLt.le
  have hleftBack : (word.rotate k.val).rotate (a + b - k.val) = word := by
    rw [List.rotate_rotate]
    have hsum : k.val + (a + b - k.val) = a + b := by omega
    rw [hsum, ← hlength, List.rotate_length]
  have hrightBack : (word.rotate l.val).rotate (a + b - k.val) =
      word.rotate (l.val + (a + b - k.val)) := by
    rw [List.rotate_rotate]
  have hperiod : word.rotate (l.val + (a + b - k.val)) = word := by
    calc
      word.rotate (l.val + (a + b - k.val)) =
          (word.rotate l.val).rotate (a + b - k.val) := hrightBack.symm
      _ = (word.rotate k.val).rotate (a + b - k.val) :=
        congrArg (fun w => w.rotate (a + b - k.val)) hkl.symm
      _ = word := hleftBack
  let r : Fin (a + b) :=
    ⟨(l.val + (a + b - k.val)) % (a + b), Nat.mod_lt _ hnpos⟩
  have hrPeriod : word.rotate r.val = word := by
    dsimp [r]
    have hmodEq : (l.val + (a + b - k.val)) % (a + b) =
        (l.val + (a + b - k.val)) % word.length := by rw [hlength]
    rw [hmodEq, List.rotate_mod]
    exact hperiod
  have hunique := unique_admissible_rotation ha hb hcoprime
    (carrier_components hword).1 (carrier_components hword).2.1
  let zero : Fin word.length := ⟨0, by rw [hlength]; omega⟩
  let rWord : Fin word.length :=
    ⟨r.val, by rw [hlength]; exact r.isLt⟩
  have hzeroCarrier : Carrier a b (word.rotate zero.val) := by
    simpa [zero] using hword
  have hrCarrier : Carrier a b (word.rotate rWord.val) := by
    rw [show rWord.val = r.val by rfl, hrPeriod]
    exact hword
  have hzeroEq := hunique.unique hzeroCarrier hrCarrier
  have hrZero : r.val = 0 := congrArg Fin.val hzeroEq.symm
  have hmod : (l.val + (a + b - k.val)) % (a + b) = 0 := hrZero
  have hdvd : a + b ∣ l.val + (a + b - k.val) :=
    Nat.dvd_of_mod_eq_zero hmod
  apply Fin.ext
  have htotalPos : 0 < l.val + (a + b - k.val) := by omega
  have htotalLt : l.val + (a + b - k.val) < 2 * (a + b) := by omega
  have htotalEq := Nat.eq_of_dvd_of_lt_two_mul
    (by omega) hdvd htotalLt
  omega

def finRotationOrbit (n : Nat) (word : Path) : Finset Path :=
  Finset.univ.image fun k : Fin n => word.rotate k.val

theorem mem_finRotationOrbit {n : Nat} {word rotated : Path} :
    rotated ∈ finRotationOrbit n word ↔
      ∃ k : Fin n, word.rotate k.val = rotated := by
  simp [finRotationOrbit]

theorem finRotationOrbit_card_of_carrier
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) {word : Path}
    (hword : Carrier a b word) :
    (finRotationOrbit (a + b) word).card = a + b := by
  rw [finRotationOrbit, Finset.card_image_of_injective _
    (carrier_rotation_injective ha hb hcoprime hword), Finset.card_univ,
    Fintype.card_fin]

end LatticePathOrdersKernel
