import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_5_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURRURU", numerator := 1687397, qMin := 433 },
  { anchor := mustParsePath "RRRURURU", numerator := 1750325, qMin := 437 },
  { anchor := mustParsePath "RRURRRUU", numerator := 2187437, qMin := 463 },
  { anchor := mustParsePath "RRRRUURU", numerator := 2295221, qMin := 473 },
  { anchor := mustParsePath "RRRRRUUU", numerator := 3122285, qMin := 547 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_5_3
