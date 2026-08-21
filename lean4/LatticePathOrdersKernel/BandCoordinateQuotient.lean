import LatticePathOrdersKernel.BandCoordinateDefs

/-!
# The coordinate presentation is the square-band quotient

All quotient reasoning is proved abstractly here.  The only finite input is a
`BandCoordinateCertificate`; no problem-specific graph is unfolded in these
proofs.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

variable {n : Nat} [NeZero n] {word : Path} {table : NeighborTable}

theorem rawGlueConnectedTwo_eqvGen
    {steps : ZMod n → Direction} {left right : RawBandCorner n}
    (h : RawGlueConnectedTwo steps left right) :
    Relation.EqvGen (GlueRel steps) left right := by
  rcases h with hEq | hGlue | ⟨middle, hleft, hright⟩
  · subst right
    exact Relation.EqvGen.refl _
  · exact Relation.EqvGen.rel _ _ hGlue
  · exact Relation.EqvGen.trans _ _ _
      (Relation.EqvGen.rel _ _ hleft)
      (Relation.EqvGen.rel _ _ hright)

theorem coordinate_eq_of_eqvGen
    (certificate : BandCoordinateCertificate n word table)
    {left right : RawBandCorner n}
    (h : Relation.EqvGen (GlueRel (pathDirections n word)) left right) :
    gluedRawCoordinate word left = gluedRawCoordinate word right := by
  induction h with
  | rel left right hrel => exact certificate.glue_preserves left right hrel
  | refl => rfl
  | symm _ _ _ ih => exact ih.symm
  | trans _ _ _ _ _ ihleft ihright => exact ihleft.trans ihright

def bandCoordinate
    (certificate : BandCoordinateCertificate n word table) :
    PathBandVertex n word → Coord :=
  Quotient.lift (gluedRawCoordinate word)
    (fun _ _ h => coordinate_eq_of_eqvGen certificate h)

@[simp] theorem bandCoordinate_mk
    (certificate : BandCoordinateCertificate n word table)
    (raw : RawBandCorner n) :
    bandCoordinate certificate
      (Quotient.mk (bandCornerSetoid (pathDirections n word)) raw) =
        gluedRawCoordinate word raw :=
  rfl

def bandTableVertex
    (certificate : BandCoordinateCertificate n word table)
    (vertex : PathBandVertex n word) : TableVertex table :=
  ⟨bandCoordinate certificate vertex, by
    refine Quotient.inductionOn vertex ?_
    exact certificate.raw_vertex⟩

@[simp] theorem bandTableVertex_mk_val
    (certificate : BandCoordinateCertificate n word table)
    (raw : RawBandCorner n) :
    (bandTableVertex certificate
      (Quotient.mk (bandCornerSetoid (pathDirections n word)) raw)).1 =
        gluedRawCoordinate word raw :=
  rfl

noncomputable def chosenRaw
    (certificate : BandCoordinateCertificate n word table)
    (point : TableVertex table) : RawBandCorner n :=
  Classical.choose (certificate.raw_surjective point.1 point.2)

theorem chosenRaw_spec
    (certificate : BandCoordinateCertificate n word table)
    (point : TableVertex table) :
    gluedRawCoordinate word (chosenRaw certificate point) = point.1 :=
  Classical.choose_spec (certificate.raw_surjective point.1 point.2)

noncomputable def tableBandVertex
    (certificate : BandCoordinateCertificate n word table)
    (point : TableVertex table) : PathBandVertex n word :=
  Quotient.mk (bandCornerSetoid (pathDirections n word))
    (chosenRaw certificate point)

@[simp] theorem tableBandVertex_bandTableVertex
    (certificate : BandCoordinateCertificate n word table)
    (point : TableVertex table) :
    bandTableVertex certificate (tableBandVertex certificate point) = point := by
  apply Subtype.ext
  exact chosenRaw_spec certificate point

