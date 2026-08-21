import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRURRRRRURRRRU", numerator := 52861260830621, qMin := 2423525 },
  { anchor := mustParsePath "RRRRRRURRRRURRRRU", numerator := 52867193786285, qMin := 2423593 },
  { anchor := mustParsePath "RRRRRURRRRRRURRRU", numerator := 52907860940837, qMin := 2424059 },
  { anchor := mustParsePath "RRRRRRRURRRURRRRU", numerator := 52914669417005, qMin := 2424205 },
  { anchor := mustParsePath "RRRRRRRRURRRURRRU", numerator := 52962341015525, qMin := 2425295 },
  { anchor := mustParsePath "RRRRRRURRRRRRURRU", numerator := 53233761045605, qMin := 2428321 },
  { anchor := mustParsePath "RRRRRURRRRRRRURRU", numerator := 53234636586845, qMin := 2428331 },
  { anchor := mustParsePath "RRRRRRRRURRURRRRU", numerator := 53241641175965, qMin := 2428489 },
  { anchor := mustParsePath "RRRRRRRRRURRURRRU", numerator := 53289810200165, qMin := 2429585 },
  { anchor := mustParsePath "RRRRRRRRRRURRURRU", numerator := 53620573276445, qMin := 2437099 },
  { anchor := mustParsePath "RRRRRRURRRRRRRURU", numerator := 55501412305325, qMin := 2457679 },
  { anchor := mustParsePath "RRRRRURRRRRRRRURU", numerator := 55502485099997, qMin := 2457701 },
  { anchor := mustParsePath "RRRRRRRRRURURRRRU", numerator := 55509994953005, qMin := 2457865 },
  { anchor := mustParsePath "RRRRRRRRRRURURRRU", numerator := 55561504773677, qMin := 2458991 },
  { anchor := mustParsePath "RRRRRRRRRRRURURRU", numerator := 55915204656605, qMin := 2466709 },
  { anchor := mustParsePath "RRRRRRRRRRRRURURU", numerator := 58369706960045, qMin := 2519609 },
  { anchor := mustParsePath "RRRRRRRURRRRRRRUU", numerator := 72318135056045, qMin := 2658989 },
  { anchor := mustParsePath "RRRRRRURRRRRRRRUU", numerator := 72318339152357, qMin := 2658991 },
  { anchor := mustParsePath "RRRRRURRRRRRRRRUU", numerator := 72319971933221, qMin := 2659019 },
  { anchor := mustParsePath "RRRRRRRRRRUURRRRU", numerator := 72331197800621, qMin := 2659213 },
  { anchor := mustParsePath "RRRRRRRRRRRUURRRU", numerator := 72408169471397, qMin := 2660543 },
  { anchor := mustParsePath "RRRRRRRRRRRRUURRU", numerator := 72936843654245, qMin := 2669659 },
  { anchor := mustParsePath "RRRRRRRRRRRRRUURU", numerator := 76612190559917, qMin := 2732141 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRUUU", numerator := 104235013298021, qMin := 3160399 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_14_3
