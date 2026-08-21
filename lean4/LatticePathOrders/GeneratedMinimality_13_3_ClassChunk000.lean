import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRURRRRURRRRU", numerator := 7713367517021, qMin := 925765 },
  { anchor := mustParsePath "RRRRRURRRRRURRRU", numerator := 7719300959765, qMin := 925943 },
  { anchor := mustParsePath "RRRRRRURRRURRRRU", numerator := 7720167833357, qMin := 925969 },
  { anchor := mustParsePath "RRRRRRRURRRURRRU", numerator := 7727104574285, qMin := 926381 },
  { anchor := mustParsePath "RRRRRURRRRRRURRU", numerator := 7766850626645, qMin := 927545 },
  { anchor := mustParsePath "RRRRRRRURRURRRRU", numerator := 7767853945565, qMin := 927601 },
  { anchor := mustParsePath "RRRRRRRRURRURRRU", numerator := 7774878992405, qMin := 928019 },
  { anchor := mustParsePath "RRRRRRRRRURRURRU", numerator := 7823136278165, qMin := 930889 },
  { anchor := mustParsePath "RRRRRRURRRRRRURU", numerator := 8097570258125, qMin := 938755 },
  { anchor := mustParsePath "RRRRRURRRRRRRURU", numerator := 8097706848605, qMin := 938759 },
  { anchor := mustParsePath "RRRRRRRRURURRRRU", numerator := 8098799613917, qMin := 938821 },
  { anchor := mustParsePath "RRRRRRRRRURURRRU", numerator := 8106314371277, qMin := 939251 },
  { anchor := mustParsePath "RRRRRRRRRRURURRU", numerator := 8157918426845, qMin := 942199 },
  { anchor := mustParsePath "RRRRRRRRRRRURURU", numerator := 8516025477725, qMin := 962405 },
  { anchor := mustParsePath "RRRRRRURRRRRRRUU", numerator := 10551108573005, qMin := 1015645 },
  { anchor := mustParsePath "RRRRRURRRRRRRRUU", numerator := 10551342448085, qMin := 1015655 },
  { anchor := mustParsePath "RRRRRRRRRUURRRRU", numerator := 10552979646221, qMin := 1015729 },
  { anchor := mustParsePath "RRRRRRRRRRUURRRU", numerator := 10564209569165, qMin := 1016237 },
  { anchor := mustParsePath "RRRRRRRRRRRUURRU", numerator := 10641342079445, qMin := 1019719 },
  { anchor := mustParsePath "RRRRRRRRRRRRUURU", numerator := 11177567964365, qMin := 1043585 },
  { anchor := mustParsePath "RRRRRRRRRRRRRUUU", numerator := 15207683488205, qMin := 1207165 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_13_3
