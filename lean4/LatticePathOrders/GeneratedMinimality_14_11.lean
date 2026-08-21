import LatticePathOrders.GeneratedMinimality_14_11_Frontier
import LatticePathOrders.GeneratedMinimality_14_11_Group000
import LatticePathOrders.GeneratedMinimality_14_11_Group001
import LatticePathOrders.GeneratedMinimality_14_11_Group002
import LatticePathOrders.GeneratedMinimality_14_11_Group003
import LatticePathOrders.GeneratedMinimality_14_11_Group004
import LatticePathOrders.GeneratedMinimality_14_11_Group005
import LatticePathOrders.GeneratedMinimality_14_11_Group006
import LatticePathOrders.GeneratedMinimality_14_11_Group007
import LatticePathOrders.GeneratedMinimality_14_11_Group008
import LatticePathOrders.GeneratedMinimality_14_11_Group009
import LatticePathOrders.GeneratedMinimality_14_11_Group010
import LatticePathOrders.GeneratedMinimality_14_11_Group011
import LatticePathOrders.GeneratedMinimality_14_11_Group012
import LatticePathOrders.GeneratedMinimality_14_11_Group013
import LatticePathOrders.GeneratedMinimality_14_11_Group014
import LatticePathOrders.GeneratedMinimality_14_11_Group015
import LatticePathOrders.GeneratedMinimality_14_11_Group016
import LatticePathOrders.GeneratedMinimality_14_11_Group017
import LatticePathOrders.GeneratedMinimality_14_11_Group018
import LatticePathOrders.GeneratedMinimality_14_11_Group019
import LatticePathOrders.GeneratedMinimality_14_11_Group020
import LatticePathOrders.GeneratedMinimality_14_11_Group021
import LatticePathOrders.GeneratedMinimality_14_11_Group022
import LatticePathOrders.GeneratedMinimality_14_11_Group023
import LatticePathOrders.GeneratedMinimality_14_11_Group024
import LatticePathOrders.GeneratedMinimality_14_11_Group025
import LatticePathOrders.GeneratedMinimality_14_11_Group026
import LatticePathOrders.GeneratedMinimality_14_11_Group027
import LatticePathOrders.GeneratedMinimality_14_11_Group028
import LatticePathOrders.GeneratedMinimality_14_11_Group029
import LatticePathOrders.GeneratedMinimality_14_11_Group030
import LatticePathOrders.GeneratedMinimality_14_11_Group031
import LatticePathOrders.GeneratedMinimality_14_11_Group032
import LatticePathOrders.GeneratedMinimality_14_11_Group033
import LatticePathOrders.GeneratedMinimality_14_11_Group034
import LatticePathOrders.GeneratedMinimality_14_11_Group035
import LatticePathOrders.GeneratedMinimality_14_11_Group036
import LatticePathOrders.GeneratedMinimality_14_11_Group037
import LatticePathOrders.GeneratedMinimality_14_11_Group038
import LatticePathOrders.GeneratedMinimality_14_11_Group039
import LatticePathOrders.GeneratedMinimality_14_11_Group040
import LatticePathOrders.GeneratedMinimality_14_11_Group041
import LatticePathOrders.GeneratedMinimality_14_11_Group042
import LatticePathOrders.GeneratedMinimality_14_11_Group043
import LatticePathOrders.GeneratedMinimality_14_11_Group044
import LatticePathOrders.GeneratedMinimality_14_11_Group045
import LatticePathOrders.GeneratedMinimality_14_11_Group046
import LatticePathOrders.GeneratedMinimality_14_11_Group047
import LatticePathOrders.GeneratedMinimality_14_11_Group048
import LatticePathOrders.GeneratedMinimality_14_11_Group049
import LatticePathOrders.GeneratedMinimality_14_11_Group050
import LatticePathOrders.GeneratedMinimality_14_11_Group051
import LatticePathOrders.GeneratedMinimality_14_11_Group052
import LatticePathOrders.GeneratedMinimality_14_11_Group053
import LatticePathOrders.GeneratedMinimality_14_11_Group054
import LatticePathOrders.GeneratedMinimality_14_11_Group055
import LatticePathOrders.GeneratedMinimality_14_11_Group056
import LatticePathOrders.GeneratedMinimality_14_11_Group057
import LatticePathOrders.GeneratedMinimality_14_11_Group058
import LatticePathOrders.GeneratedMinimality_14_11_Group059
import LatticePathOrders.GeneratedMinimality_14_11_Group060
import LatticePathOrders.GeneratedMinimality_14_11_Group061
import LatticePathOrders.GeneratedMinimality_14_11_Group062
import LatticePathOrders.GeneratedMinimality_14_11_Group063

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def regions : List (Path × Nat × AssignmentTree) :=
  regionsGroup000 ++ (regionsGroup001 ++ (regionsGroup002 ++ (regionsGroup003 ++ (regionsGroup004 ++ (regionsGroup005 ++ (regionsGroup006 ++ (regionsGroup007 ++ (regionsGroup008 ++ (regionsGroup009 ++ (regionsGroup010 ++ (regionsGroup011 ++ (regionsGroup012 ++ (regionsGroup013 ++ (regionsGroup014 ++ (regionsGroup015 ++ (regionsGroup016 ++ (regionsGroup017 ++ (regionsGroup018 ++ (regionsGroup019 ++ (regionsGroup020 ++ (regionsGroup021 ++ (regionsGroup022 ++ (regionsGroup023 ++ (regionsGroup024 ++ (regionsGroup025 ++ (regionsGroup026 ++ (regionsGroup027 ++ (regionsGroup028 ++ (regionsGroup029 ++ (regionsGroup030 ++ (regionsGroup031 ++ (regionsGroup032 ++ (regionsGroup033 ++ (regionsGroup034 ++ (regionsGroup035 ++ (regionsGroup036 ++ (regionsGroup037 ++ (regionsGroup038 ++ (regionsGroup039 ++ (regionsGroup040 ++ (regionsGroup041 ++ (regionsGroup042 ++ (regionsGroup043 ++ (regionsGroup044 ++ (regionsGroup045 ++ (regionsGroup046 ++ (regionsGroup047 ++ (regionsGroup048 ++ (regionsGroup049 ++ (regionsGroup050 ++ (regionsGroup051 ++ (regionsGroup052 ++ (regionsGroup053 ++ (regionsGroup054 ++ (regionsGroup055 ++ (regionsGroup056 ++ (regionsGroup057 ++ (regionsGroup058 ++ (regionsGroup059 ++ (regionsGroup060 ++ (regionsGroup061 ++ (regionsGroup062 ++ (regionsGroup063)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsGroup001 regionsGroup002 regionsGroup003 regionsGroup004 regionsGroup005 regionsGroup006 regionsGroup007 regionsGroup008 regionsGroup009 regionsGroup010 regionsGroup011 regionsGroup012 regionsGroup013 regionsGroup014 regionsGroup015 regionsGroup016 regionsGroup017 regionsGroup018 regionsGroup019 regionsGroup020 regionsGroup021 regionsGroup022 regionsGroup023 regionsGroup024 regionsGroup025 regionsGroup026 regionsGroup027 regionsGroup028 regionsGroup029 regionsGroup030 regionsGroup031 regionsGroup032 regionsGroup033 regionsGroup034 regionsGroup035 regionsGroup036 regionsGroup037 regionsGroup038 regionsGroup039 regionsGroup040 regionsGroup041 regionsGroup042 regionsGroup043 regionsGroup044 regionsGroup045 regionsGroup046 regionsGroup047 regionsGroup048 regionsGroup049 regionsGroup050 regionsGroup051 regionsGroup052 regionsGroup053 regionsGroup054 regionsGroup055 regionsGroup056 regionsGroup057 regionsGroup058 regionsGroup059 regionsGroup060 regionsGroup061 regionsGroup062 regionsGroup063 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015 regionsPart016 regionsPart017 regionsPart018 regionsPart019 regionsPart020 regionsPart021 regionsPart022 regionsPart023 regionsPart024 regionsPart025 regionsPart026 regionsPart027 regionsPart028 regionsPart029 regionsPart030 regionsPart031 regionsPart032 regionsPart033 regionsPart034 regionsPart035 regionsPart036 regionsPart037 regionsPart038 regionsPart039 regionsPart040 regionsPart041 regionsPart042 regionsPart043 regionsPart044 regionsPart045 regionsPart046 regionsPart047 regionsPart048 regionsPart049 regionsPart050 regionsPart051 regionsPart052 regionsPart053 regionsPart054 regionsPart055 regionsPart056 regionsPart057 regionsPart058 regionsPart059 regionsPart060 regionsPart061 regionsPart062 regionsPart063 regionsPart064 regionsPart065 regionsPart066 regionsPart067 regionsPart068 regionsPart069 regionsPart070 regionsPart071 regionsPart072 regionsPart073 regionsPart074 regionsPart075 regionsPart076 regionsPart077 regionsPart078 regionsPart079 regionsPart080 regionsPart081 regionsPart082 regionsPart083 regionsPart084 regionsPart085 regionsPart086 regionsPart087 regionsPart088 regionsPart089 regionsPart090 regionsPart091 regionsPart092 regionsPart093 regionsPart094 regionsPart095 regionsPart096 regionsPart097 regionsPart098 regionsPart099 regionsPart100 regionsPart101 regionsPart102 regionsPart103 regionsPart104 regionsPart105 regionsPart106 regionsPart107 regionsPart108 regionsPart109 regionsPart110 regionsPart111 regionsPart112 regionsPart113 regionsPart114 regionsPart115 regionsPart116 regionsPart117 regionsPart118 regionsPart119 regionsPart120 regionsPart121 regionsPart122 regionsPart123 regionsPart124 regionsPart125 regionsPart126 regionsPart127 regionsPart128 regionsPart129 regionsPart130 regionsPart131 regionsPart132 regionsPart133 regionsPart134 regionsPart135 regionsPart136 regionsPart137 regionsPart138 regionsPart139 regionsPart140 regionsPart141 regionsPart142 regionsPart143 regionsPart144 regionsPart145 regionsPart146 regionsPart147 regionsPart148 regionsPart149 regionsPart150 regionsPart151 regionsPart152 regionsPart153 regionsPart154 regionsPart155 regionsPart156 regionsPart157 regionsPart158 regionsPart159 regionsPart160 regionsPart161 regionsPart162 regionsPart163 regionsPart164 regionsPart165 regionsPart166 regionsPart167 regionsPart168 regionsPart169 regionsPart170 regionsPart171 regionsPart172 regionsPart173 regionsPart174 regionsPart175 regionsPart176 regionsPart177 regionsPart178 regionsPart179 regionsPart180 regionsPart181 regionsPart182 regionsPart183 regionsPart184 regionsPart185 regionsPart186 regionsPart187 regionsPart188 regionsPart189 regionsPart190 regionsPart191 regionsPart192 regionsPart193 regionsPart194 regionsPart195 regionsPart196 regionsPart197 regionsPart198 regionsPart199 regionsPart200 regionsPart201 regionsPart202 regionsPart203 regionsPart204 regionsPart205 regionsPart206 regionsPart207 regionsPart208 regionsPart209 regionsPart210 regionsPart211 regionsPart212 regionsPart213 regionsPart214 regionsPart215 regionsPart216 regionsPart217 regionsPart218 regionsPart219 regionsPart220 regionsPart221 regionsPart222 regionsPart223 regionsPart224 regionsPart225 regionsPart226 regionsPart227 regionsPart228 regionsPart229 regionsPart230 regionsPart231 regionsPart232 regionsPart233 regionsPart234 regionsPart235 regionsPart236 regionsPart237 regionsPart238 regionsPart239 regionsPart240 regionsPart241 regionsPart242 regionsPart243 regionsPart244 regionsPart245 regionsPart246 regionsPart247 regionsPart248 regionsPart249 regionsPart250 regionsPart251 regionsPart252 regionsPart253 regionsPart254 regionsPart255 regionsPart256 regionsPart257 regionsPart258 regionsPart259 regionsPart260 regionsPart261 regionsPart262 regionsPart263 regionsPart264 regionsPart265 regionsPart266 regionsPart267 regionsPart268 regionsPart269 regionsPart270 regionsPart271 regionsPart272 regionsPart273 regionsPart274 regionsPart275 regionsPart276 regionsPart277 regionsPart278 regionsPart279 regionsPart280 regionsPart281 regionsPart282 regionsPart283 regionsPart284 regionsPart285 regionsPart286 regionsPart287 regionsPart288 regionsPart289 regionsPart290 regionsPart291 regionsPart292 regionsPart293 regionsPart294 regionsPart295 regionsPart296 regionsPart297 regionsPart298 regionsPart299 regionsPart300 regionsPart301 regionsPart302 regionsPart303 regionsPart304 regionsPart305 regionsPart306 regionsPart307 regionsPart308 regionsPart309 regionsPart310 regionsPart311 regionsPart312 regionsPart313 regionsPart314 regionsPart315 regionsPart316 regionsPart317 regionsPart318 regionsPart319 regionsPart320 regionsPart321 regionsPart322 regionsPart323 regionsPart324 regionsPart325 regionsPart326 regionsPart327 regionsPart328 regionsPart329 regionsPart330 regionsPart331 regionsPart332 regionsPart333 regionsPart334 regionsPart335 regionsPart336 regionsPart337 regionsPart338 regionsPart339 regionsPart340 regionsPart341 regionsPart342 regionsPart343 regionsPart344 regionsPart345 regionsPart346 regionsPart347 regionsPart348 regionsPart349 regionsPart350 regionsPart351 regionsPart352 regionsPart353 regionsPart354 regionsPart355 regionsPart356 regionsPart357 regionsPart358 regionsPart359 regionsPart360 regionsPart361 regionsPart362 regionsPart363 regionsPart364 regionsPart365 regionsPart366 regionsPart367 regionsPart368 regionsPart369 regionsPart370 regionsPart371 regionsPart372 regionsPart373 regionsPart374 regionsPart375 regionsPart376 regionsPart377 regionsPart378 regionsPart379 regionsPart380 regionsPart381 regionsPart382 regionsPart383 regionsPart384 regionsPart385 regionsPart386 regionsPart387 regionsPart388 regionsPart389 regionsPart390 regionsPart391 regionsPart392 regionsPart393 regionsPart394 regionsPart395 regionsPart396 regionsPart397 regionsPart398 regionsPart399 regionsPart400 regionsPart401 regionsPart402 regionsPart403 regionsPart404 regionsPart405 regionsPart406 regionsPart407 regionsPart408 regionsPart409 regionsPart410 regionsPart411 regionsPart412 regionsPart413 regionsPart414 regionsPart415 regionsPart416 regionsPart417 regionsPart418 regionsPart419 regionsPart420 regionsPart421 regionsPart422 regionsPart423 regionsPart424 regionsPart425 regionsPart426 regionsPart427 regionsPart428 regionsPart429 regionsPart430 regionsPart431 regionsPart432 regionsPart433 regionsPart434 regionsPart435 regionsPart436 regionsPart437 regionsPart438 regionsPart439 regionsPart440 regionsPart441 regionsPart442 regionsPart443 regionsPart444 regionsPart445 regionsPart446 regionsPart447 regionsPart448 regionsPart449 regionsPart450 regionsPart451 regionsPart452 regionsPart453 regionsPart454 regionsPart455 regionsPart456 regionsPart457 regionsPart458 regionsPart459 regionsPart460 regionsPart461 regionsPart462 regionsPart463 regionsPart464 regionsPart465 regionsPart466 regionsPart467 regionsPart468 regionsPart469 regionsPart470 regionsPart471 regionsPart472 regionsPart473 regionsPart474 regionsPart475 regionsPart476 regionsPart477 regionsPart478 regionsPart479 regionsPart480 regionsPart481 regionsPart482 regionsPart483 regionsPart484 regionsPart485 regionsPart486 regionsPart487 regionsPart488 regionsPart489 regionsPart490 regionsPart491 regionsPart492 regionsPart493 regionsPart494 regionsPart495 regionsPart496 regionsPart497 regionsPart498 regionsPart499 regionsPart500 regionsPart501 regionsPart502 regionsPart503 regionsPart504 regionsPart505 regionsPart506 regionsPart507 regionsPart508 regionsPart509 regionsPart510 regionsPart511 regionsPart512 regionsPart513 regionsPart514 regionsPart515 regionsPart516 regionsPart517 regionsPart518 regionsPart519 regionsPart520 regionsPart521 regionsPart522 regionsPart523 regionsPart524 regionsPart525 regionsPart526 regionsPart527 regionsPart528 regionsPart529 regionsPart530 regionsPart531 regionsPart532 regionsPart533 regionsPart534 regionsPart535 regionsPart536 regionsPart537 regionsPart538 regionsPart539 regionsPart540 regionsPart541 regionsPart542 regionsPart543 regionsPart544 regionsPart545 regionsPart546 regionsPart547 regionsPart548 regionsPart549 regionsPart550 regionsPart551 regionsPart552 regionsPart553 regionsPart554 regionsPart555 regionsPart556 regionsPart557 regionsPart558 regionsPart559 regionsPart560 regionsPart561 regionsPart562 regionsPart563 regionsPart564 regionsPart565 regionsPart566 regionsPart567 regionsPart568 regionsPart569 regionsPart570 regionsPart571 regionsPart572 regionsPart573 regionsPart574 regionsPart575 regionsPart576 regionsPart577 regionsPart578 regionsPart579 regionsPart580 regionsPart581 regionsPart582 regionsPart583 regionsPart584 regionsPart585 regionsPart586 regionsPart587 regionsPart588 regionsPart589 regionsPart590 regionsPart591 regionsPart592 regionsPart593 regionsPart594 regionsPart595 regionsPart596 regionsPart597 regionsPart598 regionsPart599 regionsPart600 regionsPart601 regionsPart602 regionsPart603 regionsPart604 regionsPart605 regionsPart606 regionsPart607 regionsPart608 regionsPart609 regionsPart610 regionsPart611 regionsPart612 regionsPart613 regionsPart614 regionsPart615 regionsPart616 regionsPart617 regionsPart618 regionsPart619 regionsPart620 regionsPart621 regionsPart622 regionsPart623 regionsPart624 regionsPart625 regionsPart626 regionsPart627 regionsPart628 regionsPart629 regionsPart630 regionsPart631 regionsPart632 regionsPart633 regionsPart634 regionsPart635 regionsPart636 regionsPart637 regionsPart638 regionsPart639 regionsPart640 regionsPart641 regionsPart642 regionsPart643 regionsPart644 regionsPart645 regionsPart646 regionsPart647 regionsPart648 regionsPart649 regionsPart650 regionsPart651 regionsPart652 regionsPart653 regionsPart654 regionsPart655 regionsPart656 regionsPart657 regionsPart658 regionsPart659 regionsPart660 regionsPart661 regionsPart662 regionsPart663 regionsPart664 regionsPart665 regionsPart666 regionsPart667 regionsPart668 regionsPart669 regionsPart670 regionsPart671 regionsPart672 regionsPart673 regionsPart674 regionsPart675 regionsPart676 regionsPart677 regionsPart678 regionsPart679 regionsPart680 regionsPart681 regionsPart682 regionsPart683 regionsPart684 regionsPart685 regionsPart686 regionsPart687 regionsPart688 regionsPart689 regionsPart690 regionsPart691 regionsPart692 regionsPart693 regionsPart694 regionsPart695 regionsPart696 regionsPart697 regionsPart698 regionsPart699 regionsPart700 regionsPart701 regionsPart702 regionsPart703 regionsPart704 regionsPart705 regionsPart706 regionsPart707 regionsPart708 regionsPart709 regionsPart710 regionsPart711 regionsPart712 regionsPart713 regionsPart714 regionsPart715 regionsPart716 regionsPart717 regionsPart718 regionsPart719 regionsPart720 regionsPart721 regionsPart722 regionsPart723 regionsPart724 regionsPart725 regionsPart726 regionsPart727 regionsPart728 regionsPart729 regionsPart730 regionsPart731 regionsPart732 regionsPart733 regionsPart734 regionsPart735 regionsPart736 regionsPart737 regionsPart738 regionsPart739 regionsPart740 regionsPart741 regionsPart742 regionsPart743 regionsPart744 regionsPart745 regionsPart746 regionsPart747 regionsPart748 regionsPart749 regionsPart750 regionsPart751 regionsPart752 regionsPart753 regionsPart754 regionsPart755 regionsPart756 regionsPart757 regionsPart758 regionsPart759 regionsPart760 regionsPart761 regionsPart762 regionsPart763 regionsPart764 regionsPart765 regionsPart766 regionsPart767 regionsPart768 regionsPart769 regionsPart770 regionsPart771 regionsPart772 regionsPart773 regionsPart774 regionsPart775 regionsPart776 regionsPart777 regionsPart778 regionsPart779 regionsPart780 regionsPart781 regionsPart782 regionsPart783 regionsPart784 regionsPart785 regionsPart786 regionsPart787 regionsPart788 regionsPart789 regionsPart790 regionsPart791 regionsPart792 regionsPart793 regionsPart794 regionsPart795 regionsPart796 regionsPart797 regionsPart798 regionsPart799 regionsPart800 regionsPart801 regionsPart802 regionsPart803 regionsPart804 regionsPart805 regionsPart806 regionsPart807 regionsPart808 regionsPart809 regionsPart810 regionsPart811 regionsPart812 regionsPart813 regionsPart814 regionsPart815 regionsPart816 regionsPart817 regionsPart818 regionsPart819 regionsPart820 regionsPart821 regionsPart822 regionsPart823 regionsPart824 regionsPart825 regionsPart826 regionsPart827 regionsPart828 regionsPart829 regionsPart830 regionsPart831 regionsPart832 regionsPart833 regionsPart834 regionsPart835 regionsPart836 regionsPart837 regionsPart838 regionsPart839 regionsPart840 regionsPart841 regionsPart842 regionsPart843 regionsPart844 regionsPart845 regionsPart846 regionsPart847 regionsPart848 regionsPart849 regionsPart850 regionsPart851 regionsPart852 regionsPart853 regionsPart854 regionsPart855 regionsPart856 regionsPart857 regionsPart858 regionsPart859 regionsPart860 regionsPart861 regionsPart862 regionsPart863 regionsPart864 regionsPart865 regionsPart866 regionsPart867 regionsPart868 regionsPart869 regionsPart870 regionsPart871 regionsPart872 regionsPart873 regionsPart874 regionsPart875 regionsPart876 regionsPart877 regionsPart878 regionsPart879 regionsPart880 regionsPart881 regionsPart882 regionsPart883 regionsPart884 regionsPart885 regionsPart886 regionsPart887 regionsPart888 regionsPart889 regionsPart890 regionsPart891 regionsPart892 regionsPart893 regionsPart894 regionsPart895 regionsPart896 regionsPart897 regionsPart898 regionsPart899 regionsPart900 regionsPart901 regionsPart902 regionsPart903 regionsPart904 regionsPart905 regionsPart906 regionsPart907 regionsPart908 regionsPart909 regionsPart910 regionsPart911 regionsPart912 regionsPart913 regionsPart914 regionsPart915 regionsPart916 regionsPart917 regionsPart918 regionsPart919 regionsPart920 regionsPart921 regionsPart922 regionsPart923 regionsPart924 regionsPart925 regionsPart926 regionsPart927 regionsPart928 regionsPart929 regionsPart930 regionsPart931 regionsPart932 regionsPart933 regionsPart934 regionsPart935 regionsPart936 regionsPart937 regionsPart938 regionsPart939 regionsPart940 regionsPart941 regionsPart942 regionsPart943 regionsPart944 regionsPart945 regionsPart946 regionsPart947 regionsPart948 regionsPart949 regionsPart950 regionsPart951 regionsPart952 regionsPart953 regionsPart954 regionsPart955 regionsPart956 regionsPart957 regionsPart958 regionsPart959 regionsPart960 regionsPart961 regionsPart962 regionsPart963 regionsPart964 regionsPart965 regionsPart966 regionsPart967 regionsPart968 regionsPart969 regionsPart970 regionsPart971 regionsPart972 regionsPart973 regionsPart974 regionsPart975 regionsPart976 regionsPart977 regionsPart978 regionsPart979 regionsPart980 regionsPart981 regionsPart982 regionsPart983 regionsPart984 regionsPart985 regionsPart986 regionsPart987 regionsPart988 regionsPart989 regionsPart990 regionsPart991 regionsPart992 regionsPart993 regionsPart994 regionsPart995 regionsPart996 regionsPart997 regionsPart998 regionsPart999 regionsPart1000 regionsPart1001 regionsPart1002 regionsPart1003 regionsPart1004 regionsPart1005 regionsPart1006 regionsPart1007 regionsPart1008 regionsPart1009 regionsPart1010
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 14 11 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regions, List.mem_append] at h
  rcases h with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
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
  · exact regionsGroup023_valid region h
  · exact regionsGroup024_valid region h
  · exact regionsGroup025_valid region h
  · exact regionsGroup026_valid region h
  · exact regionsGroup027_valid region h
  · exact regionsGroup028_valid region h
  · exact regionsGroup029_valid region h
  · exact regionsGroup030_valid region h
  · exact regionsGroup031_valid region h
  · exact regionsGroup032_valid region h
  · exact regionsGroup033_valid region h
  · exact regionsGroup034_valid region h
  · exact regionsGroup035_valid region h
  · exact regionsGroup036_valid region h
  · exact regionsGroup037_valid region h
  · exact regionsGroup038_valid region h
  · exact regionsGroup039_valid region h
  · exact regionsGroup040_valid region h
  · exact regionsGroup041_valid region h
  · exact regionsGroup042_valid region h
  · exact regionsGroup043_valid region h
  · exact regionsGroup044_valid region h
  · exact regionsGroup045_valid region h
  · exact regionsGroup046_valid region h
  · exact regionsGroup047_valid region h
  · exact regionsGroup048_valid region h
  · exact regionsGroup049_valid region h
  · exact regionsGroup050_valid region h
  · exact regionsGroup051_valid region h
  · exact regionsGroup052_valid region h
  · exact regionsGroup053_valid region h
  · exact regionsGroup054_valid region h
  · exact regionsGroup055_valid region h
  · exact regionsGroup056_valid region h
  · exact regionsGroup057_valid region h
  · exact regionsGroup058_valid region h
  · exact regionsGroup059_valid region h
  · exact regionsGroup060_valid region h
  · exact regionsGroup061_valid region h
  · exact regionsGroup062_valid region h
  · exact regionsGroup063_valid region h

theorem regions_cover : TreeRegionsCover 14 11 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_14_11 : Problem63HoldsAt 14 11 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 4041 regions. -/
theorem region_count : regions.length = 4041 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_14_11
