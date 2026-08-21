import LatticePathOrders.MinimalityPartitionTree

namespace LatticePathOrders.GeneratedMinimality_13_11

theorem forall_mem_append {alpha : Type*} {predicate : alpha → Prop}
    {left right : List alpha}
    (hleft : ∀ item ∈ left, predicate item)
    (hright : ∀ item ∈ right, predicate item) :
    ∀ item ∈ left ++ right, predicate item := by
  intro item hitem
  rcases List.mem_append.mp hitem with h | h
  · exact hleft item h
  · exact hright item h

end LatticePathOrders.GeneratedMinimality_13_11
