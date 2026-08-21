import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_8_5

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURRURURRURU", numerator := 12768548000, qMin := 37666 },
  { anchor := mustParsePath "RRURRURRURURU", numerator := 12782111360, qMin := 37676 },
  { anchor := mustParsePath "RRRURURURRURU", numerator := 13244787392, qMin := 38014 },
  { anchor := mustParsePath "RRURRRURURURU", numerator := 13261364960, qMin := 38036 },
  { anchor := mustParsePath "RRRRURURURURU", numerator := 13831171232, qMin := 38794 },
  { anchor := mustParsePath "RRRURRRURUURU", numerator := 17425584032, qMin := 43532 },
  { anchor := mustParsePath "RRURRRRURUURU", numerator := 17520757952, qMin := 43594 },
  { anchor := mustParsePath "RRRRRURUURURU", numerator := 18291480512, qMin := 44534 },
  { anchor := mustParsePath "RRRRRRURUUURU", numerator := 25122884000, qMin := 52178 },
  { anchor := mustParsePath "RRURRURRURRUU", numerator := 15986567840, qMin := 39916 },
  { anchor := mustParsePath "RRURRRURURRUU", numerator := 16568323520, qMin := 40634 },
  { anchor := mustParsePath "RRRRURUURRURU", numerator := 17387587040, qMin := 41578 },
  { anchor := mustParsePath "RRURRURRRURUU", numerator := 16689022592, qMin := 40724 },
  { anchor := mustParsePath "RRURRRURRUURU", numerator := 16692123200, qMin := 40726 },
  { anchor := mustParsePath "RRURRRRURURUU", numerator := 17412913760, qMin := 41594 },
  { anchor := mustParsePath "RRRURURURRRUU", numerator := 17151045440, qMin := 41008 },
  { anchor := mustParsePath "RRURRRUURRRUU", numerator := 21434716832, qMin := 45842 },
  { anchor := mustParsePath "RRURRURURRRUU", numerator := 16549793312, qMin := 40274 },
  { anchor := mustParsePath "RRURRRUURRURU", numerator := 16552880960, qMin := 40276 },
  { anchor := mustParsePath "RRRURRRUURRUU", numerator := 21462836000, qMin := 45860 },
  { anchor := mustParsePath "RRRRUURRRUURU", numerator := 22491000896, qMin := 46892 },
  { anchor := mustParsePath "RRRRUURRURRUU", numerator := 21564922496, qMin := 45916 },
  { anchor := mustParsePath "RRRRUURRURURU", numerator := 17261229920, qMin := 41078 },
  { anchor := mustParsePath "RRURRRRUURRUU", numerator := 21596653760, qMin := 45946 },
  { anchor := mustParsePath "RRRURURRRUURU", numerator := 17273844896, qMin := 41086 },
  { anchor := mustParsePath "RRURRURRRUURU", numerator := 16673523872, qMin := 40364 },
  { anchor := mustParsePath "RRRRRUURRUURU", numerator := 22682167232, qMin := 47078 },
  { anchor := mustParsePath "RRRURRRUURURU", numerator := 17302245440, qMin := 41116 },
  { anchor := mustParsePath "RRURRRRURRUUU", numerator := 22721944640, qMin := 47116 },
  { anchor := mustParsePath "RRURRRRRURUUU", numerator := 23890648352, qMin := 48302 },
  { anchor := mustParsePath "RRRRUURURRRUU", numerator := 22487401760, qMin := 46820 },
  { anchor := mustParsePath "RRRRUURURRURU", numerator := 17368604096, qMin := 41146 },
  { anchor := mustParsePath "RRURRRRUURURU", numerator := 17393916992, qMin := 41174 },
  { anchor := mustParsePath "RRRRRUURURRUU", numerator := 22653260096, qMin := 46982 },
  { anchor := mustParsePath "RRRRRUURURURU", numerator := 18155406560, qMin := 42058 },
  { anchor := mustParsePath "RRRRRRUURURUU", numerator := 23835036992, qMin := 48188 },
  { anchor := mustParsePath "RRRURRRRUURUU", numerator := 22718327072, qMin := 47044 },
  { anchor := mustParsePath "RRURRRRRUURUU", numerator := 22881402752, qMin := 47204 },
  { anchor := mustParsePath "RRRRRRUURUURU", numerator := 24039262112, qMin := 48382 },
  { anchor := mustParsePath "RRRURRURRRUUU", numerator := 22545022496, qMin := 46546 },
  { anchor := mustParsePath "RRURRRURRRUUU", numerator := 22573860512, qMin := 46574 },
  { anchor := mustParsePath "RRRURRRRURUUU", numerator := 23716616000, qMin := 47728 },
  { anchor := mustParsePath "RRRRUURRRRUUU", numerator := 30562731680, qMin := 54130 },
  { anchor := mustParsePath "RRRURURRRRUUU", numerator := 23480658752, qMin := 47444 },
  { anchor := mustParsePath "RRURRURRRRUUU", numerator := 22689396896, qMin := 46636 },
  { anchor := mustParsePath "RRRRRUUURRRUU", numerator := 30596306720, qMin := 54148 },
  { anchor := mustParsePath "RRRRRUUURRURU", numerator := 23657516096, qMin := 47612 },
  { anchor := mustParsePath "RRRRRRUUURRUU", numerator := 30865570592, qMin := 54382 },
  { anchor := mustParsePath "RRRURRRRUUURU", numerator := 23712920096, qMin := 47666 },
  { anchor := mustParsePath "RRURRRRRUUURU", numerator := 23860980896, qMin := 47806 },
  { anchor := mustParsePath "RRRRRRUUURURU", numerator := 24914096960, qMin := 48848 },
  { anchor := mustParsePath "RRRRRRRUUURUU", numerator := 32748693152, qMin := 56002 },
  { anchor := mustParsePath "RRRRURRRRUUUU", numerator := 32441052992, qMin := 55684 },
  { anchor := mustParsePath "RRRURRRRRUUUU", numerator := 32471319200, qMin := 55700 },
  { anchor := mustParsePath "RRURRRRRRUUUU", numerator := 32713956896, qMin := 55906 },
  { anchor := mustParsePath "RRRRRRRUUUURU", numerator := 34406540096, qMin := 57332 },
  { anchor := mustParsePath "RRRRRRRRUUUUU", numerator := 47157596960, qMin := 67108 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_8_5