@[simp] theorem bandTableVertex_tableBandVertex
    (certificate : BandCoordinateCertificate n word table)
    (vertex : PathBandVertex n word) :
    tableBandVertex certificate (bandTableVertex certificate vertex) = vertex := by
  refine Quotient.inductionOn vertex ?_
  intro raw
  apply Quotient.sound
  apply rawGlueConnectedTwo_eqvGen
  apply certificate.coordinate_complete
  simpa using chosenRaw_spec certificate
    (bandTableVertex certificate
      (Quotient.mk (bandCornerSetoid (pathDirections n word)) raw))

noncomputable def bandTableVertexEquiv
    (certificate : BandCoordinateCertificate n word table) :
    PathBandVertex n word ≃ TableVertex table where
  toFun := bandTableVertex certificate
  invFun := tableBandVertex certificate
  left_inv := bandTableVertex_tableBandVertex certificate
  right_inv := tableBandVertex_bandTableVertex certificate

theorem quotient_eq_of_coordinate_eq
    (certificate : BandCoordinateCertificate n word table)
    {left right : RawBandCorner n}
    (h : gluedRawCoordinate word left = gluedRawCoordinate word right) :
    Quotient.mk (bandCornerSetoid (pathDirections n word)) left =
      Quotient.mk (bandCornerSetoid (pathDirections n word)) right := by
  apply Quotient.sound
  exact rawGlueConnectedTwo_eqvGen
    (certificate.coordinate_complete left right h)

theorem rawBandSide_symm {left right : RawBandCorner n}
    (h : RawBandSide left right) : RawBandSide right left := by
  rcases h with ⟨tile, corner, hdirect | hreversed⟩
  · exact ⟨tile, corner, Or.inr ⟨hdirect.1, hdirect.2⟩⟩
  · exact ⟨tile, corner, Or.inl ⟨hreversed.1, hreversed.2⟩⟩

theorem rawBandSide_bandAdj {left right : RawBandCorner n}
    (h : RawBandSide left right) :
    BandAdj (pathDirections n word)
      (Quotient.mk (bandCornerSetoid (pathDirections n word)) left)
      (Quotient.mk (bandCornerSetoid (pathDirections n word)) right) := by
  rcases h with ⟨tile, corner, hdirect | hreversed⟩
  · rw [hdirect.1, hdirect.2]
    exact ⟨tile, corner, Or.inl ⟨rfl, rfl⟩⟩
  · rw [hreversed.1, hreversed.2]
    exact ⟨tile, corner, Or.inr ⟨rfl, rfl⟩⟩

theorem tableRelation_of_mem_neighbors
    {table : NeighborTable} {relation : Coord → Coord → Prop}
    (hrows : table.Forall fun row =>
      row.2.Forall fun right => relation row.1 right)
    {left right : Coord} (hmem : right ∈ tableNeighbors table left) :
    relation left right := by
  induction table with
  | nil => simp [tableNeighbors] at hmem
  | cons row rest ih =>
      have hparts :
          row.2.Forall (fun right => relation row.1 right) ∧
            rest.Forall (fun item =>
              item.2.Forall fun right => relation item.1 right) := by
        simpa only [List.forall_cons] using hrows
      simp only [tableNeighbors] at hmem
      split at hmem
      · subst left
        exact List.forall_iff_forall_mem.mp hparts.1 right hmem
      · exact ih hparts.2 hmem

theorem certificate_adjacency_iff
    (certificate : BandCoordinateCertificate n word table)
    (left right : RawBandCorner n) :
    gluedRawCoordinate word right ∈
        tableNeighbors table (gluedRawCoordinate word left) ↔
      TableCoordinateSide (n := n) word
        (gluedRawCoordinate word left) (gluedRawCoordinate word right) := by
  constructor
  · exact tableRelation_of_mem_neighbors certificate.edge_complete
  · rintro ⟨tile, corner, hdirect | hreversed⟩
    · rw [← hdirect.1, ← hdirect.2]
      exact certificate.side_forward tile corner
    · rw [← hreversed.1, ← hreversed.2]
      exact certificate.side_reverse tile corner

