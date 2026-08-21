import Lake
open Lake DSL

package "LatticePathOrders" where
  version := v!"0.1.0"
  leanOptions := #[
    ⟨`autoImplicit, false⟩,
    ⟨`pp.unicode.fun, true⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @
  "54e71fa9173471d591658f5380c46aaf050bbaae"

@[default_target]
lean_lib LatticePathOrders

/-- Source and classical mathematics reproved from Mathlib foundations. -/
lean_lib LatticePathOrdersClassical

/-- Project-local mathematics and the axiom-free publication root. -/
lean_lib LatticePathOrdersKernel
