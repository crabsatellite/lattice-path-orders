import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_9_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRURRRRU", numerator := 741527357, qMin := 9077 },
  { anchor := mustParsePath "RRRRRRURRRU", numerator := 742181045, qMin := 9079 },
  { anchor := mustParsePath "RRRRRRRURRU", numerator := 746764925, qMin := 9095 },
  { anchor := mustParsePath "RRRRRRRRURU", numerator := 778577405, qMin := 9205 },
  { anchor := mustParsePath "RRRRRRRRRUU", numerator := 1014486197, qMin := 9959 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_9_2
