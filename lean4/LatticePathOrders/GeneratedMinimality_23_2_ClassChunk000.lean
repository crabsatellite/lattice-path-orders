import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_23_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRRRRRRURRRRRRRRRRRU", numerator := 374419513217356443680, qMin := 6449974274 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURRRRRRRRRRU", numerator := 374419513681754591552, qMin := 6449974276 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURRRRRRRRRU", numerator := 374419516932541634720, qMin := 6449974292 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRURRRRRRRRU", numerator := 374419539223653168032, qMin := 6449974402 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRURRRRRRRU", numerator := 374419692010664663360, qMin := 6449975156 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRURRRRRRU", numerator := 374420739229470068000, qMin := 6449980324 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRURRRRRU", numerator := 374427917013392720672, qMin := 6450015746 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRURRRRU", numerator := 374477116128136243520, qMin := 6450258532 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRURRRU", numerator := 374814418874368798112, qMin := 6451922612 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRRURRU", numerator := 377130413303838523040, qMin := 6463328386 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRRRURU", numerator := 393196477904455680320, qMin := 6541504724 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRRRRRUU", numerator := 512334959365117647392, qMin := 7077333316 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_23_2
