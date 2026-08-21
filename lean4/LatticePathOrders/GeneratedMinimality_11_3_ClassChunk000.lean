import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRURRRRURRRU", numerator := 164358078917, qMin := 135137 },
  { anchor := mustParsePath "RRRRRURRRURRRU", numerator := 164484591485, qMin := 135163 },
  { anchor := mustParsePath "RRRRURRRRRURRU", numerator := 165352023221, qMin := 135341 },
  { anchor := mustParsePath "RRRRRRURRURRRU", numerator := 165498444221, qMin := 135397 },
  { anchor := mustParsePath "RRRRRRRURRURRU", numerator := 166525205621, qMin := 135815 },
  { anchor := mustParsePath "RRRRRURRRRRURU", numerator := 172373602037, qMin := 136969 },
  { anchor := mustParsePath "RRRRURRRRRRURU", numerator := 172393531205, qMin := 136973 },
  { anchor := mustParsePath "RRRRRRRURURRRU", numerator := 172553006021, qMin := 137035 },
  { anchor := mustParsePath "RRRRRRRRURURRU", numerator := 173651391221, qMin := 137465 },
  { anchor := mustParsePath "RRRRRRRRRURURU", numerator := 181274132165, qMin := 140413 },
  { anchor := mustParsePath "RRRRRURRRRRRUU", numerator := 224599218557, qMin := 148183 },
  { anchor := mustParsePath "RRRRURRRRRRRUU", numerator := 224633342021, qMin := 148193 },
  { anchor := mustParsePath "RRRRRRRRUURRRU", numerator := 224872278845, qMin := 148267 },
  { anchor := mustParsePath "RRRRRRRRRUURRU", numerator := 226514124221, qMin := 148775 },
  { anchor := mustParsePath "RRRRRRRRRRUURU", numerator := 237928352837, qMin := 152257 },
  { anchor := mustParsePath "RRRRRRRRRRRUUU", numerator := 323714343677, qMin := 176123 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_11_3
