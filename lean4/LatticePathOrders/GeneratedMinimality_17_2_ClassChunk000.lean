import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRRRURRRRRRRRU", numerator := 3611229944120096, qMin := 20031170 },
  { anchor := mustParsePath "RRRRRRRRRRURRRRRRRU", numerator := 3611231386364480, qMin := 20031172 },
  { anchor := mustParsePath "RRRRRRRRRRRURRRRRRU", numerator := 3611241482083232, qMin := 20031188 },
  { anchor := mustParsePath "RRRRRRRRRRRRURRRRRU", numerator := 3611310710249120, qMin := 20031298 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURRRRU", numerator := 3611785229496896, qMin := 20032052 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURRRU", numerator := 3615038472536096, qMin := 20037220 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRURRU", numerator := 3637375950878240, qMin := 20072642 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRURU", numerator := 3792331146592832, qMin := 20315428 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRUU", numerator := 4941406988800160, qMin := 21979508 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_17_2
