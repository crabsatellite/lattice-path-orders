import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_5_4

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURURURU", numerator := 8732021, qMin := 985 },
  { anchor := mustParsePath "RRRURUURU", numerator := 11471765, qMin := 1117 },
  { anchor := mustParsePath "RRURURRUU", numerator := 10909805, qMin := 1043 },
  { anchor := mustParsePath "RRURRUURU", numerator := 10989221, qMin := 1045 },
  { anchor := mustParsePath "RRRUURRUU", numerator := 14130077, qMin := 1177 },
  { anchor := mustParsePath "RRRUURURU", numerator := 11390621, qMin := 1055 },
  { anchor := mustParsePath "RRRRUURUU", numerator := 14953685, qMin := 1207 },
  { anchor := mustParsePath "RRURRRUUU", numerator := 14861021, qMin := 1195 },
  { anchor := mustParsePath "RRRRUUURU", numerator := 15610397, qMin := 1223 },
  { anchor := mustParsePath "RRRRRUUUU", numerator := 21372125, qMin := 1429 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_5_4
