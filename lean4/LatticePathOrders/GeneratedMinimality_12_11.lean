import LatticePathOrders.GeneratedMinimality_12_11_Frontier
import LatticePathOrders.GeneratedMinimality_12_11_Group000
import LatticePathOrders.GeneratedMinimality_12_11_Group001
import LatticePathOrders.GeneratedMinimality_12_11_Group002
import LatticePathOrders.GeneratedMinimality_12_11_Group003
import LatticePathOrders.GeneratedMinimality_12_11_Group004
import LatticePathOrders.GeneratedMinimality_12_11_Group005
import LatticePathOrders.GeneratedMinimality_12_11_Group006
import LatticePathOrders.GeneratedMinimality_12_11_Group007
import LatticePathOrders.GeneratedMinimality_12_11_Group008
import LatticePathOrders.GeneratedMinimality_12_11_Group009
import LatticePathOrders.GeneratedMinimality_12_11_Group010
import LatticePathOrders.GeneratedMinimality_12_11_Group011
import LatticePathOrders.GeneratedMinimality_12_11_Group012
import LatticePathOrders.GeneratedMinimality_12_11_Group013
import LatticePathOrders.GeneratedMinimality_12_11_Group014
import LatticePathOrders.GeneratedMinimality_12_11_Group015
import LatticePathOrders.GeneratedMinimality_12_11_Group016
import LatticePathOrders.GeneratedMinimality_12_11_Group017
import LatticePathOrders.GeneratedMinimality_12_11_Group018
import LatticePathOrders.GeneratedMinimality_12_11_Group019
import LatticePathOrders.GeneratedMinimality_12_11_Group020
import LatticePathOrders.GeneratedMinimality_12_11_Group021
import LatticePathOrders.GeneratedMinimality_12_11_Group022

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_11

