import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_6_5

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRURURURURU", numerator := 296631725, qMin := 5741 },
  { anchor := mustParsePath "RRURRURUURU", numerator := 375700685, qMin := 6449 },
  { anchor := mustParsePath "RRRURUURURU", numerator := 389786045, qMin := 6511 },
  { anchor := mustParsePath "RRRRURUUURU", numerator := 534858125, qMin := 7615 },
  { anchor := mustParsePath "RRURURURRUU", numerator := 370600997, qMin := 6079 },
  { anchor := mustParsePath "RRURRUURRUU", numerator := 463583957, qMin := 6797 },
  { anchor := mustParsePath "RRURURRUURU", numerator := 372914717, qMin := 6089 },
  { anchor := mustParsePath "RRURRUURURU", numerator := 373378325, qMin := 6091 },
  { anchor := mustParsePath "RRRUURRUURU", numerator := 483428165, qMin := 6883 },
  { anchor := mustParsePath "RRRUURURRUU", numerator := 482900621, qMin := 6871 },
  { anchor := mustParsePath "RRRUURURURU", numerator := 386948237, qMin := 6149 },
  { anchor := mustParsePath "RRURRURRUUU", numerator := 487129037, qMin := 6899 },
  { anchor := mustParsePath "RRURRRUURUU", numerator := 487658885, qMin := 6901 },
  { anchor := mustParsePath "RRURRRURUUU", numerator := 509088965, qMin := 7051 },
  { anchor := mustParsePath "RRRRUURURUU", numerator := 507465725, qMin := 7033 },
  { anchor := mustParsePath "RRRRUURUURU", numerator := 511800125, qMin := 7061 },
  { anchor := mustParsePath "RRRUURRRUUU", numerator := 652240517, qMin := 7919 },
  { anchor := mustParsePath "RRURURRRUUU", numerator := 504227021, qMin := 6961 },
  { anchor := mustParsePath "RRURRRUUURU", numerator := 508547597, qMin := 6989 },
  { anchor := mustParsePath "RRRRUUURRUU", numerator := 657153221, qMin := 7937 },
  { anchor := mustParsePath "RRRRUUURURU", numerator := 530426957, qMin := 7129 },
  { anchor := mustParsePath "RRRURRRUUUU", numerator := 692058245, qMin := 8143 },
  { anchor := mustParsePath "RRRRRUUURUU", numerator := 697118405, qMin := 8171 },
  { anchor := mustParsePath "RRURRRRUUUU", numerator := 696484877, qMin := 8159 },
  { anchor := mustParsePath "RRRRRUUUURU", numerator := 732405965, qMin := 8365 },
  { anchor := mustParsePath "RRRRRRUUUUU", numerator := 1003812485, qMin := 9791 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_6_5
