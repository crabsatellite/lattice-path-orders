import LatticePathOrders.CarrierFacts

namespace LatticePathOrders

/-! A premise-free finite enumeration of every fixed endpoint carrier. -/

def allWords : Nat → List Path
  | 0 => [[]]
  | n + 1 =>
      (allWords n).map (Step.R :: ·) ++
        (allWords n).map (Step.U :: ·)

theorem mem_allWords {n : Nat} {w : Path} : w ∈ allWords n ↔ w.length = n := by
  induction n generalizing w with
  | zero =>
      constructor
      · intro hw
        simp [allWords] at hw
        subst w
        rfl
      · intro hw
        have : w = [] := List.length_eq_zero_iff.mp hw
        subst w
        simp [allWords]
  | succ n ih =>
      cases w with
      | nil => simp [allWords]
      | cons step rest =>
          cases step <;> simp [allWords, ih]

def carrierPaths (a b : Nat) : List Path :=
  (allWords (a + b)).filter (fun w => inCarrier a b w)

theorem mem_carrierPaths {a b : Nat} {w : Path} :
    w ∈ carrierPaths a b ↔ Carrier a b w := by
  constructor
  · intro hw
    have h := List.mem_filter.mp hw
    exact h.2
  · intro hw
    apply List.mem_filter.mpr
    exact ⟨mem_allWords.mpr (carrier_length hw), hw⟩

theorem carrierPaths_sound (a b : Nat) :
    ∀ p ∈ carrierPaths a b, Carrier a b p := by
  intro p hp
  exact mem_carrierPaths.mp hp

theorem carrierPaths_complete (a b : Nat) :
    ∀ p, Carrier a b p → p ∈ carrierPaths a b := by
  intro p hp
  exact mem_carrierPaths.mpr hp

/-- Unconditional constructive characterization on the literal rational-Dyck
carrier.  The certificate language is both sound and complete for every score
into a linear order. -/
theorem carrier_pullbackCover_iff_exists_certificate
    {α : Type*} [LinearOrder α] {a b : Nat}
    {score : Path → α} {x y : Path}
    (hx : Carrier a b x) (hy : Carrier a b y) (hxy : score x < score y) :
    PullbackCover (Carrier a b) score x y ↔
      ∃ cert, ValidCoverCertificate (Carrier a b) score (score x) (score y) cert := by
  apply pullbackCover_iff_exists_certificate (carrierPaths a b)
    (carrierPaths_sound a b) (carrierPaths_complete a b)
    (fun _ hw => carrier_length hw) hx hy hxy

end LatticePathOrders
