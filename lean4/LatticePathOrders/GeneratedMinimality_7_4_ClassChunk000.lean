import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_4

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURRURRURU", numerator := 376282400, qMin := 6466 },
  { anchor := mustParsePath "RRRURURRURU", numerator := 389904512, qMin := 6524 },
  { anchor := mustParsePath "RRURRRURURU", numerator := 390378560, qMin := 6526 },
  { anchor := mustParsePath "RRRRURURURU", numerator := 407151680, qMin := 6656 },
  { anchor := mustParsePath "RRRRRURUURU", numerator := 538332800, qMin := 7640 },
  { anchor := mustParsePath "RRURRRURRUU", numerator := 488321600, qMin := 6976 },
  { anchor := mustParsePath "RRURRRRURUU", numerator := 512479040, qMin := 7136 },
  { anchor := mustParsePath "RRRURURRRUU", numerator := 504900896, qMin := 7036 },
  { anchor := mustParsePath "RRURRURRRUU", numerator := 487791392, qMin := 6914 },
  { anchor := mustParsePath "RRRRUURRRUU", numerator := 657307040, qMin := 8018 },
  { anchor := mustParsePath "RRRRUURRURU", numerator := 508141760, qMin := 7048 },
  { anchor := mustParsePath "RRRURRRUURU", numerator := 509224352, qMin := 7054 },
  { anchor := mustParsePath "RRRRRUURRUU", numerator := 662856512, qMin := 8048 },
  { anchor := mustParsePath "RRURRRRUURU", numerator := 511935872, qMin := 7064 },
  { anchor := mustParsePath "RRRRRUURURU", numerator := 534441920, qMin := 7216 },
  { anchor := mustParsePath "RRRRRRUURUU", numerator := 702356000, qMin := 8270 },
  { anchor := mustParsePath "RRRURRRRUUU", numerator := 692216096, qMin := 8146 },
  { anchor := mustParsePath "RRURRRRRUUU", numerator := 697276832, qMin := 8174 },
  { anchor := mustParsePath "RRRRRRUUURU", numerator := 733218080, qMin := 8380 },
  { anchor := mustParsePath "RRRRRRRUUUU", numerator := 1004002592, qMin := 9794 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_7_4
