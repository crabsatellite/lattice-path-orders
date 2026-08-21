import LatticePathOrders.GeneratedMinimality_14_9_Frontier
import LatticePathOrders.GeneratedMinimality_14_9_Group000
import LatticePathOrders.GeneratedMinimality_14_9_Group001
import LatticePathOrders.GeneratedMinimality_14_9_Group002
import LatticePathOrders.GeneratedMinimality_14_9_Group003
import LatticePathOrders.GeneratedMinimality_14_9_Group004
import LatticePathOrders.GeneratedMinimality_14_9_Group005
import LatticePathOrders.GeneratedMinimality_14_9_Group006
import LatticePathOrders.GeneratedMinimality_14_9_Group007
import LatticePathOrders.GeneratedMinimality_14_9_Group008
import LatticePathOrders.GeneratedMinimality_14_9_Group009
import LatticePathOrders.GeneratedMinimality_14_9_Group010
import LatticePathOrders.GeneratedMinimality_14_9_Group011
import LatticePathOrders.GeneratedMinimality_14_9_Group012
import LatticePathOrders.GeneratedMinimality_14_9_Group013

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_9

def regions : List (Path × Nat × AssignmentTree) :=
  regionsGroup000 ++ (regionsGroup001 ++ (regionsGroup002 ++ (regionsGroup003 ++ (regionsGroup004 ++ (regionsGroup005 ++ (regionsGroup006 ++ (regionsGroup007 ++ (regionsGroup008 ++ (regionsGroup009 ++ (regionsGroup010 ++ (regionsGroup011 ++ (regionsGroup012 ++ (regionsGroup013)))))))))))))

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsGroup001 regionsGroup002 regionsGroup003 regionsGroup004 regionsGroup005 regionsGroup006 regionsGroup007 regionsGroup008 regionsGroup009 regionsGroup010 regionsGroup011 regionsGroup012 regionsGroup013 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015 regionsPart016 regionsPart017 regionsPart018 regionsPart019 regionsPart020 regionsPart021 regionsPart022 regionsPart023 regionsPart024 regionsPart025 regionsPart026 regionsPart027 regionsPart028 regionsPart029 regionsPart030 regionsPart031 regionsPart032 regionsPart033 regionsPart034 regionsPart035 regionsPart036 regionsPart037 regionsPart038 regionsPart039 regionsPart040 regionsPart041 regionsPart042 regionsPart043 regionsPart044 regionsPart045 regionsPart046 regionsPart047 regionsPart048 regionsPart049 regionsPart050 regionsPart051 regionsPart052 regionsPart053 regionsPart054 regionsPart055 regionsPart056 regionsPart057 regionsPart058 regionsPart059 regionsPart060 regionsPart061 regionsPart062 regionsPart063 regionsPart064 regionsPart065 regionsPart066 regionsPart067 regionsPart068 regionsPart069 regionsPart070 regionsPart071 regionsPart072 regionsPart073 regionsPart074 regionsPart075 regionsPart076 regionsPart077 regionsPart078 regionsPart079 regionsPart080 regionsPart081 regionsPart082 regionsPart083 regionsPart084 regionsPart085 regionsPart086 regionsPart087 regionsPart088 regionsPart089 regionsPart090 regionsPart091 regionsPart092 regionsPart093 regionsPart094 regionsPart095 regionsPart096 regionsPart097 regionsPart098 regionsPart099 regionsPart100 regionsPart101 regionsPart102 regionsPart103 regionsPart104 regionsPart105 regionsPart106 regionsPart107 regionsPart108 regionsPart109 regionsPart110 regionsPart111 regionsPart112 regionsPart113 regionsPart114 regionsPart115 regionsPart116 regionsPart117 regionsPart118 regionsPart119 regionsPart120 regionsPart121 regionsPart122 regionsPart123 regionsPart124 regionsPart125 regionsPart126 regionsPart127 regionsPart128 regionsPart129 regionsPart130 regionsPart131 regionsPart132 regionsPart133 regionsPart134 regionsPart135 regionsPart136 regionsPart137 regionsPart138 regionsPart139 regionsPart140 regionsPart141 regionsPart142 regionsPart143 regionsPart144 regionsPart145 regionsPart146 regionsPart147 regionsPart148 regionsPart149 regionsPart150 regionsPart151 regionsPart152 regionsPart153 regionsPart154 regionsPart155 regionsPart156 regionsPart157 regionsPart158 regionsPart159 regionsPart160 regionsPart161 regionsPart162 regionsPart163 regionsPart164 regionsPart165 regionsPart166 regionsPart167 regionsPart168 regionsPart169 regionsPart170 regionsPart171 regionsPart172 regionsPart173 regionsPart174 regionsPart175 regionsPart176 regionsPart177 regionsPart178 regionsPart179 regionsPart180 regionsPart181 regionsPart182 regionsPart183 regionsPart184 regionsPart185 regionsPart186 regionsPart187 regionsPart188 regionsPart189 regionsPart190 regionsPart191 regionsPart192 regionsPart193 regionsPart194 regionsPart195 regionsPart196 regionsPart197 regionsPart198 regionsPart199 regionsPart200 regionsPart201 regionsPart202 regionsPart203 regionsPart204 regionsPart205 regionsPart206 regionsPart207 regionsPart208 regionsPart209 regionsPart210 regionsPart211 regionsPart212 regionsPart213 regionsPart214 regionsPart215 regionsPart216 regionsPart217 regionsPart218
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 14 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regions, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · exact regionsGroup000_valid region h
  · exact regionsGroup001_valid region h
  · exact regionsGroup002_valid region h
  · exact regionsGroup003_valid region h
  · exact regionsGroup004_valid region h
  · exact regionsGroup005_valid region h
  · exact regionsGroup006_valid region h
  · exact regionsGroup007_valid region h
  · exact regionsGroup008_valid region h
  · exact regionsGroup009_valid region h
  · exact regionsGroup010_valid region h
  · exact regionsGroup011_valid region h
  · exact regionsGroup012_valid region h
  · exact regionsGroup013_valid region h

theorem regions_cover : TreeRegionsCover 14 9 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_14_9 : Problem63HoldsAt 14 9 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 876 regions. -/
theorem region_count : regions.length = 876 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_14_9
