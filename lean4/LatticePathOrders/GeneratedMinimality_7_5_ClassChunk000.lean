import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_5

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURURRURURU", numerator := 1945074605, qMin := 14701 },
  { anchor := mustParsePath "RRURRURURURU", numerator := 1947192125, qMin := 14705 },
  { anchor := mustParsePath "RRRURURURURU", numerator := 2019873245, qMin := 14845 },
  { anchor := mustParsePath "RRURRRURUURU", numerator := 2558639885, qMin := 16681 },
  { anchor := mustParsePath "RRRRURUURURU", numerator := 2669065565, qMin := 17015 },
  { anchor := mustParsePath "RRRRRURUUURU", numerator := 3665454845, qMin := 19931 },
  { anchor := mustParsePath "RRURURRURRUU", numerator := 2432758325, qMin := 15571 },
  { anchor := mustParsePath "RRURURRRURUU", numerator := 2539252877, qMin := 15889 },
  { anchor := mustParsePath "RRURRURRUURU", numerator := 2450547005, qMin := 15605 },
  { anchor := mustParsePath "RRURRRURURUU", numerator := 2542882325, qMin := 15895 },
  { anchor := mustParsePath "RRRUURRURRUU", numerator := 3150240125, qMin := 17575 },
  { anchor := mustParsePath "RRRUURRURURU", numerator := 2521144517, qMin := 15719 },
  { anchor := mustParsePath "RRURRRUURRUU", numerator := 3154282565, qMin := 17581 },
  { anchor := mustParsePath "RRRUURRRUURU", numerator := 3285009221, qMin := 17921 },
  { anchor := mustParsePath "RRRRUURRUURU", numerator := 3309815957, qMin := 17987 },
  { anchor := mustParsePath "RRURURRRUURU", numerator := 2536834685, qMin := 15745 },
  { anchor := mustParsePath "RRURRRUURURU", numerator := 2540462405, qMin := 15755 },
  { anchor := mustParsePath "RRURRRURRUUU", numerator := 3318105605, qMin := 18005 },
  { anchor := mustParsePath "RRRURRRUURUU", numerator := 3318105605, qMin := 18001 },
  { anchor := mustParsePath "RRURRRRURUUU", numerator := 3486075845, qMin := 18451 },
  { anchor := mustParsePath "RRRRUURURRUU", numerator := 3305675021, qMin := 17951 },
  { anchor := mustParsePath "RRRRUURURURU", numerator := 2649263837, qMin := 16069 },
  { anchor := mustParsePath "RRRRRUURURUU", numerator := 3477578837, qMin := 18407 },
  { anchor := mustParsePath "RRURRRRUURUU", numerator := 3338875085, qMin := 18035 },
  { anchor := mustParsePath "RRRRRUURUURU", numerator := 3507363725, qMin := 18481 },
  { anchor := mustParsePath "RRRURURRRUUU", numerator := 3429624965, qMin := 18155 },
  { anchor := mustParsePath "RRURRURRRUUU", numerator := 3313959485, qMin := 17845 },
  { anchor := mustParsePath "RRRURRRUUURU", numerator := 3463440197, qMin := 18239 },
  { anchor := mustParsePath "RRRUURRRRUUU", numerator := 4464778757, qMin := 20689 },
  { anchor := mustParsePath "RRURURRRRUUU", numerator := 3452150021, qMin := 18191 },
  { anchor := mustParsePath "RRRRRUUURRUU", numerator := 4503349445, qMin := 20773 },
  { anchor := mustParsePath "RRURRRRUUURU", numerator := 3481826045, qMin := 18265 },
  { anchor := mustParsePath "RRRRRUUURURU", numerator := 3635004677, qMin := 18659 },
  { anchor := mustParsePath "RRRRRRUUURUU", numerator := 4777989125, qMin := 21391 },
  { anchor := mustParsePath "RRRURRRRUUUU", numerator := 4738257221, qMin := 21281 },
  { anchor := mustParsePath "RRURRRRRUUUU", numerator := 4773013565, qMin := 21355 },
  { anchor := mustParsePath "RRRRRRUUUURU", numerator := 5019864197, qMin := 21899 },
  { anchor := mustParsePath "RRRRRRRUUUUU", numerator := 6880204805, qMin := 25633 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_7_5
