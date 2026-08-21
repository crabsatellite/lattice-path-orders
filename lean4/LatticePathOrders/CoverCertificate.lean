import LatticePathOrders.Basic

namespace LatticePathOrders

/-!
# Exact prefix certificates for pullback covers

This file contains the certificate theorem used in the proof of Problem 6.5.
It is deliberately independent of the two published evaluation formulas: the
carrier, score, endpoints, and every prefix interval remain literal inputs.
-/

/-- `p` is a literal initial segment of `w`. -/
def IsPrefix (p w : Path) : Prop := ∃ suffix, w = p ++ suffix

/-- A cover after pulling a linearly ordered score back to a path carrier. -/
def PullbackCover {α : Type*} [LT α]
    (carrier : Path → Prop) (score : Path → α) (x y : Path) : Prop :=
  carrier x ∧ carrier y ∧ score x < score y ∧
    ∀ z, carrier z → ¬(score x < score z ∧ score z < score y)

/-- A claimed closed score interval for every carrier completion of a prefix. -/
structure PrefixBound (α : Type*) where
  pathPrefix : Path
  lower : α
  upper : α
deriving DecidableEq, Repr

def PrefixBound.Sound {α : Type*} [Preorder α]
    (carrier : Path → Prop) (score : Path → α) (bound : PrefixBound α) : Prop :=
  ∀ w, carrier w → IsPrefix bound.pathPrefix w →
    bound.lower ≤ score w ∧ score w ≤ bound.upper

/-- Every carrier leaf is represented by one of the committed prefixes. -/
def CoversCarrier {α : Type*} (carrier : Path → Prop)
    (cert : List (PrefixBound α)) : Prop :=
  ∀ w, carrier w → ∃ bound ∈ cert, IsPrefix bound.pathPrefix w

/-- A prefix interval lies entirely outside the open endpoint interval. -/
def PrefixBound.Outside {α : Type*} [Preorder α]
    (s t : α) (bound : PrefixBound α) : Prop :=
  bound.upper ≤ s ∨ t ≤ bound.lower

/-- The full proof obligations carried by a prefix interval certificate. -/
def ValidCoverCertificate {α : Type*} [Preorder α]
    (carrier : Path → Prop) (score : Path → α) (s t : α)
    (cert : List (PrefixBound α)) : Prop :=
  CoversCarrier carrier cert ∧
    (∀ bound ∈ cert, bound.Sound carrier score) ∧
    ∀ bound ∈ cert, bound.Outside s t

