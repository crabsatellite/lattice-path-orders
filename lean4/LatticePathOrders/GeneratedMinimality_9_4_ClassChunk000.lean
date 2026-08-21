import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_9_4

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRURRURRURRU", numerator := 16843627085, qMin := 43261 },
  { anchor := mustParsePath "RRRRURRURURRU", numerator := 17551745285, qMin := 44101 },
  { anchor := mustParsePath "RRRURRURRRURU", numerator := 17453316317, qMin := 43649 },
  { anchor := mustParsePath "RRRURRRURURRU", numerator := 17456487125, qMin := 43651 },
  { anchor := mustParsePath "RRRRURURRRURU", numerator := 18180477221, qMin := 44491 },
  { anchor := mustParsePath "RRRRURURRURRU", numerator := 17548565837, qMin := 43709 },
  { anchor := mustParsePath "RRRRRURURRURU", numerator := 18297161285, qMin := 44623 },
  { anchor := mustParsePath "RRRURRRRURURU", numerator := 18206374757, qMin := 44509 },
  { anchor := mustParsePath "RRRRRURURURRU", numerator := 18319893197, qMin := 44639 },
  { anchor := mustParsePath "RRRRRRURURURU", numerator := 19124400677, qMin := 45607 },
  { anchor := mustParsePath "RRRRRRRURUURU", numerator := 25289586725, qMin := 52363 },
  { anchor := mustParsePath "RRRRRURRUURRU", numerator := 22916812685, qMin := 47789 },
  { anchor := mustParsePath "RRRRRRURUURRU", numerator := 24071832797, qMin := 48907 },
  { anchor := mustParsePath "RRRURRRURRRUU", numerator := 22609031765, qMin := 47081 },
  { anchor := mustParsePath "RRRURRRRURRUU", numerator := 22753610645, qMin := 47221 },
  { anchor := mustParsePath "RRRRURURRRRUU", numerator := 23667668645, qMin := 48113 },
  { anchor := mustParsePath "RRRURRURRRRUU", numerator := 22724658005, qMin := 47143 },
  { anchor := mustParsePath "RRRRRUURRRRUU", numerator := 30835008797, qMin := 54907 },
  { anchor := mustParsePath "RRRRRUURRRURU", numerator := 23689827221, qMin := 48125 },
  { anchor := mustParsePath "RRRRRRUURRRUU", numerator := 30872949845, qMin := 54937 },
  { anchor := mustParsePath "RRRURRRRUURRU", numerator := 22749990557, qMin := 47159 },
  { anchor := mustParsePath "RRRRRUURRURRU", numerator := 22887756365, qMin := 47293 },
  { anchor := mustParsePath "RRRRRRUURRURU", numerator := 23867469077, qMin := 48293 },
  { anchor := mustParsePath "RRRURRRRRURUU", numerator := 23897140565, qMin := 48323 },
  { anchor := mustParsePath "RRRRRRRUURRUU", numerator := 31139190365, qMin := 55159 },
  { anchor := mustParsePath "RRRRURRRRUURU", numerator := 23874885221, qMin := 48241 },
  { anchor := mustParsePath "RRRURRRRRUURU", numerator := 23893430621, qMin := 48251 },
  { anchor := mustParsePath "RRRRRRUURURRU", numerator := 24045774485, qMin := 48403 },
  { anchor := mustParsePath "RRRRRRRUURURU", numerator := 25106719397, qMin := 49457 },
  { anchor := mustParsePath "RRRRRRRRUURUU", numerator := 32995632605, qMin := 56683 },
  { anchor := mustParsePath "RRRRURRRRRUUU", numerator := 32478887957, qMin := 55789 },
  { anchor := mustParsePath "RRRURRRRRRUUU", numerator := 32513499221, qMin := 55817 },
  { anchor := mustParsePath "RRRRRRRUUURRU", numerator := 32756294165, qMin := 56023 },
  { anchor := mustParsePath "RRRRRRRRUUURU", numerator := 34445504021, qMin := 57437 },
  { anchor := mustParsePath "RRRRRRRRRUUUU", numerator := 47166718037, qMin := 67129 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_9_4
