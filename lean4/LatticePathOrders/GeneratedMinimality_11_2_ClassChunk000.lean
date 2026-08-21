import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRURRRRRU", numerator := 34830756896, qMin := 62210 },
  { anchor := mustParsePath "RRRRRRRURRRRU", numerator := 34835236160, qMin := 62212 },
  { anchor := mustParsePath "RRRRRRRRURRRU", numerator := 34866599072, qMin := 62228 },
  { anchor := mustParsePath "RRRRRRRRRURRU", numerator := 35082039200, qMin := 62338 },
  { anchor := mustParsePath "RRRRRRRRRRURU", numerator := 36576562496, qMin := 63092 },
  { anchor := mustParsePath "RRRRRRRRRRRUU", numerator := 47659256096, qMin := 68260 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_11_2
