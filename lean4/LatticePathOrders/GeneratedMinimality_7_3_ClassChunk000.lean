import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRURRURRU", numerator := 75533477, qMin := 2897 },
  { anchor := mustParsePath "RRRURRRURU", numerator := 78269405, qMin := 2923 },
  { anchor := mustParsePath "RRRRURURRU", numerator := 78694637, qMin := 2927 },
  { anchor := mustParsePath "RRRRRURURU", numerator := 82137965, qMin := 2989 },
  { anchor := mustParsePath "RRRURRRRUU", numerator := 101909021, qMin := 3157 },
  { anchor := mustParsePath "RRRRRUURRU", numerator := 102637157, qMin := 3167 },
  { anchor := mustParsePath "RRRRRRUURU", numerator := 107806685, qMin := 3241 },
  { anchor := mustParsePath "RRRRRRRUUU", numerator := 146676317, qMin := 3749 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_7_3
