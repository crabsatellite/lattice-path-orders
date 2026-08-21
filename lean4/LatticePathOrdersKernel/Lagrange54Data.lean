import LatticePathOrders.LagrangeBounds
import LatticePathOrders.PartitionCertificate

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- SHA-256 `0545649ffe02318f2b36d2305c62b8d7a893810e8db2dd99358e543c556ac3a2` of `data/lagrange-cover-certificate-5-4.json`. -/
def lagrange54JsonCertificate : List (PrefixBound Rat) := [
  { pathPrefix := mustParsePath "RRURURURU", lower := ((8732021 : Rat) / (970225 : Rat)), upper := ((8732021 : Rat) / (970225 : Rat)) },
  { pathPrefix := mustParsePath "RRURURRUU", lower := ((10909805 : Rat) / (1087849 : Rat)), upper := ((10909805 : Rat) / (1087849 : Rat)) },
  { pathPrefix := mustParsePath "RRURRUURU", lower := ((10989221 : Rat) / (1092025 : Rat)), upper := ((10989221 : Rat) / (1092025 : Rat)) },
  { pathPrefix := mustParsePath "RRURRURUU", lower := ((10989221 : Rat) / (1092025 : Rat)), upper := ((10989221 : Rat) / (1092025 : Rat)) },
  { pathPrefix := mustParsePath "RRURRRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)), upper := ((14861021 : Rat) / (1428025 : Rat)) },
  { pathPrefix := mustParsePath "RRRUURURU", lower := ((11390621 : Rat) / (1113025 : Rat)), upper := ((11390621 : Rat) / (1113025 : Rat)) },
  { pathPrefix := mustParsePath "RRRUURRUU", lower := ((14130077 : Rat) / (1385329 : Rat)), upper := ((14130077 : Rat) / (1385329 : Rat)) },
  { pathPrefix := mustParsePath "RRRURUURU", lower := ((11471765 : Rat) / (1247689 : Rat)), upper := ((11471765 : Rat) / (1247689 : Rat)) },
  { pathPrefix := mustParsePath "RRRURURUU", lower := ((11390621 : Rat) / (1113025 : Rat)), upper := ((11390621 : Rat) / (1113025 : Rat)) },
  { pathPrefix := mustParsePath "RRRURRUUU", lower := ((14861021 : Rat) / (1428025 : Rat)), upper := ((14861021 : Rat) / (1428025 : Rat)) },
  { pathPrefix := mustParsePath "RRRRUUURU", lower := ((15610397 : Rat) / (1495729 : Rat)), upper := ((15610397 : Rat) / (1495729 : Rat)) },
  { pathPrefix := mustParsePath "RRRRUURUU", lower := ((14953685 : Rat) / (1456849 : Rat)), upper := ((14953685 : Rat) / (1456849 : Rat)) },
  { pathPrefix := mustParsePath "RRRRURUUU", lower := ((15610397 : Rat) / (1495729 : Rat)), upper := ((15610397 : Rat) / (1495729 : Rat)) },
  { pathPrefix := mustParsePath "RRRRRUUUU", lower := ((21372125 : Rat) / (2042041 : Rat)), upper := ((21372125 : Rat) / (2042041 : Rat)) }
]

def lagrange54Frontier : List Path :=
  lagrange54JsonCertificate.map PrefixBound.pathPrefix

def lagrange54Lower : Path := mustParsePath "RRRRUURUU"
def lagrange54Upper : Path := mustParsePath "RRURRRUUU"

def lagrange54Leaves : List Path := [
  mustParsePath "RRRRRUUUU",
  mustParsePath "RRRRURUUU",
  mustParsePath "RRRRUURUU",
  mustParsePath "RRRRUUURU",
  mustParsePath "RRRURRUUU",
  mustParsePath "RRRURURUU",
  mustParsePath "RRRURUURU",
  mustParsePath "RRRUURRUU",
  mustParsePath "RRRUURURU",
  mustParsePath "RRURRRUUU",
  mustParsePath "RRURRURUU",
  mustParsePath "RRURRUURU",
  mustParsePath "RRURURRUU",
  mustParsePath "RRURURURU"
]

end LatticePathOrdersKernel