/-- Soundness of the exact certificate format: no carrier score lies strictly
between the two endpoint scores. -/
theorem certificate_excludes_open_interval {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {s t : α}
    {cert : List (PrefixBound α)}
    (hcert : ValidCoverCertificate carrier score s t cert) :
    ∀ w, carrier w → ¬(s < score w ∧ score w < t) := by
  intro w hw hbetween
  rcases hcert.1 w hw with ⟨bound, hbound, hpref⟩
  have hrange := hcert.2.1 bound hbound w hw hpref
  rcases hcert.2.2 bound hbound with hbelow | habove
  · exact (not_lt_of_ge (hrange.2.trans hbelow)) hbetween.1
  · exact (not_lt_of_ge (habove.trans hrange.1)) hbetween.2

/-- A valid certificate plus literal endpoint membership and strict order
produces the desired pullback cover. -/
theorem pullbackCover_of_certificate {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {x y : Path}
    {cert : List (PrefixBound α)}
    (hx : carrier x) (hy : carrier y) (hxy : score x < score y)
    (hcert : ValidCoverCertificate carrier score (score x) (score y) cert) :
    PullbackCover carrier score x y := by
  refine ⟨hx, hy, hxy, ?_⟩
  exact certificate_excludes_open_interval hcert

/-- A one-point interval attached to a complete leaf. -/
def exactBound {α : Type*} (score : Path → α) (w : Path) : PrefixBound α where
  pathPrefix := w
  lower := score w
  upper := score w

theorem eq_of_prefix_of_eq_length {p w : Path}
    (hpref : IsPrefix p w) (hlen : p.length = w.length) : p = w := by
  rcases hpref with ⟨suffix, rfl⟩
  have hsuffix : suffix.length = 0 := by
    simpa [List.length_append] using hlen
  cases suffix with
  | nil => simp
  | cons _ _ => simp at hsuffix

/-- Completeness of the certificate language.  On a finite fixed-length
carrier, every genuine cover has an exact certificate (the uncompressed list
of all leaves).  Thus the compressed certificates used in the paper lose no
logical generality. -/
theorem certificate_of_pullbackCover {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {x y : Path} {N : Nat}
    (paths : List Path)
    (hpathsSound : ∀ p ∈ paths, carrier p)
    (hpathsComplete : ∀ w, carrier w → w ∈ paths)
    (hfixedLength : ∀ w, carrier w → w.length = N)
    (hcover : PullbackCover carrier score x y) :
    ValidCoverCertificate carrier score (score x) (score y)
      (paths.map (exactBound score)) := by
  refine ⟨?_, ?_, ?_⟩
  · intro w hw
    refine ⟨exactBound score w, List.mem_map.mpr ⟨w, hpathsComplete w hw, rfl⟩, ?_⟩
    change IsPrefix w w
    exact ⟨[], by simp⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    intro w hw hpref
    have hpCarrier := hpathsSound p hp
    have hpEq : p = w := eq_of_prefix_of_eq_length hpref
      ((hfixedLength p hpCarrier).trans (hfixedLength w hw).symm)
    subst w
    exact ⟨le_rfl, le_rfl⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨p, hp, rfl⟩
    have hpCarrier := hpathsSound p hp
    by_cases hle : score p ≤ score x
    · exact Or.inl hle
    · right
      have hxp : score x < score p := lt_of_not_ge hle
      by_contra hnot
      have hpy : score p < score y := lt_of_not_ge hnot
      exact hcover.2.2.2 p hpCarrier ⟨hxp, hpy⟩

/-- Exact equivalence between coverhood and existence of a valid certificate,
given any finite exact enumeration of a fixed-length carrier. -/
theorem pullbackCover_iff_exists_certificate {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {x y : Path} {N : Nat}
    (paths : List Path)
    (hpathsSound : ∀ p ∈ paths, carrier p)
    (hpathsComplete : ∀ w, carrier w → w ∈ paths)
    (hfixedLength : ∀ w, carrier w → w.length = N)
    (hx : carrier x) (hy : carrier y) (hxy : score x < score y) :
    PullbackCover carrier score x y ↔
      ∃ cert, ValidCoverCertificate carrier score (score x) (score y) cert := by
  constructor
  · intro hcover
    exact ⟨paths.map (exactBound score),
      certificate_of_pullbackCover paths hpathsSound hpathsComplete hfixedLength hcover⟩
  · rintro ⟨cert, hcert⟩
    exact pullbackCover_of_certificate hx hy hxy hcert

/-- A finite full-leaf partition is a second exact certificate form.  It is
used as an independent replay for small examples, so that a compressed
interval certificate is never the sole evidence for its endpoint claim. -/
theorem pullbackCover_of_leaf_partition {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {x y : Path} {N : Nat}
    (leaves : List Path)
    (hx : carrier x) (hy : carrier y) (hxy : score x < score y)
    (hcoverage : ∀ w, carrier w → ∃ q ∈ leaves, IsPrefix q w)
    (hcarrierLength : ∀ w, carrier w → w.length = N)
    (hleafLength : ∀ q ∈ leaves, q.length = N)
    (houtside : ∀ q ∈ leaves, score q ≤ score x ∨ score y ≤ score q) :
    PullbackCover carrier score x y := by
  refine ⟨hx, hy, hxy, ?_⟩
  intro w hw hbetween
  rcases hcoverage w hw with ⟨q, hq, hpref⟩
  have hqw : q = w := eq_of_prefix_of_eq_length hpref
    ((hleafLength q hq).trans (hcarrierLength w hw).symm)
  subst w
  rcases houtside q hq with hbelow | habove
  · exact (not_lt_of_ge hbelow) hbetween.1
  · exact (not_lt_of_ge habove) hbetween.2

theorem validExactLeafCertificate {α : Type*} [LinearOrder α]
    {carrier : Path → Prop} {score : Path → α} {s t : α} {N : Nat}
    (leaves : List Path)
    (hcoverage : ∀ w, carrier w → ∃ q ∈ leaves, IsPrefix q w)
    (hcarrierLength : ∀ w, carrier w → w.length = N)
    (hleafLength : ∀ q ∈ leaves, q.length = N)
    (houtside : ∀ q ∈ leaves, score q ≤ s ∨ t ≤ score q) :
    ValidCoverCertificate carrier score s t (leaves.map (exactBound score)) := by
  refine ⟨?_, ?_, ?_⟩
  · intro w hw
    rcases hcoverage w hw with ⟨q, hq, hpref⟩
    exact ⟨exactBound score q, List.mem_map.mpr ⟨q, hq, rfl⟩, by
      simpa [exactBound] using hpref⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨q, hq, rfl⟩
    intro w hw hpref
    have hqw : q = w := eq_of_prefix_of_eq_length hpref
      ((hleafLength q hq).trans (hcarrierLength w hw).symm)
    subst w
    exact ⟨le_rfl, le_rfl⟩
  · intro bound hbound
    rcases List.mem_map.mp hbound with ⟨q, hq, rfl⟩
    simpa [PrefixBound.Outside, exactBound] using houtside q hq

end LatticePathOrders
