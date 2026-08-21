import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_15_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRRURRRRRRRU", numerator := 76869529695725, qMin := 2922509 },
  { anchor := mustParsePath "RRRRRRRRRURRRRRRU", numerator := 76869740116517, qMin := 2922511 },
  { anchor := mustParsePath "RRRRRRRRRRURRRRRU", numerator := 76871213070125, qMin := 2922527 },
  { anchor := mustParsePath "RRRRRRRRRRRURRRRU", numerator := 76881313703597, qMin := 2922637 },
  { anchor := mustParsePath "RRRRRRRRRRRRURRRU", numerator := 76950562989605, qMin := 2923391 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURRU", numerator := 77426043828845, qMin := 2928559 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURU", numerator := 80724456733037, qMin := 2963981 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRUU", numerator := 105183956581925, qMin := 3206767 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_15_2
