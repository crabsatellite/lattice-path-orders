import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_21_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRRRRRURRRRRRRRRRU", numerator := 7969982227355333021, qMin := 941038565 },
  { anchor := mustParsePath "RRRRRRRRRRRRURRRRRRRRRU", numerator := 7969982295110109845, qMin := 941038567 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURRRRRRRRU", numerator := 7969982769393555677, qMin := 941038583 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURRRRRRRU", numerator := 7969986021623278685, qMin := 941038693 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRURRRRRRU", numerator := 7970008312965699221, qMin := 941039447 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRURRRRRU", numerator := 7970161100969390621, qMin := 941044615 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRURRRRU", numerator := 7971208364949125405, qMin := 941080037 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRURRRU", numerator := 7978388270893936277, qMin := 941322823 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRURRU", numerator := 8027687075478424925, qMin := 942986903 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRURU", numerator := 8369673122210400221, qMin := 954392677 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRRUU", numerator := 10905682985311376021, qMin := 1032569015 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_21_2
