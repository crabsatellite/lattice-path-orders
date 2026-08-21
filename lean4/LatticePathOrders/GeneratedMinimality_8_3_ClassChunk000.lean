import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_8_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRURRRURRU", numerator := 514518485, qMin := 7561 },
  { anchor := mustParsePath "RRRRURRURRU", numerator := 517244045, qMin := 7571 },
  { anchor := mustParsePath "RRRURRRRURU", numerator := 535968797, qMin := 7639 },
  { anchor := mustParsePath "RRRRRURURRU", numerator := 539307725, qMin := 7661 },
  { anchor := mustParsePath "RRRRRRURURU", numerator := 562970525, qMin := 7825 },
  { anchor := mustParsePath "RRRRURRRRUU", numerator := 697752221, qMin := 8261 },
  { anchor := mustParsePath "RRRURRRRRUU", numerator := 698386325, qMin := 8263 },
  { anchor := mustParsePath "RRRRRRUURRU", numerator := 703469525, qMin := 8291 },
  { anchor := mustParsePath "RRRRRRRUURU", numerator := 738915485, qMin := 8485 },
  { anchor := mustParsePath "RRRRRRRRUUU", numerator := 1005333845, qMin := 9815 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_8_3
