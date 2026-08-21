import LatticePathOrders.MinimalityClassTable

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_2

/-- Bounded class chunk 0; derived from receipt SHA-256
`fac6462f9596f8e8d168b543e36f6604b20194b6633ecb14857c2d59918f11d4`.  Leaf checks recompute every value. -/
def classChunk000 : ClassTable := .leaf #[
  { anchor := mustParsePath "RRRRRRRRRRURRRRRRRRRU", numerator := 169650926305994957, qMin := 137295677 },
  { anchor := mustParsePath "RRRRRRRRRRRURRRRRRRRU", numerator := 169650936191283845, qMin := 137295679 },
  { anchor := mustParsePath "RRRRRRRRRRRRURRRRRRRU", numerator := 169651005388314125, qMin := 137295695 },
  { anchor := mustParsePath "RRRRRRRRRRRRRURRRRRRU", numerator := 169651479882616205, qMin := 137295805 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRURRRRRU", numerator := 169654732163505797, qMin := 137296559 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRURRRRU", numerator := 169677024471901517, qMin := 137301727 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRURRRU", numerator := 169829857646097485, qMin := 137337149 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRURRU", numerator := 170879243647432325, qMin := 137579935 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRURU", numerator := 178158839433127565, qMin := 139244015 },
  { anchor := mustParsePath "RRRRRRRRRRRRRRRRRRRUU", numerator := 232140944517025037, qMin := 150649789 }
]

theorem classChunk000_valid : ClassTableValid classChunk000 := by
  decide

end LatticePathOrders.GeneratedMinimality_19_2