theorem bandTableVertex_map_adj_iff
    (certificate : BandCoordinateCertificate n word table)
    (left right : PathBandVertex n word) :
    BandAdj (pathDirections n word) left right ↔
      TableAdj table (bandTableVertex certificate left)
        (bandTableVertex certificate right) := by
  refine Quotient.inductionOn₂ left right ?_
  intro rawLeft rawRight
  constructor
  · rintro ⟨tile, corner, hdirect | hreversed⟩
    · apply (certificate_adjacency_iff certificate rawLeft rawRight).mpr
      let sideLeft : RawBandCorner n := ⟨tile, corner⟩
      let sideRight : RawBandCorner n :=
        ⟨tile, cornerSuccessor corner⟩
      have hleft := congrArg (bandCoordinate certificate) hdirect.1
      have hright := congrArg (bandCoordinate certificate) hdirect.2
      exact ⟨tile, corner, Or.inl ⟨
        by simpa [sideLeft] using hleft.symm,
        by simpa [sideRight] using hright.symm⟩⟩
    · apply (certificate_adjacency_iff certificate rawLeft rawRight).mpr
      let sideLeft : RawBandCorner n :=
        ⟨tile, cornerSuccessor corner⟩
      let sideRight : RawBandCorner n := ⟨tile, corner⟩
      have hleft := congrArg (bandCoordinate certificate) hreversed.2
      have hright := congrArg (bandCoordinate certificate) hreversed.1
      exact ⟨tile, corner, Or.inr ⟨
        by simpa [sideLeft] using hleft.symm,
        by simpa [sideRight] using hright.symm⟩⟩
  · intro hadj
    rcases (certificate_adjacency_iff certificate rawLeft rawRight).mp hadj with
      ⟨tile, corner, hdirect | hreversed⟩
    · have hqleft := quotient_eq_of_coordinate_eq certificate hdirect.1
      have hqright := quotient_eq_of_coordinate_eq certificate hdirect.2
      rw [← hqleft, ← hqright]
      exact ⟨tile, corner, Or.inl ⟨rfl, rfl⟩⟩
    · have hqleft := quotient_eq_of_coordinate_eq certificate hreversed.1
      have hqright := quotient_eq_of_coordinate_eq certificate hreversed.2
      rw [← hqleft, ← hqright]
      exact ⟨tile, corner, Or.inr ⟨rfl, rfl⟩⟩

noncomputable def bandGraphIsoToTableGraphIso
    {leftWord rightWord : Path} {leftTable rightTable : NeighborTable}
    (leftCertificate : BandCoordinateCertificate n leftWord leftTable)
    (rightCertificate : BandCoordinateCertificate n rightWord rightTable)
    (iso : BandGraphIso (pathDirections n leftWord)
      (pathDirections n rightWord)) :
    TableGraphIso leftTable rightTable where
  vertexEquiv :=
    (bandTableVertexEquiv leftCertificate).symm.trans
      (iso.vertexEquiv.trans (bandTableVertexEquiv rightCertificate))
  map_adj_iff u v := by
    let leftU := (bandTableVertexEquiv leftCertificate).symm u
    let leftV := (bandTableVertexEquiv leftCertificate).symm v
    have hleft :=
      (bandTableVertex_map_adj_iff leftCertificate leftU leftV).symm
    have hmiddle := iso.map_adj_iff leftU leftV
    have hright := bandTableVertex_map_adj_iff rightCertificate
      (iso.vertexEquiv leftU) (iso.vertexEquiv leftV)
    simpa [leftU, leftV, bandTableVertexEquiv] using
      hleft.trans (hmiddle.trans hright)

end LatticePathOrdersKernel
