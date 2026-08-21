import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRURRRURRRU", numerator := 24001135925, qMin := 51641 },
  { anchor := mustParsePath "RRRRURRRRURRU", numerator := 24127719557, qMin := 51709 },
  { anchor := mustParsePath "RRRRRURRURRRU", numerator := 24146362877, qMin := 51719 },
  { anchor := mustParsePath "RRRRRRURRURRU", numerator := 24295768637, qMin := 51877 },
  { anchor := mustParsePath "RRRRURRRRRURU", numerator := 25152374021, qMin := 52321 },
  { anchor := mustParsePath "RRRRRRURURRRU", numerator := 25175216885, qMin := 52343 },
  { anchor := mustParsePath "RRRRRRRURURRU", numerator := 25335407237, qMin := 52507 },
  { anchor := mustParsePath "RRRRRRRRURURU", numerator := 26447541125, qMin := 53633 },
  { anchor := mustParsePath "RRRRRURRRRRUU", numerator := 32769326525, qMin := 56603 },
  { anchor := mustParsePath "RRRRURRRRRRUU", numerator := 32773671221, qMin := 56605 },
  { anchor := mustParsePath "RRRRRRRUURRRU", numerator := 32808439157, qMin := 56633 },
  { anchor := mustParsePath "RRRRRRRRUURRU", numerator := 33047967677, qMin := 56827 },
  { anchor := mustParsePath "RRRRRRRRRUURU", numerator := 34713279221, qMin := 58157 },
  { anchor := mustParsePath "RRRRRRRRRRUUU", numerator := 47229286325, qMin := 67273 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_10_3
