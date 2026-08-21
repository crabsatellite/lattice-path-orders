import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_3

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRURRRRRURRRRRU", numerator := 2482980166499117, qMin := 16609837 },
  { anchor := mustParsePath "RRRRRRURRRRRRURRRRU", numerator := 2483258820942245, qMin := 16610303 },
  { anchor := mustParsePath "RRRRRRRURRRRURRRRRU", numerator := 2483299484271221, qMin := 16610371 },
  { anchor := mustParsePath "RRRRRRRRURRRRURRRRU", numerator := 2483624802888437, qMin := 16611449 },
  { anchor := mustParsePath "RRRRRRURRRRRRRURRRU", numerator := 2485488619355621, qMin := 16614497 },
  { anchor := mustParsePath "RRRRRRRRURRRURRRRRU", numerator := 2485535283550445, qMin := 16614643 },
  { anchor := mustParsePath "RRRRRRRRRURRRURRRRU", numerator := 2485861945179557, qMin := 16615733 },
  { anchor := mustParsePath "RRRRRRRRRRURRRURRRU", numerator := 2488102488859685, qMin := 16623217 },
  { anchor := mustParsePath "RRRRRRRURRRRRRRURRU", numerator := 2500839570476021, qMin := 16643845 },
  { anchor := mustParsePath "RRRRRRURRRRRRRRURRU", numerator := 2500845571487021, qMin := 16643855 },
  { anchor := mustParsePath "RRRRRRRRRURRURRRRRU", numerator := 2500893579834221, qMin := 16644013 },
  { anchor := mustParsePath "RRRRRRRRRRURRURRRRU", numerator := 2501223649695221, qMin := 16645109 },
  { anchor := mustParsePath "RRRRRRRRRRRURRURRRU", numerator := 2503486714871021, qMin := 16652623 },
  { anchor := mustParsePath "RRRRRRRRRRRRURRURRU", numerator := 2519025560111021, qMin := 16704125 },
  { anchor := mustParsePath "RRRRRRRURRRRRRRRURU", numerator := 2607376353125621, qMin := 16845145 },
  { anchor := mustParsePath "RRRRRRURRRRRRRRRURU", numerator := 2607383706127205, qMin := 16845167 },
  { anchor := mustParsePath "RRRRRRRRRRURURRRRRU", numerator := 2607435177428597, qMin := 16845331 },
  { anchor := mustParsePath "RRRRRRRRRRRURURRRRU", numerator := 2607788137181045, qMin := 16846457 },
  { anchor := mustParsePath "RRRRRRRRRRRRURURRRU", numerator := 2610208025138021, qMin := 16854175 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURURRU", numerator := 2626824394028021, qMin := 16907075 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURURU", numerator := 2742133755659765, qMin := 17269657 },
  { anchor := mustParsePath "RRRRRRRRURRRRRRRRUU", numerator := 3397409691013805, qMin := 18224963 },
  { anchor := mustParsePath "RRRRRRRURRRRRRRRRUU", numerator := 3397411089909221, qMin := 18224965 },
  { anchor := mustParsePath "RRRRRRURRRRRRRRRRUU", numerator := 3397422281082917, qMin := 18224993 },
  { anchor := mustParsePath "RRRRRRRRRRRUURRRRRU", numerator := 3397499220901037, qMin := 18225187 },
  { anchor := mustParsePath "RRRRRRRRRRRRUURRRRU", numerator := 3398026631834021, qMin := 18226517 },
  { anchor := mustParsePath "RRRRRRRRRRRRRUURRRU", numerator := 3401642666901605, qMin := 18235633 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRUURRU", numerator := 3426479100738221, qMin := 18298115 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRUURU", numerator := 3599142171108197, qMin := 18726373 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRUUU", numerator := 4896826853883557, qMin := 21661697 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_16_3