def regions : List (Path × Nat × AssignmentTree) :=
  regionsGroup000 ++ (regionsGroup001 ++ (regionsGroup002 ++ (regionsGroup003 ++ (regionsGroup004 ++ (regionsGroup005 ++ (regionsGroup006 ++ (regionsGroup007 ++ (regionsGroup008 ++ (regionsGroup009 ++ (regionsGroup010 ++ (regionsGroup011 ++ (regionsGroup012 ++ (regionsGroup013 ++ (regionsGroup014 ++ (regionsGroup015 ++ (regionsGroup016 ++ (regionsGroup017 ++ (regionsGroup018 ++ (regionsGroup019 ++ (regionsGroup020 ++ (regionsGroup021 ++ (regionsGroup022))))))))))))))))))))))

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsGroup001 regionsGroup002 regionsGroup003 regionsGroup004 regionsGroup005 regionsGroup006 regionsGroup007 regionsGroup008 regionsGroup009 regionsGroup010 regionsGroup011 regionsGroup012 regionsGroup013 regionsGroup014 regionsGroup015 regionsGroup016 regionsGroup017 regionsGroup018 regionsGroup019 regionsGroup020 regionsGroup021 regionsGroup022 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015 regionsPart016 regionsPart017 regionsPart018 regionsPart019 regionsPart020 regionsPart021 regionsPart022 regionsPart023 regionsPart024 regionsPart025 regionsPart026 regionsPart027 regionsPart028 regionsPart029 regionsPart030 regionsPart031 regionsPart032 regionsPart033 regionsPart034 regionsPart035 regionsPart036 regionsPart037 regionsPart038 regionsPart039 regionsPart040 regionsPart041 regionsPart042 regionsPart043 regionsPart044 regionsPart045 regionsPart046 regionsPart047 regionsPart048 regionsPart049 regionsPart050 regionsPart051 regionsPart052 regionsPart053 regionsPart054 regionsPart055 regionsPart056 regionsPart057 regionsPart058 regionsPart059 regionsPart060 regionsPart061 regionsPart062 regionsPart063 regionsPart064 regionsPart065 regionsPart066 regionsPart067 regionsPart068 regionsPart069 regionsPart070 regionsPart071 regionsPart072 regionsPart073 regionsPart074 regionsPart075 regionsPart076 regionsPart077 regionsPart078 regionsPart079 regionsPart080 regionsPart081 regionsPart082 regionsPart083 regionsPart084 regionsPart085 regionsPart086 regionsPart087 regionsPart088 regionsPart089 regionsPart090 regionsPart091 regionsPart092 regionsPart093 regionsPart094 regionsPart095 regionsPart096 regionsPart097 regionsPart098 regionsPart099 regionsPart100 regionsPart101 regionsPart102 regionsPart103 regionsPart104 regionsPart105 regionsPart106 regionsPart107 regionsPart108 regionsPart109 regionsPart110 regionsPart111 regionsPart112 regionsPart113 regionsPart114 regionsPart115 regionsPart116 regionsPart117 regionsPart118 regionsPart119 regionsPart120 regionsPart121 regionsPart122 regionsPart123 regionsPart124 regionsPart125 regionsPart126 regionsPart127 regionsPart128 regionsPart129 regionsPart130 regionsPart131 regionsPart132 regionsPart133 regionsPart134 regionsPart135 regionsPart136 regionsPart137 regionsPart138 regionsPart139 regionsPart140 regionsPart141 regionsPart142 regionsPart143 regionsPart144 regionsPart145 regionsPart146 regionsPart147 regionsPart148 regionsPart149 regionsPart150 regionsPart151 regionsPart152 regionsPart153 regionsPart154 regionsPart155 regionsPart156 regionsPart157 regionsPart158 regionsPart159 regionsPart160 regionsPart161 regionsPart162 regionsPart163 regionsPart164 regionsPart165 regionsPart166 regionsPart167 regionsPart168 regionsPart169 regionsPart170 regionsPart171 regionsPart172 regionsPart173 regionsPart174 regionsPart175 regionsPart176 regionsPart177 regionsPart178 regionsPart179 regionsPart180 regionsPart181 regionsPart182 regionsPart183 regionsPart184 regionsPart185 regionsPart186 regionsPart187 regionsPart188 regionsPart189 regionsPart190 regionsPart191 regionsPart192 regionsPart193 regionsPart194 regionsPart195 regionsPart196 regionsPart197 regionsPart198 regionsPart199 regionsPart200 regionsPart201 regionsPart202 regionsPart203 regionsPart204 regionsPart205 regionsPart206 regionsPart207 regionsPart208 regionsPart209 regionsPart210 regionsPart211 regionsPart212 regionsPart213 regionsPart214 regionsPart215 regionsPart216 regionsPart217 regionsPart218 regionsPart219 regionsPart220 regionsPart221 regionsPart222 regionsPart223 regionsPart224 regionsPart225 regionsPart226 regionsPart227 regionsPart228 regionsPart229 regionsPart230 regionsPart231 regionsPart232 regionsPart233 regionsPart234 regionsPart235 regionsPart236 regionsPart237 regionsPart238 regionsPart239 regionsPart240 regionsPart241 regionsPart242 regionsPart243 regionsPart244 regionsPart245 regionsPart246 regionsPart247 regionsPart248 regionsPart249 regionsPart250 regionsPart251 regionsPart252 regionsPart253 regionsPart254 regionsPart255 regionsPart256 regionsPart257 regionsPart258 regionsPart259 regionsPart260 regionsPart261 regionsPart262 regionsPart263 regionsPart264 regionsPart265 regionsPart266 regionsPart267 regionsPart268 regionsPart269 regionsPart270 regionsPart271 regionsPart272 regionsPart273 regionsPart274 regionsPart275 regionsPart276 regionsPart277 regionsPart278 regionsPart279 regionsPart280 regionsPart281 regionsPart282 regionsPart283 regionsPart284 regionsPart285 regionsPart286 regionsPart287 regionsPart288 regionsPart289 regionsPart290 regionsPart291 regionsPart292 regionsPart293 regionsPart294 regionsPart295 regionsPart296 regionsPart297 regionsPart298 regionsPart299 regionsPart300 regionsPart301 regionsPart302 regionsPart303 regionsPart304 regionsPart305 regionsPart306 regionsPart307 regionsPart308 regionsPart309 regionsPart310 regionsPart311 regionsPart312 regionsPart313 regionsPart314 regionsPart315 regionsPart316 regionsPart317 regionsPart318 regionsPart319 regionsPart320 regionsPart321 regionsPart322 regionsPart323 regionsPart324 regionsPart325 regionsPart326 regionsPart327 regionsPart328 regionsPart329 regionsPart330 regionsPart331 regionsPart332 regionsPart333 regionsPart334 regionsPart335 regionsPart336 regionsPart337 regionsPart338 regionsPart339 regionsPart340 regionsPart341 regionsPart342 regionsPart343 regionsPart344 regionsPart345 regionsPart346 regionsPart347 regionsPart348 regionsPart349 regionsPart350 regionsPart351 regionsPart352 regionsPart353 regionsPart354 regionsPart355 regionsPart356 regionsPart357
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 23 ∧
      region.2.2.check 12 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regions, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
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
  · exact regionsGroup014_valid region h
  · exact regionsGroup015_valid region h
  · exact regionsGroup016_valid region h
  · exact regionsGroup017_valid region h
  · exact regionsGroup018_valid region h
  · exact regionsGroup019_valid region h
  · exact regionsGroup020_valid region h
  · exact regionsGroup021_valid region h
  · exact regionsGroup022_valid region h

theorem regions_cover : TreeRegionsCover 12 11 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_12_11 : Problem63HoldsAt 12 11 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 1431 regions. -/
theorem region_count : regions.length = 1431 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_12_11
