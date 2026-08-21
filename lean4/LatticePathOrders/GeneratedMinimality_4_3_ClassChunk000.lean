import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_4_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURURU", numerator := 257045, qMin := 169 },
  { anchor := mustParsePath "RRURRUU", numerator := 321485, qMin := 179 },
  { anchor := mustParsePath "RRRUURU", numerator := 335237, qMin := 181 },
  { anchor := mustParsePath "RRRRUUU", numerator := 455621, qMin := 209 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_4_3
