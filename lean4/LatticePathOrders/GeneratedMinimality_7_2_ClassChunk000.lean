import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRURRRU", numerator := 15800621, qMin := 1325 },
  { anchor := mustParsePath "RRRRRURRU", numerator := 15896165, qMin := 1327 },
  { anchor := mustParsePath "RRRRRRURU", numerator := 16573037, qMin := 1343 },
  { anchor := mustParsePath "RRRRRRRUU", numerator := 21594605, qMin := 1453 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_7_2
