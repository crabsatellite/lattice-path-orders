import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRURRRRRRU", numerator := 1636268213885, qMin := 426389 },
  { anchor := mustParsePath "RRRRRRRRURRRRRU", numerator := 1636298914037, qMin := 426391 },
  { anchor := mustParsePath "RRRRRRRRRURRRRU", numerator := 1636513823165, qMin := 426407 },
  { anchor := mustParsePath "RRRRRRRRRRURRRU", numerator := 1637987865917, qMin := 426517 },
  { anchor := mustParsePath "RRRRRRRRRRRURRU", numerator := 1648109061365, qMin := 427271 },
  { anchor := mustParsePath "RRRRRRRRRRRRURU", numerator := 1718319857405, qMin := 432439 },
  { anchor := mustParsePath "RRRRRRRRRRRRRUU", numerator := 2238970549757, qMin := 467861 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_13_2
