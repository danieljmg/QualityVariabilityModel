# File name: Trimesh_96.cql
# (Copyright) Author: Daniel-Jesus Munoz
# Date created: 06/05/2024
# Version: CQL IDE 5/2024 + Java JDK 17.0.11
# Description: Triangle Mesh Library SPL modelled in CQL Variant-Wise Sampling 96

# IDE options, we activate aggregation although is not functorial, it is needed when merging tree traces
options
	allow_aggregation_unsafe = true
	timeout = 99999999

# Basic datatype objects and reusable functorial arrows
typeside Ty = literal {
  external_types
    String -> "java.lang.String"
    Bool -> "java.lang.Boolean"
    Integer -> "java.lang.Integer"
  external_parsers
    String -> "x => x"
    Bool -> "x => java.lang.Boolean.parseBoolean(x)"
    Integer -> "parseInt"
  external_functions
    # Variability comparisons
    eq : String, String -> Bool = "(x, y) => (x == y)"
    not : String, String -> Bool = "(x, y) => (x != y)"

    # Boolean operators
    and : Bool, Bool -> Bool = "(x, y) => (x && y)"
    or : Bool, Bool -> Bool = "(x, y) => (x || y)"
    diff : Bool, Bool -> Bool = "(x, y) => (x != y)"

    # Integer operators
    ieq : Integer, Integer -> Bool = "(x, y) => (x == y)"  
    ge : Integer, Integer -> Bool = "(x, y) => (x > y)"
    geq : Integer, Integer -> Bool = "(x, y) => (x >= y)"
    le : Integer, Integer -> Bool = "(x, y) => (x < y)"
    leq : Integer, Integer -> Bool = "(x, y) => (x <= y)"

    concat : String, String, String -> String = "(x, y, z) => (x + ' = ' + y.toString() + ' ' + z)"
    regconcat : String, String -> String = "(x, y) => (x + ' & ' + y)"
    ifi : Bool, String, String -> String = "(x,a,b) => x ? a : b"
  
    trace2 : String, String, String, String, String -> String = "(a, b, c, d, e) => (a + ' -->(' + b + ') ' + c + ' -->(' + d + ') ' + e)"
    itrace2 : String, String, String, String, String, Integer, String -> String = "(a, b, c, d, e, f, g) => (a + ' -->(' + b + ') ' + c + ' -->(' + d + ') ' + e + ' = ' + f.toString() + ' ' + g)"
  
    add  : Integer, Integer -> Integer = "(x, y) => (x + y)"
    sub  : Integer, Integer -> Integer = "(x, y) => (x - y)"
    mult : Integer, Integer -> Integer = "(x, y) => (x * y)"
    div  : Integer, Integer -> Integer = "(x, y) => (x / y)"
    mod  : Integer, Integer -> Integer = "(x, y) => (x % y)"


}

# Category 
schema VariabilityModelCategory = literal : Ty {
  #Objects
  entities
    Feature    # Olog of the Variability Model

  # Variant-wise Entities
  Qn # Quality Name
  Qv # Quality Value
  Qd # Quality Domain
  Qs # (Qn,Qv,Qd) Quality Model
  
  # VM-QM Linkage entities
  CCs # Features forming a complete configuration
  QAs # Sets of QAs
  QMC # Span relating CCs with a set of QAs
  
  #Functorial Relation Arrows
  foreign_keys
    parent       : Feature -> Feature # Hierarchichal Feature Relation
  
  # Quality Model
  #parent : Qs -> Qs
  name        : Qs -> Qn
  value       : Qs -> Qv
  domain      : Qs -> Qd

  # VM-QM Linkages 
  feature     : CCs -> Feature # Features belonging to a Complete Configuration
  qualities   : QAs -> Qs # Sets of valued Quality Attributes.
  
  #Non-Functional Relation and Elements Arrows
  attributes
    # Traditional Boolean Variability Model Arrows
    name          : Feature -> String     # Feature Name
    cardinality  : Feature -> String # Children cardinality ([x..y] OR leaf)
    optionality  : Feature -> Bool

    # Numerical Variability Model Arrows
    domain       : Feature -> String      # Feature Domain (Boolean by default, else Bytes, Metres or whatever)
    value        : Feature -> Integer     # Numerical Feature Value

    # Attributed Variability Model Arrow
    CodeLines: Feature -> Integer
    
  
  # Quality Model Arrows
  name        : Qn -> String  # Quality Name
  value       : Qv -> String # Quality Numerical Value
  domain      : Qd -> String  # Quality Domain
  
  # IDs for one to many relationship
  id          : CCs -> Integer #Identify each Complete Configuration
  id          : QAs -> Integer #Identify each set of Valued Qualities
  
  # QMC SPAN (binary relation between CCs and sets of QAs)
  phi         : QMC -> Integer # "Points" to a Complete Configuration
  psi         : QMC -> Integer # "Points" to a set of Valued Quality Attributes
}


# Variability Model Data
instance VariabilityModelData = literal : VariabilityModelCategory {
  #Individual instances
  generators 
    f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31 : Feature
  
  # Quality Model
    qn1 qn2 : Qn # Unique instances
    qv1 qv2 qv3 qv4 qv5 qv6 qv7 qv8 qv9 qv10 qv11 qv12 qv13 qv14 qv15 qv16 qv17 qv18 qv19 qv20 qv21 qv22 qv23 qv24 qv25 qv26 qv27 qv28 qv29 qv30 qv31 qv32 qv33 qv34 qv35 qv36 qv37 qv38 qv39 qv40 qv41 qv42 qv43 qv44 qv45 qv46 qv47 qv48 qv49 qv50 qv51 qv52 qv53 qv54 qv55 qv56 qv57 qv58 qv59 qv60 qv61 qv62 qv63 qv64 qv65 qv66 qv67 qv68 qv69 qv70 qv71 qv72 qv73 qv74 qv75 qv76 qv77 qv78 qv79 qv80 qv81 qv82 qv83 qv84 qv85 qv86 qv87 qv88 qv89 qv90 qv91 qv92 qv93 qv94 qv95 qv96 qv97 : Qv # Unique instances
    qd1 : Qd # Unique instances
    qs1 qs2 qs3 qs4 qs5 qs6 qs7 qs8 qs9 qs10 qs11 qs12 qs13 qs14 qs15 qs16 qs17 qs18 qs19 qs20 qs21 qs22 qs23 qs24 qs25 qs26 qs27 qs28 qs29 qs30 qs31 qs32 qs33 qs34 qs35 qs36 qs37 qs38 qs39 qs40 qs41 qs42 qs43 qs44 qs45 qs46 qs47 qs48 qs49 qs50 qs51 qs52 qs53 qs54 qs55 qs56 qs57 qs58 qs59 qs60 qs61 qs62 qs63 qs64 qs65 qs66 qs67 qs68 qs69 qs70 qs71 qs72 qs73 qs74 qs75 qs76 qs77 qs78 qs79 qs80 qs81 qs82 qs83 qs84 qs85 qs86 qs87 qs88 qs89 qs90 qs91 qs92 qs93 qs94 qs95 qs96 qs97 : Qs # Unique instances

  # Virtual arrows instances
    qa1 qa2 qa3 qa4 qa5 qa6 qa7 qa8 qa9 qa10 qa11 qa12 qa13 qa14 qa15 qa16 qa17 qa18 qa19 qa20 qa21 qa22 qa23 qa24 qa25 qa26 qa27 qa28 qa29 qa30 qa31 qa32 qa33 qa34 qa35 qa36 qa37 qa38 qa39 qa40 qa41 qa42 qa43 qa44 qa45 qa46 qa47 qa48 qa49 qa50 qa51 qa52 qa53 qa54 qa55 qa56 qa57 qa58 qa59 qa60 qa61 qa62 qa63 qa64 qa65 qa66 qa67 qa68 qa69 qa70 qa71 qa72 qa73 qa74 qa75 qa76 qa77 qa78 qa79 qa80 qa81 qa82 qa83 qa84 qa85 qa86 qa87 qa88 qa89 qa90 qa91 qa92 qa93 qa94 qa95 qa96 qa97 qa98 qa99 qa100 qa101 qa102 qa103 qa104 qa105 qa106 qa107 qa108 qa109 qa110 qa111 qa112 qa113 qa114 qa115 qa116 qa117 qa118 qa119 qa120 qa121 qa122 qa123 qa124 qa125 qa126 qa127 qa128 qa129 qa130 qa131 qa132 qa133 qa134 qa135 qa136 qa137 qa138 qa139 qa140 qa141 qa142 qa143 qa144 qa145 qa146 qa147 qa148 qa149 qa150 qa151 qa152 qa153 qa154 qa155 qa156 qa157 qa158 qa159 qa160 qa161 qa162 qa163 qa164 qa165 qa166 qa167 qa168 qa169 qa170 qa171 qa172 qa173 qa174 qa175 qa176 qa177 qa178 qa179 qa180 qa181 qa182 qa183 qa184 qa185 qa186 qa187 qa188 qa189 qa190 qa191 qa192 : QAs 
    cc1 cc2 cc3 cc4 cc5 cc6 cc7 cc8 cc9 cc10 cc11 cc12 cc13 cc14 cc15 cc16 cc17 cc18 cc19 cc20 cc21 cc22 cc23 cc24 cc25 cc26 cc27 cc28 cc29 cc30 cc31 cc32 cc33 cc34 cc35 cc36 cc37 cc38 cc39 cc40 cc41 cc42 cc43 cc44 cc45 cc46 cc47 cc48 cc49 cc50 cc51 cc52 cc53 cc54 cc55 cc56 cc57 cc58 cc59 cc60 cc61 cc62 cc63 cc64 cc65 cc66 cc67 cc68 cc69 cc70 cc71 cc72 cc73 cc74 cc75 cc76 cc77 cc78 cc79 cc80 cc81 cc82 cc83 cc84 cc85 cc86 cc87 cc88 cc89 cc90 cc91 cc92 cc93 cc94 cc95 cc96 cc97 cc98 cc99 cc100 cc101 cc102 cc103 cc104 cc105 cc106 cc107 cc108 cc109 cc110 cc111 cc112 cc113 cc114 cc115 cc116 cc117 cc118 cc119 cc120 cc121 cc122 cc123 cc124 cc125 cc126 cc127 cc128 cc129 cc130 cc131 cc132 cc133 cc134 cc135 cc136 cc137 cc138 cc139 cc140 cc141 cc142 cc143 cc144 cc145 cc146 cc147 cc148 cc149 cc150 cc151 cc152 cc153 cc154 cc155 cc156 cc157 cc158 cc159 cc160 cc161 cc162 cc163 cc164 cc165 cc166 cc167 cc168 cc169 cc170 cc171 cc172 cc173 cc174 cc175 cc176 cc177 cc178 cc179 cc180 cc181 cc182 cc183 cc184 cc185 cc186 cc187 cc188 cc189 cc190 cc191 cc192 cc193 cc194 cc195 cc196 cc197 cc198 cc199 cc200 cc201 cc202 cc203 cc204 cc205 cc206 cc207 cc208 cc209 cc210 cc211 cc212 cc213 cc214 cc215 cc216 cc217 cc218 cc219 cc220 cc221 cc222 cc223 cc224 cc225 cc226 cc227 cc228 cc229 cc230 cc231 cc232 cc233 cc234 cc235 cc236 cc237 cc238 cc239 cc240 cc241 cc242 cc243 cc244 cc245 cc246 cc247 cc248 cc249 cc250 cc251 cc252 cc253 cc254 cc255 cc256 cc257 cc258 cc259 cc260 cc261 cc262 cc263 cc264 cc265 cc266 cc267 cc268 cc269 cc270 cc271 cc272 cc273 cc274 cc275 cc276 cc277 cc278 cc279 cc280 cc281 cc282 cc283 cc284 cc285 cc286 cc287 cc288 cc289 cc290 cc291 cc292 cc293 cc294 cc295 cc296 cc297 cc298 cc299 cc300 cc301 cc302 cc303 cc304 cc305 cc306 cc307 cc308 cc309 cc310 cc311 cc312 cc313 cc314 cc315 cc316 cc317 cc318 cc319 cc320 cc321 cc322 cc323 cc324 cc325 cc326 cc327 cc328 cc329 cc330 cc331 cc332 cc333 cc334 cc335 cc336 cc337 cc338 cc339 cc340 cc341 cc342 cc343 cc344 cc345 cc346 cc347 cc348 cc349 cc350 cc351 cc352 cc353 cc354 cc355 cc356 cc357 cc358 cc359 cc360 cc361 cc362 cc363 cc364 cc365 cc366 cc367 cc368 cc369 cc370 cc371 cc372 cc373 cc374 cc375 cc376 cc377 cc378 cc379 cc380 cc381 cc382 cc383 cc384 cc385 cc386 cc387 cc388 cc389 cc390 cc391 cc392 cc393 cc394 cc395 cc396 cc397 cc398 cc399 cc400 cc401 cc402 cc403 cc404 cc405 cc406 cc407 cc408 cc409 cc410 cc411 cc412 cc413 cc414 cc415 cc416 cc417 cc418 cc419 cc420 cc421 cc422 cc423 cc424 cc425 cc426 cc427 cc428 cc429 cc430 cc431 cc432 cc433 cc434 cc435 cc436 cc437 cc438 cc439 cc440 cc441 cc442 cc443 cc444 cc445 cc446 cc447 cc448 cc449 cc450 cc451 cc452 cc453 cc454 cc455 cc456 cc457 cc458 cc459 cc460 cc461 cc462 cc463 cc464 cc465 cc466 cc467 cc468 cc469 cc470 cc471 cc472 cc473 cc474 cc475 cc476 cc477 cc478 cc479 cc480 cc481 cc482 cc483 cc484 cc485 cc486 cc487 cc488 cc489 cc490 cc491 cc492 cc493 cc494 cc495 cc496 cc497 cc498 cc499 cc500 cc501 cc502 cc503 cc504 cc505 cc506 cc507 cc508 cc509 cc510 cc511 cc512 cc513 cc514 cc515 cc516 cc517 cc518 cc519 cc520 cc521 cc522 cc523 cc524 cc525 cc526 cc527 cc528 cc529 cc530 cc531 cc532 cc533 cc534 cc535 cc536 cc537 cc538 cc539 cc540 cc541 cc542 cc543 cc544 cc545 cc546 cc547 cc548 cc549 cc550 cc551 cc552 cc553 cc554 cc555 cc556 cc557 cc558 cc559 cc560 cc561 cc562 cc563 cc564 cc565 cc566 cc567 cc568 cc569 cc570 cc571 cc572 cc573 cc574 cc575 cc576 cc577 cc578 cc579 cc580 cc581 cc582 cc583 cc584 cc585 cc586 cc587 cc588 cc589 cc590 cc591 cc592 cc593 cc594 cc595 cc596 cc597 cc598 cc599 cc600 cc601 cc602 cc603 cc604 cc605 cc606 cc607 cc608 cc609 cc610 cc611 cc612 cc613 cc614 cc615 cc616 cc617 cc618 cc619 cc620 cc621 cc622 cc623 cc624 cc625 cc626 cc627 cc628 cc629 cc630 cc631 cc632 cc633 cc634 cc635 cc636 cc637 cc638 cc639 cc640 cc641 cc642 cc643 cc644 cc645 cc646 cc647 cc648 cc649 cc650 cc651 cc652 cc653 cc654 cc655 cc656 cc657 cc658 cc659 cc660 cc661 cc662 cc663 cc664 cc665 cc666 cc667 cc668 cc669 cc670 cc671 cc672 cc673 cc674 cc675 cc676 cc677 cc678 cc679 cc680 cc681 cc682 cc683 cc684 cc685 cc686 cc687 cc688 cc689 cc690 cc691 cc692 cc693 cc694 cc695 cc696 cc697 cc698 cc699 cc700 cc701 cc702 cc703 cc704 cc705 cc706 cc707 cc708 cc709 cc710 cc711 cc712 cc713 cc714 cc715 cc716 cc717 cc718 cc719 cc720 cc721 cc722 cc723 cc724 cc725 cc726 cc727 cc728 cc729 cc730 cc731 cc732 cc733 cc734 cc735 cc736 cc737 cc738 cc739 cc740 cc741 cc742 cc743 cc744 cc745 cc746 cc747 cc748 cc749 cc750 cc751 cc752 cc753 cc754 cc755 cc756 cc757 cc758 cc759 cc760 cc761 cc762 cc763 cc764 cc765 cc766 cc767 cc768 cc769 cc770 cc771 cc772 cc773 cc774 cc775 cc776 cc777 cc778 cc779 cc780 cc781 cc782 cc783 cc784 cc785 cc786 cc787 cc788 cc789 cc790 cc791 cc792 cc793 cc794 cc795 cc796 cc797 cc798 cc799 cc800 cc801 cc802 cc803 cc804 cc805 cc806 cc807 cc808 cc809 cc810 cc811 cc812 cc813 cc814 cc815 cc816 cc817 cc818 cc819 cc820 cc821 cc822 cc823 cc824 cc825 cc826 cc827 cc828 cc829 cc830 cc831 cc832 cc833 cc834 cc835 cc836 cc837 cc838 cc839 cc840 cc841 cc842 cc843 cc844 cc845 cc846 cc847 cc848 cc849 cc850 cc851 cc852 cc853 cc854 cc855 cc856 cc857 cc858 cc859 cc860 cc861 cc862 cc863 cc864 cc865 cc866 cc867 cc868 cc869 cc870 cc871 cc872 cc873 cc874 cc875 cc876 cc877 cc878 cc879 cc880 cc881 cc882 cc883 cc884 cc885 cc886 cc887 cc888 cc889 cc890 cc891 cc892 cc893 cc894 cc895 cc896 cc897 cc898 cc899 cc900 cc901 cc902 cc903 cc904 cc905 cc906 cc907 cc908 cc909 cc910 cc911 cc912 cc913 cc914 cc915 cc916 cc917 cc918 cc919 cc920 cc921 cc922 cc923 cc924 cc925 cc926 cc927 cc928 cc929 cc930 cc931 cc932 cc933 cc934 cc935 cc936 cc937 cc938 cc939 cc940 cc941 cc942 cc943 cc944 cc945 cc946 cc947 cc948 cc949 cc950 cc951 cc952 cc953 cc954 cc955 cc956 cc957 cc958 cc959 cc960 cc961 cc962 cc963 cc964 cc965 cc966 cc967 cc968 cc969 cc970 cc971 cc972 cc973 cc974 cc975 cc976 cc977 cc978 cc979 cc980 cc981 cc982 cc983 cc984 cc985 cc986 cc987 cc988 cc989 cc990 cc991 cc992 cc993 cc994 cc995 cc996 cc997 cc998 cc999 cc1000 cc1001 cc1002 cc1003 cc1004 cc1005 cc1006 cc1007 cc1008 cc1009 cc1010 cc1011 cc1012 cc1013 cc1014 cc1015 cc1016 cc1017 cc1018 cc1019 cc1020 cc1021 cc1022 cc1023 cc1024 cc1025 cc1026 cc1027 cc1028 cc1029 cc1030 cc1031 cc1032 cc1033 cc1034 cc1035 cc1036 cc1037 cc1038 cc1039 cc1040 cc1041 cc1042 cc1043 cc1044 cc1045 cc1046 cc1047 cc1048 cc1049 cc1050 cc1051 cc1052 cc1053 cc1054 cc1055 cc1056 cc1057 cc1058 cc1059 cc1060 cc1061 cc1062 cc1063 cc1064 cc1065 cc1066 cc1067 cc1068 cc1069 cc1070 cc1071 cc1072 cc1073 cc1074 cc1075 cc1076 cc1077 cc1078 cc1079 cc1080 cc1081 cc1082 cc1083 cc1084 cc1085 cc1086 cc1087 cc1088 cc1089 cc1090 cc1091 cc1092 cc1093 cc1094 cc1095 cc1096 cc1097 cc1098 cc1099 cc1100 cc1101 cc1102 cc1103 cc1104 cc1105 cc1106 cc1107 cc1108 cc1109 cc1110 cc1111 cc1112 cc1113 cc1114 cc1115 cc1116 cc1117 cc1118 cc1119 cc1120 cc1121 cc1122 cc1123 cc1124 cc1125 cc1126 cc1127 cc1128 cc1129 cc1130 cc1131 cc1132 cc1133 cc1134 cc1135 cc1136 cc1137 cc1138 cc1139 cc1140 cc1141 cc1142 cc1143 cc1144 cc1145 cc1146 cc1147 cc1148 cc1149 cc1150 cc1151 cc1152 cc1153 cc1154 cc1155 cc1156 cc1157 cc1158 cc1159 cc1160 cc1161 cc1162 cc1163 cc1164 cc1165 cc1166 cc1167 cc1168 cc1169 cc1170 cc1171 cc1172 cc1173 cc1174 cc1175 cc1176 cc1177 cc1178 cc1179 cc1180 cc1181 cc1182 cc1183 cc1184 cc1185 cc1186 cc1187 cc1188 cc1189 cc1190 cc1191 cc1192 cc1193 cc1194 cc1195 cc1196 cc1197 cc1198 cc1199 cc1200 cc1201 cc1202 cc1203 cc1204 cc1205 cc1206 cc1207 cc1208 cc1209 cc1210 cc1211 cc1212 cc1213 cc1214 cc1215 cc1216 cc1217 cc1218 cc1219 cc1220 cc1221 cc1222 cc1223 cc1224 cc1225 cc1226 cc1227 cc1228 cc1229 cc1230 cc1231 cc1232 cc1233 cc1234 cc1235 cc1236 cc1237 cc1238 cc1239 cc1240 cc1241 cc1242 cc1243 cc1244 cc1245 cc1246 cc1247 cc1248 cc1249 cc1250 cc1251 cc1252 cc1253 cc1254 cc1255 cc1256 cc1257 cc1258 cc1259 cc1260 cc1261 cc1262 cc1263 cc1264 cc1265 cc1266 cc1267 cc1268 cc1269 cc1270 cc1271 cc1272 cc1273 cc1274 cc1275 cc1276 cc1277 cc1278 cc1279 cc1280 cc1281 cc1282 cc1283 cc1284 cc1285 cc1286 cc1287 cc1288 cc1289 cc1290 cc1291 cc1292 cc1293 cc1294 cc1295 cc1296 cc1297 cc1298 cc1299 cc1300 cc1301 cc1302 cc1303 cc1304 cc1305 cc1306 cc1307 cc1308 cc1309 cc1310 cc1311 cc1312 cc1313 cc1314 cc1315 cc1316 cc1317 cc1318 cc1319 cc1320 cc1321 cc1322 cc1323 cc1324 cc1325 cc1326 cc1327 cc1328 cc1329 cc1330 cc1331 cc1332 cc1333 cc1334 cc1335 cc1336 cc1337 cc1338 cc1339 cc1340 cc1341 cc1342 cc1343 cc1344 cc1345 cc1346 cc1347 cc1348 cc1349 cc1350 cc1351 cc1352 cc1353 cc1354 cc1355 cc1356 cc1357 cc1358 cc1359 cc1360 cc1361 cc1362 cc1363 cc1364 cc1365 cc1366 cc1367 cc1368 cc1369 cc1370 cc1371 cc1372 cc1373 cc1374 cc1375 cc1376 cc1377 cc1378 cc1379 cc1380 cc1381 cc1382 cc1383 cc1384 cc1385 cc1386 cc1387 cc1388 cc1389 cc1390 cc1391 cc1392 cc1393 cc1394 cc1395 cc1396 cc1397 cc1398 cc1399 cc1400 cc1401 cc1402 cc1403 cc1404 cc1405 cc1406 cc1407 cc1408 cc1409 cc1410 cc1411 cc1412 cc1413 cc1414 cc1415 cc1416 cc1417 cc1418 cc1419 cc1420 cc1421 cc1422 cc1423 cc1424 cc1425 cc1426 cc1427 cc1428 cc1429 cc1430 cc1431 cc1432 cc1433 cc1434 cc1435 cc1436 cc1437 cc1438 cc1439 cc1440 cc1441 cc1442 cc1443 cc1444 cc1445 cc1446 cc1447 cc1448 cc1449 cc1450 cc1451 cc1452 cc1453 cc1454 cc1455 cc1456 cc1457 cc1458 cc1459 cc1460 cc1461 cc1462 cc1463 cc1464 cc1465 cc1466 cc1467 cc1468 cc1469 cc1470 cc1471 cc1472 cc1473 cc1474 cc1475 cc1476 cc1477 cc1478 cc1479 cc1480 cc1481 cc1482 cc1483 cc1484 cc1485 cc1486 cc1487 cc1488 cc1489 cc1490 cc1491 cc1492 cc1493 cc1494 cc1495 cc1496 cc1497 cc1498 cc1499 cc1500 cc1501 cc1502 cc1503 cc1504 cc1505 cc1506 cc1507 cc1508 cc1509 cc1510 cc1511 cc1512 cc1513 cc1514 cc1515 cc1516 cc1517 cc1518 cc1519 cc1520 cc1521 cc1522 cc1523 cc1524 cc1525 cc1526 cc1527 cc1528 cc1529 cc1530 cc1531 cc1532 cc1533 cc1534 cc1535 cc1536 cc1537 cc1538 cc1539 cc1540 cc1541 cc1542 cc1543 cc1544 cc1545 cc1546 cc1547 cc1548 cc1549 cc1550 cc1551 cc1552 cc1553 cc1554 cc1555 cc1556 cc1557 cc1558 cc1559 cc1560 cc1561 cc1562 cc1563 cc1564 cc1565 cc1566 cc1567 cc1568 cc1569 cc1570 cc1571 cc1572 cc1573 cc1574 cc1575 cc1576 cc1577 cc1578 cc1579 cc1580 cc1581 cc1582 cc1583 cc1584 cc1585 cc1586 cc1587 cc1588 cc1589 cc1590 cc1591 cc1592 cc1593 cc1594 cc1595 cc1596 cc1597 cc1598 cc1599 cc1600 cc1601 cc1602 cc1603 cc1604 cc1605 cc1606 cc1607 cc1608 cc1609 cc1610 cc1611 cc1612 cc1613 cc1614 cc1615 cc1616 cc1617 cc1618 cc1619 cc1620 cc1621 cc1622 cc1623 cc1624 cc1625 cc1626 cc1627 cc1628 cc1629 cc1630 cc1631 cc1632 cc1633 cc1634 cc1635 cc1636 cc1637 cc1638 cc1639 cc1640 cc1641 cc1642 cc1643 cc1644 cc1645 cc1646 cc1647 cc1648 cc1649 cc1650 cc1651 cc1652 cc1653 cc1654 cc1655 cc1656 cc1657 cc1658 cc1659 cc1660 cc1661 cc1662 cc1663 cc1664 cc1665 cc1666 cc1667 cc1668 cc1669 cc1670 cc1671 cc1672 cc1673 cc1674 cc1675 cc1676 cc1677 cc1678 cc1679 cc1680 cc1681 cc1682 : CCs 
    qmc1 qmc2 qmc3 qmc4 qmc5 qmc6 qmc7 qmc8 qmc9 qmc10 qmc11 qmc12 qmc13 qmc14 qmc15 qmc16 qmc17 qmc18 qmc19 qmc20 qmc21 qmc22 qmc23 qmc24 qmc25 qmc26 qmc27 qmc28 qmc29 qmc30 qmc31 qmc32 qmc33 qmc34 qmc35 qmc36 qmc37 qmc38 qmc39 qmc40 qmc41 qmc42 qmc43 qmc44 qmc45 qmc46 qmc47 qmc48 qmc49 qmc50 qmc51 qmc52 qmc53 qmc54 qmc55 qmc56 qmc57 qmc58 qmc59 qmc60 qmc61 qmc62 qmc63 qmc64 qmc65 qmc66 qmc67 qmc68 qmc69 qmc70 qmc71 qmc72 qmc73 qmc74 qmc75 qmc76 qmc77 qmc78 qmc79 qmc80 qmc81 qmc82 qmc83 qmc84 qmc85 qmc86 qmc87 qmc88 qmc89 qmc90 qmc91 qmc92 qmc93 qmc94 qmc95 qmc96 : QMC


  equations
  # Boolean features
   name(f1) = v0 cardinality(f1) = all optionality(f1) = false parent(f1) = f1 domain(f1) = Bool  CodeLines(f1) = 43304
  
   name(f2) = ZebraLine cardinality(f2) = leaf optionality(f2) = true parent(f2) = f1 domain(f2) = Bool  CodeLines(f2) = 90674
  
   name(f3) = Line cardinality(f3) = leaf optionality(f3) = true parent(f3) = f1 domain(f3) = Bool  CodeLines(f3) = 21776
  
   name(f4) = ColorGS cardinality(f4) = leaf optionality(f4) = true parent(f4) = f1 domain(f4) = Bool  CodeLines(f4) = 94527
  
   name(f5) = Jacobi cardinality(f5) = leaf optionality(f5) = true parent(f5) = f1 domain(f5) = Bool  CodeLines(f5) = 15141
  
   name(f6) = F cardinality(f6) = leaf optionality(f6) = true parent(f6) = f1 domain(f6) = Bool  CodeLines(f6) = 65121
  
   name(f7) = V cardinality(f7) = leaf optionality(f7) = true parent(f7) = f1 domain(f7) = Bool  CodeLines(f7) = 34159
  
   name(f8) = v22 cardinality(f8) = leaf optionality(f8) = true parent(f8) = f1 domain(f8) = Bool  CodeLines(f8) = 76408
  
   name(f9) = v21 cardinality(f9) = leaf optionality(f9) = true parent(f9) = f1 domain(f9) = Bool  CodeLines(f9) = 46497
  
   name(f10) = v20 cardinality(f10) = leaf optionality(f10) = true parent(f10) = f1 domain(f10) = Bool  CodeLines(f10) = 97794
  
   name(f11) = v19 cardinality(f11) = leaf optionality(f11) = true parent(f11) = f1 domain(f11) = Bool  CodeLines(f11) = 64063
  
   name(f12) = v18 cardinality(f12) = leaf optionality(f12) = true parent(f12) = f1 domain(f12) = Bool  CodeLines(f12) = 25399
  
   name(f13) = v17 cardinality(f13) = leaf optionality(f13) = true parent(f13) = f1 domain(f13) = Bool  CodeLines(f13) = 21257
  
   name(f14) = v16 cardinality(f14) = leaf optionality(f14) = true parent(f14) = f1 domain(f14) = Bool  CodeLines(f14) = 91521
  
   name(f15) = v15 cardinality(f15) = leaf optionality(f15) = true parent(f15) = f1 domain(f15) = Bool  CodeLines(f15) = 98923
  
   name(f16) = v14 cardinality(f16) = leaf optionality(f16) = true parent(f16) = f1 domain(f16) = Bool  CodeLines(f16) = 94971
  
   name(f17) = v13 cardinality(f17) = leaf optionality(f17) = true parent(f17) = f1 domain(f17) = Bool  CodeLines(f17) = 5530
  
   name(f18) = v12 cardinality(f18) = leaf optionality(f18) = true parent(f18) = f1 domain(f18) = Bool  CodeLines(f18) = 77008
  
   name(f19) = v11 cardinality(f19) = leaf optionality(f19) = true parent(f19) = f1 domain(f19) = Bool  CodeLines(f19) = 29206
  
   name(f20) = v10 cardinality(f20) = leaf optionality(f20) = true parent(f20) = f1 domain(f20) = Bool  CodeLines(f20) = 4876
  
   name(f21) = v9 cardinality(f21) = leaf optionality(f21) = true parent(f21) = f1 domain(f21) = Bool  CodeLines(f21) = 20700
  
   name(f22) = v8 cardinality(f22) = leaf optionality(f22) = true parent(f22) = f1 domain(f22) = Bool  CodeLines(f22) = 12256
  
   name(f23) = v7 cardinality(f23) = leaf optionality(f23) = true parent(f23) = f1 domain(f23) = Bool  CodeLines(f23) = 77633
  
   name(f24) = v6 cardinality(f24) = leaf optionality(f24) = true parent(f24) = f1 domain(f24) = Bool  CodeLines(f24) = 66059
  
   name(f25) = v5 cardinality(f25) = leaf optionality(f25) = true parent(f25) = f1 domain(f25) = Bool  CodeLines(f25) = 41459
  
   name(f26) = v4 cardinality(f26) = leaf optionality(f26) = true parent(f26) = f1 domain(f26) = Bool  CodeLines(f26) = 18134
  
   name(f27) = v3 cardinality(f27) = leaf optionality(f27) = true parent(f27) = f1 domain(f27) = Bool  CodeLines(f27) = 75505
  
   name(f28) = v2 cardinality(f28) = leaf optionality(f28) = true parent(f28) = f1 domain(f28) = Bool  CodeLines(f28) = 46383
  
   name(f29) = v1 cardinality(f29) = leaf optionality(f29) = true parent(f29) = f1 domain(f29) = Bool  CodeLines(f29) = 32605
  
   name(f30) = Smoother cardinality(f30) = leaf optionality(f30) = false parent(f30) = f1 domain(f30) = Bool  CodeLines(f30) = 95735
  
   name(f31) = Cycle cardinality(f31) = leaf optionality(f31) = false parent(f31) = f1 domain(f31) = Bool  CodeLines(f31) = 23257
  
  

  # Numerical features
  

  # CC Virtual Linkages
   id(cc1) = 1 feature(cc1) = f1
   id(cc2) = 1 feature(cc2) = f31
   id(cc3) = 1 feature(cc3) = f30
   id(cc4) = 2 feature(cc4) = f1
   id(cc5) = 2 feature(cc5) = f31
   id(cc6) = 2 feature(cc6) = f30
   id(cc7) = 2 feature(cc7) = f28
   id(cc8) = 3 feature(cc8) = f1
   id(cc9) = 3 feature(cc9) = f31
   id(cc10) = 3 feature(cc10) = f30
   id(cc11) = 3 feature(cc11) = f28
   id(cc12) = 3 feature(cc12) = f27
   id(cc13) = 4 feature(cc13) = f1
   id(cc14) = 4 feature(cc14) = f31
   id(cc15) = 4 feature(cc15) = f30
   id(cc16) = 4 feature(cc16) = f28
   id(cc17) = 4 feature(cc17) = f27
   id(cc18) = 4 feature(cc18) = f26
   id(cc19) = 5 feature(cc19) = f1
   id(cc20) = 5 feature(cc20) = f31
   id(cc21) = 5 feature(cc21) = f30
   id(cc22) = 5 feature(cc22) = f28
   id(cc23) = 5 feature(cc23) = f27
   id(cc24) = 5 feature(cc24) = f26
   id(cc25) = 5 feature(cc25) = f24
   id(cc26) = 6 feature(cc26) = f1
   id(cc27) = 6 feature(cc27) = f31
   id(cc28) = 6 feature(cc28) = f30
   id(cc29) = 6 feature(cc29) = f28
   id(cc30) = 6 feature(cc30) = f27
   id(cc31) = 6 feature(cc31) = f26
   id(cc32) = 6 feature(cc32) = f24
   id(cc33) = 6 feature(cc33) = f23
   id(cc34) = 7 feature(cc34) = f1
   id(cc35) = 7 feature(cc35) = f31
   id(cc36) = 7 feature(cc36) = f30
   id(cc37) = 7 feature(cc37) = f28
   id(cc38) = 7 feature(cc38) = f27
   id(cc39) = 7 feature(cc39) = f26
   id(cc40) = 7 feature(cc40) = f24
   id(cc41) = 7 feature(cc41) = f23
   id(cc42) = 7 feature(cc42) = f22
   id(cc43) = 8 feature(cc43) = f1
   id(cc44) = 8 feature(cc44) = f31
   id(cc45) = 8 feature(cc45) = f30
   id(cc46) = 8 feature(cc46) = f28
   id(cc47) = 8 feature(cc47) = f27
   id(cc48) = 8 feature(cc48) = f26
   id(cc49) = 8 feature(cc49) = f24
   id(cc50) = 8 feature(cc50) = f23
   id(cc51) = 8 feature(cc51) = f22
   id(cc52) = 8 feature(cc52) = f21
   id(cc53) = 9 feature(cc53) = f1
   id(cc54) = 9 feature(cc54) = f31
   id(cc55) = 9 feature(cc55) = f30
   id(cc56) = 9 feature(cc56) = f28
   id(cc57) = 9 feature(cc57) = f27
   id(cc58) = 9 feature(cc58) = f26
   id(cc59) = 9 feature(cc59) = f24
   id(cc60) = 9 feature(cc60) = f23
   id(cc61) = 9 feature(cc61) = f22
   id(cc62) = 9 feature(cc62) = f21
   id(cc63) = 9 feature(cc63) = f19
   id(cc64) = 10 feature(cc64) = f1
   id(cc65) = 10 feature(cc65) = f31
   id(cc66) = 10 feature(cc66) = f30
   id(cc67) = 10 feature(cc67) = f28
   id(cc68) = 10 feature(cc68) = f27
   id(cc69) = 10 feature(cc69) = f26
   id(cc70) = 10 feature(cc70) = f24
   id(cc71) = 10 feature(cc71) = f23
   id(cc72) = 10 feature(cc72) = f22
   id(cc73) = 10 feature(cc73) = f21
   id(cc74) = 10 feature(cc74) = f19
   id(cc75) = 10 feature(cc75) = f18
   id(cc76) = 11 feature(cc76) = f1
   id(cc77) = 11 feature(cc77) = f31
   id(cc78) = 11 feature(cc78) = f30
   id(cc79) = 11 feature(cc79) = f28
   id(cc80) = 11 feature(cc80) = f27
   id(cc81) = 11 feature(cc81) = f26
   id(cc82) = 11 feature(cc82) = f24
   id(cc83) = 11 feature(cc83) = f23
   id(cc84) = 11 feature(cc84) = f22
   id(cc85) = 11 feature(cc85) = f21
   id(cc86) = 11 feature(cc86) = f19
   id(cc87) = 11 feature(cc87) = f18
   id(cc88) = 11 feature(cc88) = f17
   id(cc89) = 12 feature(cc89) = f1
   id(cc90) = 12 feature(cc90) = f31
   id(cc91) = 12 feature(cc91) = f30
   id(cc92) = 12 feature(cc92) = f28
   id(cc93) = 12 feature(cc93) = f27
   id(cc94) = 12 feature(cc94) = f26
   id(cc95) = 12 feature(cc95) = f24
   id(cc96) = 12 feature(cc96) = f23
   id(cc97) = 12 feature(cc97) = f22
   id(cc98) = 12 feature(cc98) = f21
   id(cc99) = 12 feature(cc99) = f19
   id(cc100) = 12 feature(cc100) = f18
   id(cc101) = 12 feature(cc101) = f17
   id(cc102) = 12 feature(cc102) = f16
   id(cc103) = 13 feature(cc103) = f1
   id(cc104) = 13 feature(cc104) = f31
   id(cc105) = 13 feature(cc105) = f30
   id(cc106) = 13 feature(cc106) = f28
   id(cc107) = 13 feature(cc107) = f27
   id(cc108) = 13 feature(cc108) = f26
   id(cc109) = 13 feature(cc109) = f24
   id(cc110) = 13 feature(cc110) = f23
   id(cc111) = 13 feature(cc111) = f22
   id(cc112) = 13 feature(cc112) = f21
   id(cc113) = 13 feature(cc113) = f19
   id(cc114) = 13 feature(cc114) = f18
   id(cc115) = 13 feature(cc115) = f17
   id(cc116) = 13 feature(cc116) = f16
   id(cc117) = 13 feature(cc117) = f15
   id(cc118) = 14 feature(cc118) = f1
   id(cc119) = 14 feature(cc119) = f31
   id(cc120) = 14 feature(cc120) = f30
   id(cc121) = 14 feature(cc121) = f28
   id(cc122) = 14 feature(cc122) = f27
   id(cc123) = 14 feature(cc123) = f26
   id(cc124) = 14 feature(cc124) = f24
   id(cc125) = 14 feature(cc125) = f23
   id(cc126) = 14 feature(cc126) = f22
   id(cc127) = 14 feature(cc127) = f21
   id(cc128) = 14 feature(cc128) = f19
   id(cc129) = 14 feature(cc129) = f18
   id(cc130) = 14 feature(cc130) = f17
   id(cc131) = 14 feature(cc131) = f16
   id(cc132) = 14 feature(cc132) = f15
   id(cc133) = 14 feature(cc133) = f13
   id(cc134) = 15 feature(cc134) = f1
   id(cc135) = 15 feature(cc135) = f31
   id(cc136) = 15 feature(cc136) = f30
   id(cc137) = 15 feature(cc137) = f28
   id(cc138) = 15 feature(cc138) = f27
   id(cc139) = 15 feature(cc139) = f26
   id(cc140) = 15 feature(cc140) = f24
   id(cc141) = 15 feature(cc141) = f23
   id(cc142) = 15 feature(cc142) = f22
   id(cc143) = 15 feature(cc143) = f21
   id(cc144) = 15 feature(cc144) = f19
   id(cc145) = 15 feature(cc145) = f18
   id(cc146) = 15 feature(cc146) = f17
   id(cc147) = 15 feature(cc147) = f16
   id(cc148) = 15 feature(cc148) = f15
   id(cc149) = 15 feature(cc149) = f13
   id(cc150) = 15 feature(cc150) = f12
   id(cc151) = 16 feature(cc151) = f1
   id(cc152) = 16 feature(cc152) = f31
   id(cc153) = 16 feature(cc153) = f30
   id(cc154) = 16 feature(cc154) = f28
   id(cc155) = 16 feature(cc155) = f27
   id(cc156) = 16 feature(cc156) = f26
   id(cc157) = 16 feature(cc157) = f24
   id(cc158) = 16 feature(cc158) = f23
   id(cc159) = 16 feature(cc159) = f22
   id(cc160) = 16 feature(cc160) = f21
   id(cc161) = 16 feature(cc161) = f19
   id(cc162) = 16 feature(cc162) = f18
   id(cc163) = 16 feature(cc163) = f17
   id(cc164) = 16 feature(cc164) = f16
   id(cc165) = 16 feature(cc165) = f15
   id(cc166) = 16 feature(cc166) = f13
   id(cc167) = 16 feature(cc167) = f12
   id(cc168) = 16 feature(cc168) = f11
   id(cc169) = 17 feature(cc169) = f1
   id(cc170) = 17 feature(cc170) = f31
   id(cc171) = 17 feature(cc171) = f30
   id(cc172) = 17 feature(cc172) = f28
   id(cc173) = 17 feature(cc173) = f27
   id(cc174) = 17 feature(cc174) = f26
   id(cc175) = 17 feature(cc175) = f24
   id(cc176) = 17 feature(cc176) = f23
   id(cc177) = 17 feature(cc177) = f22
   id(cc178) = 17 feature(cc178) = f21
   id(cc179) = 17 feature(cc179) = f19
   id(cc180) = 17 feature(cc180) = f18
   id(cc181) = 17 feature(cc181) = f17
   id(cc182) = 17 feature(cc182) = f16
   id(cc183) = 17 feature(cc183) = f15
   id(cc184) = 17 feature(cc184) = f13
   id(cc185) = 17 feature(cc185) = f12
   id(cc186) = 17 feature(cc186) = f11
   id(cc187) = 17 feature(cc187) = f10
   id(cc188) = 18 feature(cc188) = f1
   id(cc189) = 18 feature(cc189) = f31
   id(cc190) = 18 feature(cc190) = f30
   id(cc191) = 18 feature(cc191) = f28
   id(cc192) = 18 feature(cc192) = f27
   id(cc193) = 18 feature(cc193) = f26
   id(cc194) = 18 feature(cc194) = f24
   id(cc195) = 18 feature(cc195) = f23
   id(cc196) = 18 feature(cc196) = f22
   id(cc197) = 18 feature(cc197) = f21
   id(cc198) = 18 feature(cc198) = f19
   id(cc199) = 18 feature(cc199) = f18
   id(cc200) = 18 feature(cc200) = f17
   id(cc201) = 18 feature(cc201) = f16
   id(cc202) = 18 feature(cc202) = f15
   id(cc203) = 18 feature(cc203) = f13
   id(cc204) = 18 feature(cc204) = f12
   id(cc205) = 18 feature(cc205) = f11
   id(cc206) = 18 feature(cc206) = f10
   id(cc207) = 18 feature(cc207) = f9
   id(cc208) = 19 feature(cc208) = f1
   id(cc209) = 19 feature(cc209) = f31
   id(cc210) = 19 feature(cc210) = f30
   id(cc211) = 19 feature(cc211) = f28
   id(cc212) = 19 feature(cc212) = f27
   id(cc213) = 19 feature(cc213) = f26
   id(cc214) = 19 feature(cc214) = f24
   id(cc215) = 19 feature(cc215) = f23
   id(cc216) = 19 feature(cc216) = f22
   id(cc217) = 19 feature(cc217) = f21
   id(cc218) = 19 feature(cc218) = f19
   id(cc219) = 19 feature(cc219) = f18
   id(cc220) = 19 feature(cc220) = f17
   id(cc221) = 19 feature(cc221) = f16
   id(cc222) = 19 feature(cc222) = f15
   id(cc223) = 19 feature(cc223) = f13
   id(cc224) = 19 feature(cc224) = f12
   id(cc225) = 19 feature(cc225) = f11
   id(cc226) = 19 feature(cc226) = f10
   id(cc227) = 19 feature(cc227) = f9
   id(cc228) = 19 feature(cc228) = f7
   id(cc229) = 20 feature(cc229) = f1
   id(cc230) = 20 feature(cc230) = f31
   id(cc231) = 20 feature(cc231) = f30
   id(cc232) = 20 feature(cc232) = f28
   id(cc233) = 20 feature(cc233) = f27
   id(cc234) = 20 feature(cc234) = f26
   id(cc235) = 20 feature(cc235) = f24
   id(cc236) = 20 feature(cc236) = f23
   id(cc237) = 20 feature(cc237) = f22
   id(cc238) = 20 feature(cc238) = f21
   id(cc239) = 20 feature(cc239) = f19
   id(cc240) = 20 feature(cc240) = f18
   id(cc241) = 20 feature(cc241) = f17
   id(cc242) = 20 feature(cc242) = f16
   id(cc243) = 20 feature(cc243) = f15
   id(cc244) = 20 feature(cc244) = f13
   id(cc245) = 20 feature(cc245) = f12
   id(cc246) = 20 feature(cc246) = f11
   id(cc247) = 20 feature(cc247) = f10
   id(cc248) = 20 feature(cc248) = f9
   id(cc249) = 20 feature(cc249) = f7
   id(cc250) = 20 feature(cc250) = f6
   id(cc251) = 21 feature(cc251) = f1
   id(cc252) = 21 feature(cc252) = f31
   id(cc253) = 21 feature(cc253) = f30
   id(cc254) = 21 feature(cc254) = f28
   id(cc255) = 21 feature(cc255) = f27
   id(cc256) = 21 feature(cc256) = f26
   id(cc257) = 21 feature(cc257) = f24
   id(cc258) = 21 feature(cc258) = f23
   id(cc259) = 21 feature(cc259) = f22
   id(cc260) = 21 feature(cc260) = f21
   id(cc261) = 21 feature(cc261) = f19
   id(cc262) = 21 feature(cc262) = f18
   id(cc263) = 21 feature(cc263) = f17
   id(cc264) = 21 feature(cc264) = f16
   id(cc265) = 21 feature(cc265) = f15
   id(cc266) = 21 feature(cc266) = f13
   id(cc267) = 21 feature(cc267) = f12
   id(cc268) = 21 feature(cc268) = f11
   id(cc269) = 21 feature(cc269) = f10
   id(cc270) = 21 feature(cc270) = f9
   id(cc271) = 21 feature(cc271) = f7
   id(cc272) = 21 feature(cc272) = f6
   id(cc273) = 21 feature(cc273) = f5
   id(cc274) = 22 feature(cc274) = f1
   id(cc275) = 22 feature(cc275) = f31
   id(cc276) = 22 feature(cc276) = f30
   id(cc277) = 22 feature(cc277) = f28
   id(cc278) = 22 feature(cc278) = f27
   id(cc279) = 22 feature(cc279) = f26
   id(cc280) = 22 feature(cc280) = f24
   id(cc281) = 22 feature(cc281) = f23
   id(cc282) = 22 feature(cc282) = f22
   id(cc283) = 22 feature(cc283) = f21
   id(cc284) = 22 feature(cc284) = f19
   id(cc285) = 22 feature(cc285) = f18
   id(cc286) = 22 feature(cc286) = f17
   id(cc287) = 22 feature(cc287) = f16
   id(cc288) = 22 feature(cc288) = f15
   id(cc289) = 22 feature(cc289) = f13
   id(cc290) = 22 feature(cc290) = f12
   id(cc291) = 22 feature(cc291) = f11
   id(cc292) = 22 feature(cc292) = f10
   id(cc293) = 22 feature(cc293) = f9
   id(cc294) = 22 feature(cc294) = f7
   id(cc295) = 22 feature(cc295) = f6
   id(cc296) = 22 feature(cc296) = f5
   id(cc297) = 22 feature(cc297) = f4
   id(cc298) = 23 feature(cc298) = f1
   id(cc299) = 23 feature(cc299) = f31
   id(cc300) = 23 feature(cc300) = f30
   id(cc301) = 23 feature(cc301) = f28
   id(cc302) = 23 feature(cc302) = f27
   id(cc303) = 23 feature(cc303) = f26
   id(cc304) = 23 feature(cc304) = f24
   id(cc305) = 23 feature(cc305) = f23
   id(cc306) = 23 feature(cc306) = f22
   id(cc307) = 23 feature(cc307) = f21
   id(cc308) = 23 feature(cc308) = f19
   id(cc309) = 23 feature(cc309) = f18
   id(cc310) = 23 feature(cc310) = f17
   id(cc311) = 23 feature(cc311) = f16
   id(cc312) = 23 feature(cc312) = f15
   id(cc313) = 23 feature(cc313) = f13
   id(cc314) = 23 feature(cc314) = f12
   id(cc315) = 23 feature(cc315) = f11
   id(cc316) = 23 feature(cc316) = f10
   id(cc317) = 23 feature(cc317) = f9
   id(cc318) = 23 feature(cc318) = f7
   id(cc319) = 23 feature(cc319) = f6
   id(cc320) = 23 feature(cc320) = f5
   id(cc321) = 23 feature(cc321) = f4
   id(cc322) = 23 feature(cc322) = f3
   id(cc323) = 24 feature(cc323) = f1
   id(cc324) = 24 feature(cc324) = f31
   id(cc325) = 24 feature(cc325) = f30
   id(cc326) = 24 feature(cc326) = f28
   id(cc327) = 24 feature(cc327) = f27
   id(cc328) = 24 feature(cc328) = f26
   id(cc329) = 24 feature(cc329) = f24
   id(cc330) = 24 feature(cc330) = f23
   id(cc331) = 24 feature(cc331) = f22
   id(cc332) = 24 feature(cc332) = f21
   id(cc333) = 24 feature(cc333) = f19
   id(cc334) = 24 feature(cc334) = f18
   id(cc335) = 24 feature(cc335) = f17
   id(cc336) = 24 feature(cc336) = f16
   id(cc337) = 24 feature(cc337) = f15
   id(cc338) = 24 feature(cc338) = f13
   id(cc339) = 24 feature(cc339) = f12
   id(cc340) = 24 feature(cc340) = f11
   id(cc341) = 24 feature(cc341) = f10
   id(cc342) = 24 feature(cc342) = f9
   id(cc343) = 24 feature(cc343) = f7
   id(cc344) = 24 feature(cc344) = f6
   id(cc345) = 24 feature(cc345) = f5
   id(cc346) = 24 feature(cc346) = f4
   id(cc347) = 24 feature(cc347) = f3
   id(cc348) = 24 feature(cc348) = f2
   id(cc349) = 25 feature(cc349) = f1
   id(cc350) = 25 feature(cc350) = f31
   id(cc351) = 25 feature(cc351) = f30
   id(cc352) = 25 feature(cc352) = f29
   id(cc353) = 25 feature(cc353) = f28
   id(cc354) = 25 feature(cc354) = f27
   id(cc355) = 25 feature(cc355) = f26
   id(cc356) = 25 feature(cc356) = f24
   id(cc357) = 25 feature(cc357) = f23
   id(cc358) = 25 feature(cc358) = f22
   id(cc359) = 25 feature(cc359) = f21
   id(cc360) = 25 feature(cc360) = f19
   id(cc361) = 25 feature(cc361) = f18
   id(cc362) = 25 feature(cc362) = f17
   id(cc363) = 25 feature(cc363) = f16
   id(cc364) = 25 feature(cc364) = f15
   id(cc365) = 25 feature(cc365) = f13
   id(cc366) = 25 feature(cc366) = f12
   id(cc367) = 25 feature(cc367) = f11
   id(cc368) = 25 feature(cc368) = f10
   id(cc369) = 25 feature(cc369) = f9
   id(cc370) = 25 feature(cc370) = f7
   id(cc371) = 25 feature(cc371) = f6
   id(cc372) = 25 feature(cc372) = f5
   id(cc373) = 25 feature(cc373) = f4
   id(cc374) = 25 feature(cc374) = f3
   id(cc375) = 25 feature(cc375) = f2
   id(cc376) = 26 feature(cc376) = f1
   id(cc377) = 26 feature(cc377) = f31
   id(cc378) = 26 feature(cc378) = f30
   id(cc379) = 26 feature(cc379) = f29
   id(cc380) = 26 feature(cc380) = f27
   id(cc381) = 26 feature(cc381) = f26
   id(cc382) = 26 feature(cc382) = f24
   id(cc383) = 26 feature(cc383) = f23
   id(cc384) = 26 feature(cc384) = f22
   id(cc385) = 26 feature(cc385) = f21
   id(cc386) = 26 feature(cc386) = f19
   id(cc387) = 26 feature(cc387) = f18
   id(cc388) = 26 feature(cc388) = f17
   id(cc389) = 26 feature(cc389) = f16
   id(cc390) = 26 feature(cc390) = f15
   id(cc391) = 26 feature(cc391) = f13
   id(cc392) = 26 feature(cc392) = f12
   id(cc393) = 26 feature(cc393) = f11
   id(cc394) = 26 feature(cc394) = f10
   id(cc395) = 26 feature(cc395) = f9
   id(cc396) = 26 feature(cc396) = f7
   id(cc397) = 26 feature(cc397) = f6
   id(cc398) = 26 feature(cc398) = f5
   id(cc399) = 26 feature(cc399) = f4
   id(cc400) = 26 feature(cc400) = f3
   id(cc401) = 26 feature(cc401) = f2
   id(cc402) = 27 feature(cc402) = f1
   id(cc403) = 27 feature(cc403) = f31
   id(cc404) = 27 feature(cc404) = f30
   id(cc405) = 27 feature(cc405) = f29
   id(cc406) = 27 feature(cc406) = f27
   id(cc407) = 27 feature(cc407) = f26
   id(cc408) = 27 feature(cc408) = f24
   id(cc409) = 27 feature(cc409) = f23
   id(cc410) = 27 feature(cc410) = f22
   id(cc411) = 27 feature(cc411) = f21
   id(cc412) = 27 feature(cc412) = f19
   id(cc413) = 27 feature(cc413) = f18
   id(cc414) = 27 feature(cc414) = f17
   id(cc415) = 27 feature(cc415) = f16
   id(cc416) = 27 feature(cc416) = f15
   id(cc417) = 27 feature(cc417) = f13
   id(cc418) = 27 feature(cc418) = f11
   id(cc419) = 27 feature(cc419) = f10
   id(cc420) = 27 feature(cc420) = f9
   id(cc421) = 27 feature(cc421) = f7
   id(cc422) = 27 feature(cc422) = f6
   id(cc423) = 27 feature(cc423) = f5
   id(cc424) = 27 feature(cc424) = f4
   id(cc425) = 27 feature(cc425) = f3
   id(cc426) = 27 feature(cc426) = f2
   id(cc427) = 28 feature(cc427) = f1
   id(cc428) = 28 feature(cc428) = f31
   id(cc429) = 28 feature(cc429) = f30
   id(cc430) = 28 feature(cc430) = f29
   id(cc431) = 28 feature(cc431) = f27
   id(cc432) = 28 feature(cc432) = f26
   id(cc433) = 28 feature(cc433) = f24
   id(cc434) = 28 feature(cc434) = f23
   id(cc435) = 28 feature(cc435) = f22
   id(cc436) = 28 feature(cc436) = f21
   id(cc437) = 28 feature(cc437) = f19
   id(cc438) = 28 feature(cc438) = f18
   id(cc439) = 28 feature(cc439) = f17
   id(cc440) = 28 feature(cc440) = f16
   id(cc441) = 28 feature(cc441) = f15
   id(cc442) = 28 feature(cc442) = f13
   id(cc443) = 28 feature(cc443) = f10
   id(cc444) = 28 feature(cc444) = f9
   id(cc445) = 28 feature(cc445) = f7
   id(cc446) = 28 feature(cc446) = f6
   id(cc447) = 28 feature(cc447) = f5
   id(cc448) = 28 feature(cc448) = f4
   id(cc449) = 28 feature(cc449) = f3
   id(cc450) = 28 feature(cc450) = f2
   id(cc451) = 29 feature(cc451) = f1
   id(cc452) = 29 feature(cc452) = f31
   id(cc453) = 29 feature(cc453) = f30
   id(cc454) = 29 feature(cc454) = f29
   id(cc455) = 29 feature(cc455) = f27
   id(cc456) = 29 feature(cc456) = f26
   id(cc457) = 29 feature(cc457) = f24
   id(cc458) = 29 feature(cc458) = f23
   id(cc459) = 29 feature(cc459) = f22
   id(cc460) = 29 feature(cc460) = f21
   id(cc461) = 29 feature(cc461) = f19
   id(cc462) = 29 feature(cc462) = f18
   id(cc463) = 29 feature(cc463) = f17
   id(cc464) = 29 feature(cc464) = f16
   id(cc465) = 29 feature(cc465) = f15
   id(cc466) = 29 feature(cc466) = f13
   id(cc467) = 29 feature(cc467) = f9
   id(cc468) = 29 feature(cc468) = f7
   id(cc469) = 29 feature(cc469) = f6
   id(cc470) = 29 feature(cc470) = f5
   id(cc471) = 29 feature(cc471) = f4
   id(cc472) = 29 feature(cc472) = f3
   id(cc473) = 29 feature(cc473) = f2
   id(cc474) = 30 feature(cc474) = f1
   id(cc475) = 30 feature(cc475) = f31
   id(cc476) = 30 feature(cc476) = f30
   id(cc477) = 30 feature(cc477) = f29
   id(cc478) = 30 feature(cc478) = f27
   id(cc479) = 30 feature(cc479) = f26
   id(cc480) = 30 feature(cc480) = f24
   id(cc481) = 30 feature(cc481) = f23
   id(cc482) = 30 feature(cc482) = f22
   id(cc483) = 30 feature(cc483) = f21
   id(cc484) = 30 feature(cc484) = f19
   id(cc485) = 30 feature(cc485) = f18
   id(cc486) = 30 feature(cc486) = f17
   id(cc487) = 30 feature(cc487) = f16
   id(cc488) = 30 feature(cc488) = f15
   id(cc489) = 30 feature(cc489) = f13
   id(cc490) = 30 feature(cc490) = f7
   id(cc491) = 30 feature(cc491) = f6
   id(cc492) = 30 feature(cc492) = f5
   id(cc493) = 30 feature(cc493) = f4
   id(cc494) = 30 feature(cc494) = f3
   id(cc495) = 30 feature(cc495) = f2
   id(cc496) = 31 feature(cc496) = f1
   id(cc497) = 31 feature(cc497) = f31
   id(cc498) = 31 feature(cc498) = f30
   id(cc499) = 31 feature(cc499) = f29
   id(cc500) = 31 feature(cc500) = f27
   id(cc501) = 31 feature(cc501) = f26
   id(cc502) = 31 feature(cc502) = f24
   id(cc503) = 31 feature(cc503) = f23
   id(cc504) = 31 feature(cc504) = f22
   id(cc505) = 31 feature(cc505) = f21
   id(cc506) = 31 feature(cc506) = f19
   id(cc507) = 31 feature(cc507) = f18
   id(cc508) = 31 feature(cc508) = f17
   id(cc509) = 31 feature(cc509) = f16
   id(cc510) = 31 feature(cc510) = f15
   id(cc511) = 31 feature(cc511) = f13
   id(cc512) = 31 feature(cc512) = f6
   id(cc513) = 31 feature(cc513) = f5
   id(cc514) = 31 feature(cc514) = f4
   id(cc515) = 31 feature(cc515) = f3
   id(cc516) = 31 feature(cc516) = f2
   id(cc517) = 32 feature(cc517) = f1
   id(cc518) = 32 feature(cc518) = f31
   id(cc519) = 32 feature(cc519) = f30
   id(cc520) = 32 feature(cc520) = f29
   id(cc521) = 32 feature(cc521) = f27
   id(cc522) = 32 feature(cc522) = f26
   id(cc523) = 32 feature(cc523) = f24
   id(cc524) = 32 feature(cc524) = f23
   id(cc525) = 32 feature(cc525) = f22
   id(cc526) = 32 feature(cc526) = f21
   id(cc527) = 32 feature(cc527) = f19
   id(cc528) = 32 feature(cc528) = f18
   id(cc529) = 32 feature(cc529) = f17
   id(cc530) = 32 feature(cc530) = f16
   id(cc531) = 32 feature(cc531) = f15
   id(cc532) = 32 feature(cc532) = f13
   id(cc533) = 32 feature(cc533) = f5
   id(cc534) = 32 feature(cc534) = f4
   id(cc535) = 32 feature(cc535) = f3
   id(cc536) = 32 feature(cc536) = f2
   id(cc537) = 33 feature(cc537) = f1
   id(cc538) = 33 feature(cc538) = f31
   id(cc539) = 33 feature(cc539) = f30
   id(cc540) = 33 feature(cc540) = f29
   id(cc541) = 33 feature(cc541) = f27
   id(cc542) = 33 feature(cc542) = f26
   id(cc543) = 33 feature(cc543) = f24
   id(cc544) = 33 feature(cc544) = f23
   id(cc545) = 33 feature(cc545) = f22
   id(cc546) = 33 feature(cc546) = f21
   id(cc547) = 33 feature(cc547) = f19
   id(cc548) = 33 feature(cc548) = f18
   id(cc549) = 33 feature(cc549) = f17
   id(cc550) = 33 feature(cc550) = f16
   id(cc551) = 33 feature(cc551) = f15
   id(cc552) = 33 feature(cc552) = f13
   id(cc553) = 33 feature(cc553) = f4
   id(cc554) = 33 feature(cc554) = f3
   id(cc555) = 33 feature(cc555) = f2
   id(cc556) = 34 feature(cc556) = f1
   id(cc557) = 34 feature(cc557) = f31
   id(cc558) = 34 feature(cc558) = f30
   id(cc559) = 34 feature(cc559) = f29
   id(cc560) = 34 feature(cc560) = f27
   id(cc561) = 34 feature(cc561) = f26
   id(cc562) = 34 feature(cc562) = f24
   id(cc563) = 34 feature(cc563) = f23
   id(cc564) = 34 feature(cc564) = f22
   id(cc565) = 34 feature(cc565) = f21
   id(cc566) = 34 feature(cc566) = f19
   id(cc567) = 34 feature(cc567) = f18
   id(cc568) = 34 feature(cc568) = f17
   id(cc569) = 34 feature(cc569) = f16
   id(cc570) = 34 feature(cc570) = f15
   id(cc571) = 34 feature(cc571) = f13
   id(cc572) = 34 feature(cc572) = f3
   id(cc573) = 34 feature(cc573) = f2
   id(cc574) = 35 feature(cc574) = f1
   id(cc575) = 35 feature(cc575) = f31
   id(cc576) = 35 feature(cc576) = f30
   id(cc577) = 35 feature(cc577) = f29
   id(cc578) = 35 feature(cc578) = f27
   id(cc579) = 35 feature(cc579) = f26
   id(cc580) = 35 feature(cc580) = f24
   id(cc581) = 35 feature(cc581) = f23
   id(cc582) = 35 feature(cc582) = f22
   id(cc583) = 35 feature(cc583) = f21
   id(cc584) = 35 feature(cc584) = f19
   id(cc585) = 35 feature(cc585) = f18
   id(cc586) = 35 feature(cc586) = f17
   id(cc587) = 35 feature(cc587) = f16
   id(cc588) = 35 feature(cc588) = f15
   id(cc589) = 35 feature(cc589) = f13
   id(cc590) = 35 feature(cc590) = f2
   id(cc591) = 36 feature(cc591) = f1
   id(cc592) = 36 feature(cc592) = f31
   id(cc593) = 36 feature(cc593) = f30
   id(cc594) = 36 feature(cc594) = f27
   id(cc595) = 36 feature(cc595) = f26
   id(cc596) = 36 feature(cc596) = f24
   id(cc597) = 36 feature(cc597) = f23
   id(cc598) = 36 feature(cc598) = f22
   id(cc599) = 36 feature(cc599) = f21
   id(cc600) = 36 feature(cc600) = f19
   id(cc601) = 36 feature(cc601) = f18
   id(cc602) = 36 feature(cc602) = f17
   id(cc603) = 36 feature(cc603) = f16
   id(cc604) = 36 feature(cc604) = f15
   id(cc605) = 36 feature(cc605) = f13
   id(cc606) = 36 feature(cc606) = f2
   id(cc607) = 37 feature(cc607) = f1
   id(cc608) = 37 feature(cc608) = f31
   id(cc609) = 37 feature(cc609) = f30
   id(cc610) = 37 feature(cc610) = f27
   id(cc611) = 37 feature(cc611) = f26
   id(cc612) = 37 feature(cc612) = f24
   id(cc613) = 37 feature(cc613) = f23
   id(cc614) = 37 feature(cc614) = f22
   id(cc615) = 37 feature(cc615) = f21
   id(cc616) = 37 feature(cc616) = f19
   id(cc617) = 37 feature(cc617) = f18
   id(cc618) = 37 feature(cc618) = f17
   id(cc619) = 37 feature(cc619) = f16
   id(cc620) = 37 feature(cc620) = f15
   id(cc621) = 37 feature(cc621) = f13
   id(cc622) = 38 feature(cc622) = f1
   id(cc623) = 38 feature(cc623) = f31
   id(cc624) = 38 feature(cc624) = f30
   id(cc625) = 38 feature(cc625) = f27
   id(cc626) = 38 feature(cc626) = f26
   id(cc627) = 38 feature(cc627) = f24
   id(cc628) = 38 feature(cc628) = f23
   id(cc629) = 38 feature(cc629) = f22
   id(cc630) = 38 feature(cc630) = f21
   id(cc631) = 38 feature(cc631) = f19
   id(cc632) = 38 feature(cc632) = f18
   id(cc633) = 38 feature(cc633) = f17
   id(cc634) = 38 feature(cc634) = f16
   id(cc635) = 38 feature(cc635) = f15
   id(cc636) = 38 feature(cc636) = f13
   id(cc637) = 38 feature(cc637) = f12
   id(cc638) = 39 feature(cc638) = f1
   id(cc639) = 39 feature(cc639) = f31
   id(cc640) = 39 feature(cc640) = f30
   id(cc641) = 39 feature(cc641) = f27
   id(cc642) = 39 feature(cc642) = f26
   id(cc643) = 39 feature(cc643) = f24
   id(cc644) = 39 feature(cc644) = f23
   id(cc645) = 39 feature(cc645) = f22
   id(cc646) = 39 feature(cc646) = f21
   id(cc647) = 39 feature(cc647) = f19
   id(cc648) = 39 feature(cc648) = f18
   id(cc649) = 39 feature(cc649) = f17
   id(cc650) = 39 feature(cc650) = f16
   id(cc651) = 39 feature(cc651) = f15
   id(cc652) = 39 feature(cc652) = f13
   id(cc653) = 39 feature(cc653) = f11
   id(cc654) = 40 feature(cc654) = f1
   id(cc655) = 40 feature(cc655) = f31
   id(cc656) = 40 feature(cc656) = f30
   id(cc657) = 40 feature(cc657) = f27
   id(cc658) = 40 feature(cc658) = f26
   id(cc659) = 40 feature(cc659) = f24
   id(cc660) = 40 feature(cc660) = f23
   id(cc661) = 40 feature(cc661) = f22
   id(cc662) = 40 feature(cc662) = f21
   id(cc663) = 40 feature(cc663) = f19
   id(cc664) = 40 feature(cc664) = f18
   id(cc665) = 40 feature(cc665) = f17
   id(cc666) = 40 feature(cc666) = f16
   id(cc667) = 40 feature(cc667) = f15
   id(cc668) = 40 feature(cc668) = f13
   id(cc669) = 40 feature(cc669) = f10
   id(cc670) = 41 feature(cc670) = f1
   id(cc671) = 41 feature(cc671) = f31
   id(cc672) = 41 feature(cc672) = f30
   id(cc673) = 41 feature(cc673) = f27
   id(cc674) = 41 feature(cc674) = f26
   id(cc675) = 41 feature(cc675) = f24
   id(cc676) = 41 feature(cc676) = f23
   id(cc677) = 41 feature(cc677) = f22
   id(cc678) = 41 feature(cc678) = f21
   id(cc679) = 41 feature(cc679) = f19
   id(cc680) = 41 feature(cc680) = f18
   id(cc681) = 41 feature(cc681) = f17
   id(cc682) = 41 feature(cc682) = f16
   id(cc683) = 41 feature(cc683) = f15
   id(cc684) = 41 feature(cc684) = f13
   id(cc685) = 41 feature(cc685) = f9
   id(cc686) = 42 feature(cc686) = f1
   id(cc687) = 42 feature(cc687) = f31
   id(cc688) = 42 feature(cc688) = f30
   id(cc689) = 42 feature(cc689) = f27
   id(cc690) = 42 feature(cc690) = f26
   id(cc691) = 42 feature(cc691) = f24
   id(cc692) = 42 feature(cc692) = f23
   id(cc693) = 42 feature(cc693) = f22
   id(cc694) = 42 feature(cc694) = f21
   id(cc695) = 42 feature(cc695) = f19
   id(cc696) = 42 feature(cc696) = f18
   id(cc697) = 42 feature(cc697) = f17
   id(cc698) = 42 feature(cc698) = f16
   id(cc699) = 42 feature(cc699) = f15
   id(cc700) = 42 feature(cc700) = f13
   id(cc701) = 42 feature(cc701) = f7
   id(cc702) = 43 feature(cc702) = f1
   id(cc703) = 43 feature(cc703) = f31
   id(cc704) = 43 feature(cc704) = f30
   id(cc705) = 43 feature(cc705) = f27
   id(cc706) = 43 feature(cc706) = f26
   id(cc707) = 43 feature(cc707) = f24
   id(cc708) = 43 feature(cc708) = f23
   id(cc709) = 43 feature(cc709) = f22
   id(cc710) = 43 feature(cc710) = f21
   id(cc711) = 43 feature(cc711) = f19
   id(cc712) = 43 feature(cc712) = f18
   id(cc713) = 43 feature(cc713) = f17
   id(cc714) = 43 feature(cc714) = f16
   id(cc715) = 43 feature(cc715) = f15
   id(cc716) = 43 feature(cc716) = f13
   id(cc717) = 43 feature(cc717) = f6
   id(cc718) = 44 feature(cc718) = f1
   id(cc719) = 44 feature(cc719) = f31
   id(cc720) = 44 feature(cc720) = f30
   id(cc721) = 44 feature(cc721) = f27
   id(cc722) = 44 feature(cc722) = f26
   id(cc723) = 44 feature(cc723) = f24
   id(cc724) = 44 feature(cc724) = f23
   id(cc725) = 44 feature(cc725) = f22
   id(cc726) = 44 feature(cc726) = f21
   id(cc727) = 44 feature(cc727) = f19
   id(cc728) = 44 feature(cc728) = f18
   id(cc729) = 44 feature(cc729) = f17
   id(cc730) = 44 feature(cc730) = f16
   id(cc731) = 44 feature(cc731) = f15
   id(cc732) = 44 feature(cc732) = f13
   id(cc733) = 44 feature(cc733) = f5
   id(cc734) = 45 feature(cc734) = f1
   id(cc735) = 45 feature(cc735) = f31
   id(cc736) = 45 feature(cc736) = f30
   id(cc737) = 45 feature(cc737) = f27
   id(cc738) = 45 feature(cc738) = f26
   id(cc739) = 45 feature(cc739) = f24
   id(cc740) = 45 feature(cc740) = f23
   id(cc741) = 45 feature(cc741) = f22
   id(cc742) = 45 feature(cc742) = f21
   id(cc743) = 45 feature(cc743) = f19
   id(cc744) = 45 feature(cc744) = f18
   id(cc745) = 45 feature(cc745) = f17
   id(cc746) = 45 feature(cc746) = f16
   id(cc747) = 45 feature(cc747) = f15
   id(cc748) = 45 feature(cc748) = f13
   id(cc749) = 45 feature(cc749) = f4
   id(cc750) = 46 feature(cc750) = f1
   id(cc751) = 46 feature(cc751) = f31
   id(cc752) = 46 feature(cc752) = f30
   id(cc753) = 46 feature(cc753) = f27
   id(cc754) = 46 feature(cc754) = f26
   id(cc755) = 46 feature(cc755) = f24
   id(cc756) = 46 feature(cc756) = f23
   id(cc757) = 46 feature(cc757) = f22
   id(cc758) = 46 feature(cc758) = f21
   id(cc759) = 46 feature(cc759) = f19
   id(cc760) = 46 feature(cc760) = f18
   id(cc761) = 46 feature(cc761) = f17
   id(cc762) = 46 feature(cc762) = f16
   id(cc763) = 46 feature(cc763) = f15
   id(cc764) = 46 feature(cc764) = f13
   id(cc765) = 46 feature(cc765) = f3
   id(cc766) = 47 feature(cc766) = f1
   id(cc767) = 47 feature(cc767) = f31
   id(cc768) = 47 feature(cc768) = f30
   id(cc769) = 47 feature(cc769) = f29
   id(cc770) = 47 feature(cc770) = f27
   id(cc771) = 47 feature(cc771) = f26
   id(cc772) = 47 feature(cc772) = f24
   id(cc773) = 47 feature(cc773) = f23
   id(cc774) = 47 feature(cc774) = f22
   id(cc775) = 47 feature(cc775) = f21
   id(cc776) = 47 feature(cc776) = f19
   id(cc777) = 47 feature(cc777) = f18
   id(cc778) = 47 feature(cc778) = f17
   id(cc779) = 47 feature(cc779) = f16
   id(cc780) = 47 feature(cc780) = f15
   id(cc781) = 47 feature(cc781) = f13
   id(cc782) = 48 feature(cc782) = f1
   id(cc783) = 48 feature(cc783) = f31
   id(cc784) = 48 feature(cc784) = f30
   id(cc785) = 48 feature(cc785) = f27
   id(cc786) = 48 feature(cc786) = f26
   id(cc787) = 48 feature(cc787) = f24
   id(cc788) = 48 feature(cc788) = f23
   id(cc789) = 48 feature(cc789) = f22
   id(cc790) = 48 feature(cc790) = f21
   id(cc791) = 48 feature(cc791) = f19
   id(cc792) = 48 feature(cc792) = f18
   id(cc793) = 48 feature(cc793) = f17
   id(cc794) = 48 feature(cc794) = f16
   id(cc795) = 48 feature(cc795) = f15
   id(cc796) = 48 feature(cc796) = f2
   id(cc797) = 49 feature(cc797) = f1
   id(cc798) = 49 feature(cc798) = f31
   id(cc799) = 49 feature(cc799) = f30
   id(cc800) = 49 feature(cc800) = f29
   id(cc801) = 49 feature(cc801) = f27
   id(cc802) = 49 feature(cc802) = f26
   id(cc803) = 49 feature(cc803) = f24
   id(cc804) = 49 feature(cc804) = f23
   id(cc805) = 49 feature(cc805) = f22
   id(cc806) = 49 feature(cc806) = f21
   id(cc807) = 49 feature(cc807) = f19
   id(cc808) = 49 feature(cc808) = f18
   id(cc809) = 49 feature(cc809) = f17
   id(cc810) = 49 feature(cc810) = f16
   id(cc811) = 49 feature(cc811) = f15
   id(cc812) = 49 feature(cc812) = f2
   id(cc813) = 50 feature(cc813) = f1
   id(cc814) = 50 feature(cc814) = f31
   id(cc815) = 50 feature(cc815) = f30
   id(cc816) = 50 feature(cc816) = f29
   id(cc817) = 50 feature(cc817) = f28
   id(cc818) = 50 feature(cc818) = f27
   id(cc819) = 50 feature(cc819) = f26
   id(cc820) = 50 feature(cc820) = f24
   id(cc821) = 50 feature(cc821) = f23
   id(cc822) = 50 feature(cc822) = f22
   id(cc823) = 50 feature(cc823) = f21
   id(cc824) = 50 feature(cc824) = f19
   id(cc825) = 50 feature(cc825) = f18
   id(cc826) = 50 feature(cc826) = f17
   id(cc827) = 50 feature(cc827) = f16
   id(cc828) = 50 feature(cc828) = f15
   id(cc829) = 50 feature(cc829) = f2
   id(cc830) = 51 feature(cc830) = f1
   id(cc831) = 51 feature(cc831) = f31
   id(cc832) = 51 feature(cc832) = f30
   id(cc833) = 51 feature(cc833) = f29
   id(cc834) = 51 feature(cc834) = f28
   id(cc835) = 51 feature(cc835) = f27
   id(cc836) = 51 feature(cc836) = f26
   id(cc837) = 51 feature(cc837) = f24
   id(cc838) = 51 feature(cc838) = f23
   id(cc839) = 51 feature(cc839) = f22
   id(cc840) = 51 feature(cc840) = f21
   id(cc841) = 51 feature(cc841) = f19
   id(cc842) = 51 feature(cc842) = f18
   id(cc843) = 51 feature(cc843) = f17
   id(cc844) = 51 feature(cc844) = f16
   id(cc845) = 51 feature(cc845) = f15
   id(cc846) = 51 feature(cc846) = f12
   id(cc847) = 51 feature(cc847) = f2
   id(cc848) = 52 feature(cc848) = f1
   id(cc849) = 52 feature(cc849) = f31
   id(cc850) = 52 feature(cc850) = f30
   id(cc851) = 52 feature(cc851) = f29
   id(cc852) = 52 feature(cc852) = f28
   id(cc853) = 52 feature(cc853) = f27
   id(cc854) = 52 feature(cc854) = f26
   id(cc855) = 52 feature(cc855) = f24
   id(cc856) = 52 feature(cc856) = f23
   id(cc857) = 52 feature(cc857) = f22
   id(cc858) = 52 feature(cc858) = f21
   id(cc859) = 52 feature(cc859) = f19
   id(cc860) = 52 feature(cc860) = f18
   id(cc861) = 52 feature(cc861) = f17
   id(cc862) = 52 feature(cc862) = f16
   id(cc863) = 52 feature(cc863) = f15
   id(cc864) = 52 feature(cc864) = f12
   id(cc865) = 52 feature(cc865) = f11
   id(cc866) = 52 feature(cc866) = f2
   id(cc867) = 53 feature(cc867) = f1
   id(cc868) = 53 feature(cc868) = f31
   id(cc869) = 53 feature(cc869) = f30
   id(cc870) = 53 feature(cc870) = f29
   id(cc871) = 53 feature(cc871) = f28
   id(cc872) = 53 feature(cc872) = f27
   id(cc873) = 53 feature(cc873) = f26
   id(cc874) = 53 feature(cc874) = f24
   id(cc875) = 53 feature(cc875) = f23
   id(cc876) = 53 feature(cc876) = f22
   id(cc877) = 53 feature(cc877) = f21
   id(cc878) = 53 feature(cc878) = f19
   id(cc879) = 53 feature(cc879) = f18
   id(cc880) = 53 feature(cc880) = f17
   id(cc881) = 53 feature(cc881) = f16
   id(cc882) = 53 feature(cc882) = f15
   id(cc883) = 53 feature(cc883) = f12
   id(cc884) = 53 feature(cc884) = f11
   id(cc885) = 53 feature(cc885) = f10
   id(cc886) = 53 feature(cc886) = f2
   id(cc887) = 54 feature(cc887) = f1
   id(cc888) = 54 feature(cc888) = f31
   id(cc889) = 54 feature(cc889) = f30
   id(cc890) = 54 feature(cc890) = f29
   id(cc891) = 54 feature(cc891) = f28
   id(cc892) = 54 feature(cc892) = f27
   id(cc893) = 54 feature(cc893) = f26
   id(cc894) = 54 feature(cc894) = f24
   id(cc895) = 54 feature(cc895) = f23
   id(cc896) = 54 feature(cc896) = f22
   id(cc897) = 54 feature(cc897) = f21
   id(cc898) = 54 feature(cc898) = f19
   id(cc899) = 54 feature(cc899) = f18
   id(cc900) = 54 feature(cc900) = f17
   id(cc901) = 54 feature(cc901) = f16
   id(cc902) = 54 feature(cc902) = f15
   id(cc903) = 54 feature(cc903) = f12
   id(cc904) = 54 feature(cc904) = f11
   id(cc905) = 54 feature(cc905) = f10
   id(cc906) = 54 feature(cc906) = f9
   id(cc907) = 54 feature(cc907) = f2
   id(cc908) = 55 feature(cc908) = f1
   id(cc909) = 55 feature(cc909) = f31
   id(cc910) = 55 feature(cc910) = f30
   id(cc911) = 55 feature(cc911) = f29
   id(cc912) = 55 feature(cc912) = f28
   id(cc913) = 55 feature(cc913) = f27
   id(cc914) = 55 feature(cc914) = f26
   id(cc915) = 55 feature(cc915) = f24
   id(cc916) = 55 feature(cc916) = f23
   id(cc917) = 55 feature(cc917) = f22
   id(cc918) = 55 feature(cc918) = f21
   id(cc919) = 55 feature(cc919) = f19
   id(cc920) = 55 feature(cc920) = f18
   id(cc921) = 55 feature(cc921) = f17
   id(cc922) = 55 feature(cc922) = f16
   id(cc923) = 55 feature(cc923) = f15
   id(cc924) = 55 feature(cc924) = f12
   id(cc925) = 55 feature(cc925) = f11
   id(cc926) = 55 feature(cc926) = f10
   id(cc927) = 55 feature(cc927) = f9
   id(cc928) = 55 feature(cc928) = f7
   id(cc929) = 55 feature(cc929) = f2
   id(cc930) = 56 feature(cc930) = f1
   id(cc931) = 56 feature(cc931) = f31
   id(cc932) = 56 feature(cc932) = f30
   id(cc933) = 56 feature(cc933) = f29
   id(cc934) = 56 feature(cc934) = f28
   id(cc935) = 56 feature(cc935) = f27
   id(cc936) = 56 feature(cc936) = f26
   id(cc937) = 56 feature(cc937) = f24
   id(cc938) = 56 feature(cc938) = f23
   id(cc939) = 56 feature(cc939) = f22
   id(cc940) = 56 feature(cc940) = f21
   id(cc941) = 56 feature(cc941) = f19
   id(cc942) = 56 feature(cc942) = f18
   id(cc943) = 56 feature(cc943) = f17
   id(cc944) = 56 feature(cc944) = f16
   id(cc945) = 56 feature(cc945) = f15
   id(cc946) = 56 feature(cc946) = f12
   id(cc947) = 56 feature(cc947) = f11
   id(cc948) = 56 feature(cc948) = f10
   id(cc949) = 56 feature(cc949) = f9
   id(cc950) = 56 feature(cc950) = f7
   id(cc951) = 56 feature(cc951) = f6
   id(cc952) = 56 feature(cc952) = f2
   id(cc953) = 57 feature(cc953) = f1
   id(cc954) = 57 feature(cc954) = f31
   id(cc955) = 57 feature(cc955) = f30
   id(cc956) = 57 feature(cc956) = f29
   id(cc957) = 57 feature(cc957) = f28
   id(cc958) = 57 feature(cc958) = f27
   id(cc959) = 57 feature(cc959) = f26
   id(cc960) = 57 feature(cc960) = f24
   id(cc961) = 57 feature(cc961) = f23
   id(cc962) = 57 feature(cc962) = f22
   id(cc963) = 57 feature(cc963) = f21
   id(cc964) = 57 feature(cc964) = f19
   id(cc965) = 57 feature(cc965) = f18
   id(cc966) = 57 feature(cc966) = f17
   id(cc967) = 57 feature(cc967) = f16
   id(cc968) = 57 feature(cc968) = f15
   id(cc969) = 57 feature(cc969) = f12
   id(cc970) = 57 feature(cc970) = f11
   id(cc971) = 57 feature(cc971) = f10
   id(cc972) = 57 feature(cc972) = f9
   id(cc973) = 57 feature(cc973) = f7
   id(cc974) = 57 feature(cc974) = f6
   id(cc975) = 57 feature(cc975) = f5
   id(cc976) = 57 feature(cc976) = f2
   id(cc977) = 58 feature(cc977) = f1
   id(cc978) = 58 feature(cc978) = f31
   id(cc979) = 58 feature(cc979) = f30
   id(cc980) = 58 feature(cc980) = f29
   id(cc981) = 58 feature(cc981) = f28
   id(cc982) = 58 feature(cc982) = f27
   id(cc983) = 58 feature(cc983) = f26
   id(cc984) = 58 feature(cc984) = f24
   id(cc985) = 58 feature(cc985) = f23
   id(cc986) = 58 feature(cc986) = f22
   id(cc987) = 58 feature(cc987) = f21
   id(cc988) = 58 feature(cc988) = f19
   id(cc989) = 58 feature(cc989) = f18
   id(cc990) = 58 feature(cc990) = f17
   id(cc991) = 58 feature(cc991) = f16
   id(cc992) = 58 feature(cc992) = f15
   id(cc993) = 58 feature(cc993) = f12
   id(cc994) = 58 feature(cc994) = f11
   id(cc995) = 58 feature(cc995) = f10
   id(cc996) = 58 feature(cc996) = f9
   id(cc997) = 58 feature(cc997) = f7
   id(cc998) = 58 feature(cc998) = f6
   id(cc999) = 58 feature(cc999) = f5
   id(cc1000) = 58 feature(cc1000) = f4
   id(cc1001) = 58 feature(cc1001) = f2
   id(cc1002) = 59 feature(cc1002) = f1
   id(cc1003) = 59 feature(cc1003) = f31
   id(cc1004) = 59 feature(cc1004) = f30
   id(cc1005) = 59 feature(cc1005) = f29
   id(cc1006) = 59 feature(cc1006) = f28
   id(cc1007) = 59 feature(cc1007) = f27
   id(cc1008) = 59 feature(cc1008) = f26
   id(cc1009) = 59 feature(cc1009) = f24
   id(cc1010) = 59 feature(cc1010) = f23
   id(cc1011) = 59 feature(cc1011) = f22
   id(cc1012) = 59 feature(cc1012) = f21
   id(cc1013) = 59 feature(cc1013) = f19
   id(cc1014) = 59 feature(cc1014) = f18
   id(cc1015) = 59 feature(cc1015) = f17
   id(cc1016) = 59 feature(cc1016) = f16
   id(cc1017) = 59 feature(cc1017) = f15
   id(cc1018) = 59 feature(cc1018) = f12
   id(cc1019) = 59 feature(cc1019) = f11
   id(cc1020) = 59 feature(cc1020) = f10
   id(cc1021) = 59 feature(cc1021) = f9
   id(cc1022) = 59 feature(cc1022) = f7
   id(cc1023) = 59 feature(cc1023) = f6
   id(cc1024) = 59 feature(cc1024) = f5
   id(cc1025) = 59 feature(cc1025) = f4
   id(cc1026) = 59 feature(cc1026) = f3
   id(cc1027) = 59 feature(cc1027) = f2
   id(cc1028) = 60 feature(cc1028) = f1
   id(cc1029) = 60 feature(cc1029) = f31
   id(cc1030) = 60 feature(cc1030) = f30
   id(cc1031) = 60 feature(cc1031) = f29
   id(cc1032) = 60 feature(cc1032) = f28
   id(cc1033) = 60 feature(cc1033) = f27
   id(cc1034) = 60 feature(cc1034) = f26
   id(cc1035) = 60 feature(cc1035) = f24
   id(cc1036) = 60 feature(cc1036) = f23
   id(cc1037) = 60 feature(cc1037) = f22
   id(cc1038) = 60 feature(cc1038) = f21
   id(cc1039) = 60 feature(cc1039) = f19
   id(cc1040) = 60 feature(cc1040) = f18
   id(cc1041) = 60 feature(cc1041) = f17
   id(cc1042) = 60 feature(cc1042) = f16
   id(cc1043) = 60 feature(cc1043) = f15
   id(cc1044) = 60 feature(cc1044) = f12
   id(cc1045) = 60 feature(cc1045) = f11
   id(cc1046) = 60 feature(cc1046) = f10
   id(cc1047) = 60 feature(cc1047) = f9
   id(cc1048) = 60 feature(cc1048) = f7
   id(cc1049) = 60 feature(cc1049) = f6
   id(cc1050) = 60 feature(cc1050) = f5
   id(cc1051) = 60 feature(cc1051) = f4
   id(cc1052) = 60 feature(cc1052) = f3
   id(cc1053) = 61 feature(cc1053) = f1
   id(cc1054) = 61 feature(cc1054) = f31
   id(cc1055) = 61 feature(cc1055) = f30
   id(cc1056) = 61 feature(cc1056) = f28
   id(cc1057) = 61 feature(cc1057) = f27
   id(cc1058) = 61 feature(cc1058) = f26
   id(cc1059) = 61 feature(cc1059) = f24
   id(cc1060) = 61 feature(cc1060) = f23
   id(cc1061) = 61 feature(cc1061) = f22
   id(cc1062) = 61 feature(cc1062) = f21
   id(cc1063) = 61 feature(cc1063) = f19
   id(cc1064) = 61 feature(cc1064) = f18
   id(cc1065) = 61 feature(cc1065) = f17
   id(cc1066) = 61 feature(cc1066) = f16
   id(cc1067) = 61 feature(cc1067) = f15
   id(cc1068) = 61 feature(cc1068) = f12
   id(cc1069) = 61 feature(cc1069) = f11
   id(cc1070) = 61 feature(cc1070) = f10
   id(cc1071) = 61 feature(cc1071) = f9
   id(cc1072) = 61 feature(cc1072) = f7
   id(cc1073) = 61 feature(cc1073) = f6
   id(cc1074) = 61 feature(cc1074) = f5
   id(cc1075) = 61 feature(cc1075) = f4
   id(cc1076) = 61 feature(cc1076) = f3
   id(cc1077) = 62 feature(cc1077) = f1
   id(cc1078) = 62 feature(cc1078) = f31
   id(cc1079) = 62 feature(cc1079) = f30
   id(cc1080) = 62 feature(cc1080) = f27
   id(cc1081) = 62 feature(cc1081) = f26
   id(cc1082) = 62 feature(cc1082) = f24
   id(cc1083) = 62 feature(cc1083) = f23
   id(cc1084) = 62 feature(cc1084) = f22
   id(cc1085) = 62 feature(cc1085) = f21
   id(cc1086) = 62 feature(cc1086) = f19
   id(cc1087) = 62 feature(cc1087) = f18
   id(cc1088) = 62 feature(cc1088) = f17
   id(cc1089) = 62 feature(cc1089) = f16
   id(cc1090) = 62 feature(cc1090) = f15
   id(cc1091) = 62 feature(cc1091) = f12
   id(cc1092) = 62 feature(cc1092) = f11
   id(cc1093) = 62 feature(cc1093) = f10
   id(cc1094) = 62 feature(cc1094) = f9
   id(cc1095) = 62 feature(cc1095) = f7
   id(cc1096) = 62 feature(cc1096) = f6
   id(cc1097) = 62 feature(cc1097) = f5
   id(cc1098) = 62 feature(cc1098) = f4
   id(cc1099) = 62 feature(cc1099) = f3
   id(cc1100) = 63 feature(cc1100) = f1
   id(cc1101) = 63 feature(cc1101) = f31
   id(cc1102) = 63 feature(cc1102) = f30
   id(cc1103) = 63 feature(cc1103) = f27
   id(cc1104) = 63 feature(cc1104) = f26
   id(cc1105) = 63 feature(cc1105) = f24
   id(cc1106) = 63 feature(cc1106) = f23
   id(cc1107) = 63 feature(cc1107) = f22
   id(cc1108) = 63 feature(cc1108) = f21
   id(cc1109) = 63 feature(cc1109) = f19
   id(cc1110) = 63 feature(cc1110) = f18
   id(cc1111) = 63 feature(cc1111) = f17
   id(cc1112) = 63 feature(cc1112) = f16
   id(cc1113) = 63 feature(cc1113) = f15
   id(cc1114) = 63 feature(cc1114) = f11
   id(cc1115) = 63 feature(cc1115) = f10
   id(cc1116) = 63 feature(cc1116) = f9
   id(cc1117) = 63 feature(cc1117) = f7
   id(cc1118) = 63 feature(cc1118) = f6
   id(cc1119) = 63 feature(cc1119) = f5
   id(cc1120) = 63 feature(cc1120) = f4
   id(cc1121) = 63 feature(cc1121) = f3
   id(cc1122) = 64 feature(cc1122) = f1
   id(cc1123) = 64 feature(cc1123) = f31
   id(cc1124) = 64 feature(cc1124) = f30
   id(cc1125) = 64 feature(cc1125) = f27
   id(cc1126) = 64 feature(cc1126) = f26
   id(cc1127) = 64 feature(cc1127) = f24
   id(cc1128) = 64 feature(cc1128) = f23
   id(cc1129) = 64 feature(cc1129) = f22
   id(cc1130) = 64 feature(cc1130) = f21
   id(cc1131) = 64 feature(cc1131) = f19
   id(cc1132) = 64 feature(cc1132) = f18
   id(cc1133) = 64 feature(cc1133) = f17
   id(cc1134) = 64 feature(cc1134) = f16
   id(cc1135) = 64 feature(cc1135) = f15
   id(cc1136) = 64 feature(cc1136) = f10
   id(cc1137) = 64 feature(cc1137) = f9
   id(cc1138) = 64 feature(cc1138) = f7
   id(cc1139) = 64 feature(cc1139) = f6
   id(cc1140) = 64 feature(cc1140) = f5
   id(cc1141) = 64 feature(cc1141) = f4
   id(cc1142) = 64 feature(cc1142) = f3
   id(cc1143) = 65 feature(cc1143) = f1
   id(cc1144) = 65 feature(cc1144) = f31
   id(cc1145) = 65 feature(cc1145) = f30
   id(cc1146) = 65 feature(cc1146) = f27
   id(cc1147) = 65 feature(cc1147) = f26
   id(cc1148) = 65 feature(cc1148) = f24
   id(cc1149) = 65 feature(cc1149) = f23
   id(cc1150) = 65 feature(cc1150) = f22
   id(cc1151) = 65 feature(cc1151) = f21
   id(cc1152) = 65 feature(cc1152) = f19
   id(cc1153) = 65 feature(cc1153) = f18
   id(cc1154) = 65 feature(cc1154) = f17
   id(cc1155) = 65 feature(cc1155) = f16
   id(cc1156) = 65 feature(cc1156) = f15
   id(cc1157) = 65 feature(cc1157) = f9
   id(cc1158) = 65 feature(cc1158) = f7
   id(cc1159) = 65 feature(cc1159) = f6
   id(cc1160) = 65 feature(cc1160) = f5
   id(cc1161) = 65 feature(cc1161) = f4
   id(cc1162) = 65 feature(cc1162) = f3
   id(cc1163) = 66 feature(cc1163) = f1
   id(cc1164) = 66 feature(cc1164) = f31
   id(cc1165) = 66 feature(cc1165) = f30
   id(cc1166) = 66 feature(cc1166) = f27
   id(cc1167) = 66 feature(cc1167) = f26
   id(cc1168) = 66 feature(cc1168) = f24
   id(cc1169) = 66 feature(cc1169) = f23
   id(cc1170) = 66 feature(cc1170) = f22
   id(cc1171) = 66 feature(cc1171) = f21
   id(cc1172) = 66 feature(cc1172) = f19
   id(cc1173) = 66 feature(cc1173) = f18
   id(cc1174) = 66 feature(cc1174) = f17
   id(cc1175) = 66 feature(cc1175) = f16
   id(cc1176) = 66 feature(cc1176) = f15
   id(cc1177) = 66 feature(cc1177) = f7
   id(cc1178) = 66 feature(cc1178) = f6
   id(cc1179) = 66 feature(cc1179) = f5
   id(cc1180) = 66 feature(cc1180) = f4
   id(cc1181) = 66 feature(cc1181) = f3
   id(cc1182) = 67 feature(cc1182) = f1
   id(cc1183) = 67 feature(cc1183) = f31
   id(cc1184) = 67 feature(cc1184) = f30
   id(cc1185) = 67 feature(cc1185) = f27
   id(cc1186) = 67 feature(cc1186) = f26
   id(cc1187) = 67 feature(cc1187) = f24
   id(cc1188) = 67 feature(cc1188) = f23
   id(cc1189) = 67 feature(cc1189) = f22
   id(cc1190) = 67 feature(cc1190) = f21
   id(cc1191) = 67 feature(cc1191) = f19
   id(cc1192) = 67 feature(cc1192) = f18
   id(cc1193) = 67 feature(cc1193) = f17
   id(cc1194) = 67 feature(cc1194) = f16
   id(cc1195) = 67 feature(cc1195) = f15
   id(cc1196) = 67 feature(cc1196) = f6
   id(cc1197) = 67 feature(cc1197) = f5
   id(cc1198) = 67 feature(cc1198) = f4
   id(cc1199) = 67 feature(cc1199) = f3
   id(cc1200) = 68 feature(cc1200) = f1
   id(cc1201) = 68 feature(cc1201) = f31
   id(cc1202) = 68 feature(cc1202) = f30
   id(cc1203) = 68 feature(cc1203) = f27
   id(cc1204) = 68 feature(cc1204) = f26
   id(cc1205) = 68 feature(cc1205) = f24
   id(cc1206) = 68 feature(cc1206) = f23
   id(cc1207) = 68 feature(cc1207) = f22
   id(cc1208) = 68 feature(cc1208) = f21
   id(cc1209) = 68 feature(cc1209) = f19
   id(cc1210) = 68 feature(cc1210) = f18
   id(cc1211) = 68 feature(cc1211) = f17
   id(cc1212) = 68 feature(cc1212) = f16
   id(cc1213) = 68 feature(cc1213) = f15
   id(cc1214) = 68 feature(cc1214) = f5
   id(cc1215) = 68 feature(cc1215) = f4
   id(cc1216) = 68 feature(cc1216) = f3
   id(cc1217) = 69 feature(cc1217) = f1
   id(cc1218) = 69 feature(cc1218) = f31
   id(cc1219) = 69 feature(cc1219) = f30
   id(cc1220) = 69 feature(cc1220) = f27
   id(cc1221) = 69 feature(cc1221) = f26
   id(cc1222) = 69 feature(cc1222) = f24
   id(cc1223) = 69 feature(cc1223) = f23
   id(cc1224) = 69 feature(cc1224) = f22
   id(cc1225) = 69 feature(cc1225) = f21
   id(cc1226) = 69 feature(cc1226) = f19
   id(cc1227) = 69 feature(cc1227) = f18
   id(cc1228) = 69 feature(cc1228) = f17
   id(cc1229) = 69 feature(cc1229) = f16
   id(cc1230) = 69 feature(cc1230) = f15
   id(cc1231) = 69 feature(cc1231) = f4
   id(cc1232) = 69 feature(cc1232) = f3
   id(cc1233) = 70 feature(cc1233) = f1
   id(cc1234) = 70 feature(cc1234) = f31
   id(cc1235) = 70 feature(cc1235) = f30
   id(cc1236) = 70 feature(cc1236) = f27
   id(cc1237) = 70 feature(cc1237) = f26
   id(cc1238) = 70 feature(cc1238) = f24
   id(cc1239) = 70 feature(cc1239) = f23
   id(cc1240) = 70 feature(cc1240) = f22
   id(cc1241) = 70 feature(cc1241) = f21
   id(cc1242) = 70 feature(cc1242) = f19
   id(cc1243) = 70 feature(cc1243) = f18
   id(cc1244) = 70 feature(cc1244) = f17
   id(cc1245) = 70 feature(cc1245) = f16
   id(cc1246) = 70 feature(cc1246) = f15
   id(cc1247) = 70 feature(cc1247) = f3
   id(cc1248) = 71 feature(cc1248) = f1
   id(cc1249) = 71 feature(cc1249) = f31
   id(cc1250) = 71 feature(cc1250) = f30
   id(cc1251) = 71 feature(cc1251) = f27
   id(cc1252) = 71 feature(cc1252) = f26
   id(cc1253) = 71 feature(cc1253) = f24
   id(cc1254) = 71 feature(cc1254) = f23
   id(cc1255) = 71 feature(cc1255) = f22
   id(cc1256) = 71 feature(cc1256) = f21
   id(cc1257) = 71 feature(cc1257) = f19
   id(cc1258) = 71 feature(cc1258) = f18
   id(cc1259) = 71 feature(cc1259) = f17
   id(cc1260) = 71 feature(cc1260) = f16
   id(cc1261) = 71 feature(cc1261) = f15
   id(cc1262) = 72 feature(cc1262) = f1
   id(cc1263) = 72 feature(cc1263) = f31
   id(cc1264) = 72 feature(cc1264) = f30
   id(cc1265) = 72 feature(cc1265) = f29
   id(cc1266) = 72 feature(cc1266) = f27
   id(cc1267) = 72 feature(cc1267) = f26
   id(cc1268) = 72 feature(cc1268) = f24
   id(cc1269) = 72 feature(cc1269) = f23
   id(cc1270) = 72 feature(cc1270) = f22
   id(cc1271) = 72 feature(cc1271) = f21
   id(cc1272) = 72 feature(cc1272) = f19
   id(cc1273) = 72 feature(cc1273) = f18
   id(cc1274) = 72 feature(cc1274) = f17
   id(cc1275) = 72 feature(cc1275) = f16
   id(cc1276) = 72 feature(cc1276) = f15
   id(cc1277) = 73 feature(cc1277) = f1
   id(cc1278) = 73 feature(cc1278) = f31
   id(cc1279) = 73 feature(cc1279) = f30
   id(cc1280) = 73 feature(cc1280) = f29
   id(cc1281) = 73 feature(cc1281) = f28
   id(cc1282) = 73 feature(cc1282) = f27
   id(cc1283) = 73 feature(cc1283) = f26
   id(cc1284) = 73 feature(cc1284) = f24
   id(cc1285) = 73 feature(cc1285) = f23
   id(cc1286) = 73 feature(cc1286) = f22
   id(cc1287) = 73 feature(cc1287) = f21
   id(cc1288) = 73 feature(cc1288) = f19
   id(cc1289) = 73 feature(cc1289) = f18
   id(cc1290) = 73 feature(cc1290) = f17
   id(cc1291) = 73 feature(cc1291) = f16
   id(cc1292) = 73 feature(cc1292) = f15
   id(cc1293) = 74 feature(cc1293) = f1
   id(cc1294) = 74 feature(cc1294) = f31
   id(cc1295) = 74 feature(cc1295) = f30
   id(cc1296) = 74 feature(cc1296) = f29
   id(cc1297) = 74 feature(cc1297) = f28
   id(cc1298) = 74 feature(cc1298) = f27
   id(cc1299) = 74 feature(cc1299) = f26
   id(cc1300) = 74 feature(cc1300) = f24
   id(cc1301) = 74 feature(cc1301) = f23
   id(cc1302) = 74 feature(cc1302) = f22
   id(cc1303) = 74 feature(cc1303) = f21
   id(cc1304) = 74 feature(cc1304) = f19
   id(cc1305) = 74 feature(cc1305) = f18
   id(cc1306) = 74 feature(cc1306) = f17
   id(cc1307) = 74 feature(cc1307) = f16
   id(cc1308) = 74 feature(cc1308) = f15
   id(cc1309) = 74 feature(cc1309) = f12
   id(cc1310) = 75 feature(cc1310) = f1
   id(cc1311) = 75 feature(cc1311) = f31
   id(cc1312) = 75 feature(cc1312) = f30
   id(cc1313) = 75 feature(cc1313) = f29
   id(cc1314) = 75 feature(cc1314) = f28
   id(cc1315) = 75 feature(cc1315) = f27
   id(cc1316) = 75 feature(cc1316) = f26
   id(cc1317) = 75 feature(cc1317) = f24
   id(cc1318) = 75 feature(cc1318) = f23
   id(cc1319) = 75 feature(cc1319) = f22
   id(cc1320) = 75 feature(cc1320) = f21
   id(cc1321) = 75 feature(cc1321) = f19
   id(cc1322) = 75 feature(cc1322) = f18
   id(cc1323) = 75 feature(cc1323) = f17
   id(cc1324) = 75 feature(cc1324) = f16
   id(cc1325) = 75 feature(cc1325) = f15
   id(cc1326) = 75 feature(cc1326) = f11
   id(cc1327) = 76 feature(cc1327) = f1
   id(cc1328) = 76 feature(cc1328) = f31
   id(cc1329) = 76 feature(cc1329) = f30
   id(cc1330) = 76 feature(cc1330) = f29
   id(cc1331) = 76 feature(cc1331) = f28
   id(cc1332) = 76 feature(cc1332) = f27
   id(cc1333) = 76 feature(cc1333) = f26
   id(cc1334) = 76 feature(cc1334) = f24
   id(cc1335) = 76 feature(cc1335) = f23
   id(cc1336) = 76 feature(cc1336) = f22
   id(cc1337) = 76 feature(cc1337) = f21
   id(cc1338) = 76 feature(cc1338) = f19
   id(cc1339) = 76 feature(cc1339) = f18
   id(cc1340) = 76 feature(cc1340) = f17
   id(cc1341) = 76 feature(cc1341) = f16
   id(cc1342) = 76 feature(cc1342) = f15
   id(cc1343) = 76 feature(cc1343) = f10
   id(cc1344) = 77 feature(cc1344) = f1
   id(cc1345) = 77 feature(cc1345) = f31
   id(cc1346) = 77 feature(cc1346) = f30
   id(cc1347) = 77 feature(cc1347) = f29
   id(cc1348) = 77 feature(cc1348) = f28
   id(cc1349) = 77 feature(cc1349) = f27
   id(cc1350) = 77 feature(cc1350) = f26
   id(cc1351) = 77 feature(cc1351) = f24
   id(cc1352) = 77 feature(cc1352) = f23
   id(cc1353) = 77 feature(cc1353) = f22
   id(cc1354) = 77 feature(cc1354) = f21
   id(cc1355) = 77 feature(cc1355) = f19
   id(cc1356) = 77 feature(cc1356) = f18
   id(cc1357) = 77 feature(cc1357) = f17
   id(cc1358) = 77 feature(cc1358) = f16
   id(cc1359) = 77 feature(cc1359) = f15
   id(cc1360) = 77 feature(cc1360) = f9
   id(cc1361) = 78 feature(cc1361) = f1
   id(cc1362) = 78 feature(cc1362) = f31
   id(cc1363) = 78 feature(cc1363) = f30
   id(cc1364) = 78 feature(cc1364) = f29
   id(cc1365) = 78 feature(cc1365) = f28
   id(cc1366) = 78 feature(cc1366) = f27
   id(cc1367) = 78 feature(cc1367) = f26
   id(cc1368) = 78 feature(cc1368) = f24
   id(cc1369) = 78 feature(cc1369) = f23
   id(cc1370) = 78 feature(cc1370) = f22
   id(cc1371) = 78 feature(cc1371) = f21
   id(cc1372) = 78 feature(cc1372) = f19
   id(cc1373) = 78 feature(cc1373) = f18
   id(cc1374) = 78 feature(cc1374) = f17
   id(cc1375) = 78 feature(cc1375) = f16
   id(cc1376) = 78 feature(cc1376) = f15
   id(cc1377) = 78 feature(cc1377) = f7
   id(cc1378) = 79 feature(cc1378) = f1
   id(cc1379) = 79 feature(cc1379) = f31
   id(cc1380) = 79 feature(cc1380) = f30
   id(cc1381) = 79 feature(cc1381) = f29
   id(cc1382) = 79 feature(cc1382) = f28
   id(cc1383) = 79 feature(cc1383) = f27
   id(cc1384) = 79 feature(cc1384) = f26
   id(cc1385) = 79 feature(cc1385) = f24
   id(cc1386) = 79 feature(cc1386) = f23
   id(cc1387) = 79 feature(cc1387) = f22
   id(cc1388) = 79 feature(cc1388) = f21
   id(cc1389) = 79 feature(cc1389) = f19
   id(cc1390) = 79 feature(cc1390) = f18
   id(cc1391) = 79 feature(cc1391) = f17
   id(cc1392) = 79 feature(cc1392) = f16
   id(cc1393) = 79 feature(cc1393) = f15
   id(cc1394) = 79 feature(cc1394) = f6
   id(cc1395) = 80 feature(cc1395) = f1
   id(cc1396) = 80 feature(cc1396) = f31
   id(cc1397) = 80 feature(cc1397) = f30
   id(cc1398) = 80 feature(cc1398) = f29
   id(cc1399) = 80 feature(cc1399) = f28
   id(cc1400) = 80 feature(cc1400) = f27
   id(cc1401) = 80 feature(cc1401) = f26
   id(cc1402) = 80 feature(cc1402) = f24
   id(cc1403) = 80 feature(cc1403) = f23
   id(cc1404) = 80 feature(cc1404) = f22
   id(cc1405) = 80 feature(cc1405) = f21
   id(cc1406) = 80 feature(cc1406) = f19
   id(cc1407) = 80 feature(cc1407) = f18
   id(cc1408) = 80 feature(cc1408) = f17
   id(cc1409) = 80 feature(cc1409) = f16
   id(cc1410) = 80 feature(cc1410) = f15
   id(cc1411) = 80 feature(cc1411) = f5
   id(cc1412) = 81 feature(cc1412) = f1
   id(cc1413) = 81 feature(cc1413) = f31
   id(cc1414) = 81 feature(cc1414) = f30
   id(cc1415) = 81 feature(cc1415) = f29
   id(cc1416) = 81 feature(cc1416) = f28
   id(cc1417) = 81 feature(cc1417) = f27
   id(cc1418) = 81 feature(cc1418) = f26
   id(cc1419) = 81 feature(cc1419) = f24
   id(cc1420) = 81 feature(cc1420) = f23
   id(cc1421) = 81 feature(cc1421) = f22
   id(cc1422) = 81 feature(cc1422) = f21
   id(cc1423) = 81 feature(cc1423) = f19
   id(cc1424) = 81 feature(cc1424) = f18
   id(cc1425) = 81 feature(cc1425) = f17
   id(cc1426) = 81 feature(cc1426) = f16
   id(cc1427) = 81 feature(cc1427) = f15
   id(cc1428) = 81 feature(cc1428) = f4
   id(cc1429) = 82 feature(cc1429) = f1
   id(cc1430) = 82 feature(cc1430) = f31
   id(cc1431) = 82 feature(cc1431) = f30
   id(cc1432) = 82 feature(cc1432) = f29
   id(cc1433) = 82 feature(cc1433) = f28
   id(cc1434) = 82 feature(cc1434) = f27
   id(cc1435) = 82 feature(cc1435) = f26
   id(cc1436) = 82 feature(cc1436) = f24
   id(cc1437) = 82 feature(cc1437) = f23
   id(cc1438) = 82 feature(cc1438) = f22
   id(cc1439) = 82 feature(cc1439) = f21
   id(cc1440) = 82 feature(cc1440) = f19
   id(cc1441) = 82 feature(cc1441) = f18
   id(cc1442) = 82 feature(cc1442) = f17
   id(cc1443) = 82 feature(cc1443) = f16
   id(cc1444) = 82 feature(cc1444) = f15
   id(cc1445) = 82 feature(cc1445) = f3
   id(cc1446) = 83 feature(cc1446) = f1
   id(cc1447) = 83 feature(cc1447) = f31
   id(cc1448) = 83 feature(cc1448) = f30
   id(cc1449) = 83 feature(cc1449) = f29
   id(cc1450) = 83 feature(cc1450) = f28
   id(cc1451) = 83 feature(cc1451) = f27
   id(cc1452) = 83 feature(cc1452) = f26
   id(cc1453) = 83 feature(cc1453) = f24
   id(cc1454) = 83 feature(cc1454) = f23
   id(cc1455) = 83 feature(cc1455) = f22
   id(cc1456) = 83 feature(cc1456) = f21
   id(cc1457) = 83 feature(cc1457) = f19
   id(cc1458) = 83 feature(cc1458) = f18
   id(cc1459) = 83 feature(cc1459) = f17
   id(cc1460) = 83 feature(cc1460) = f16
   id(cc1461) = 83 feature(cc1461) = f15
   id(cc1462) = 83 feature(cc1462) = f3
   id(cc1463) = 83 feature(cc1463) = f2
   id(cc1464) = 84 feature(cc1464) = f1
   id(cc1465) = 84 feature(cc1465) = f31
   id(cc1466) = 84 feature(cc1466) = f30
   id(cc1467) = 84 feature(cc1467) = f28
   id(cc1468) = 84 feature(cc1468) = f27
   id(cc1469) = 84 feature(cc1469) = f26
   id(cc1470) = 84 feature(cc1470) = f24
   id(cc1471) = 84 feature(cc1471) = f23
   id(cc1472) = 84 feature(cc1472) = f22
   id(cc1473) = 84 feature(cc1473) = f21
   id(cc1474) = 84 feature(cc1474) = f19
   id(cc1475) = 84 feature(cc1475) = f18
   id(cc1476) = 84 feature(cc1476) = f17
   id(cc1477) = 84 feature(cc1477) = f16
   id(cc1478) = 84 feature(cc1478) = f15
   id(cc1479) = 84 feature(cc1479) = f3
   id(cc1480) = 85 feature(cc1480) = f1
   id(cc1481) = 85 feature(cc1481) = f31
   id(cc1482) = 85 feature(cc1482) = f30
   id(cc1483) = 85 feature(cc1483) = f29
   id(cc1484) = 85 feature(cc1484) = f27
   id(cc1485) = 85 feature(cc1485) = f26
   id(cc1486) = 85 feature(cc1486) = f24
   id(cc1487) = 85 feature(cc1487) = f23
   id(cc1488) = 85 feature(cc1488) = f22
   id(cc1489) = 85 feature(cc1489) = f21
   id(cc1490) = 85 feature(cc1490) = f19
   id(cc1491) = 85 feature(cc1491) = f18
   id(cc1492) = 85 feature(cc1492) = f17
   id(cc1493) = 85 feature(cc1493) = f16
   id(cc1494) = 85 feature(cc1494) = f15
   id(cc1495) = 85 feature(cc1495) = f3
   id(cc1496) = 86 feature(cc1496) = f1
   id(cc1497) = 86 feature(cc1497) = f31
   id(cc1498) = 86 feature(cc1498) = f30
   id(cc1499) = 86 feature(cc1499) = f29
   id(cc1500) = 86 feature(cc1500) = f27
   id(cc1501) = 86 feature(cc1501) = f26
   id(cc1502) = 86 feature(cc1502) = f24
   id(cc1503) = 86 feature(cc1503) = f23
   id(cc1504) = 86 feature(cc1504) = f22
   id(cc1505) = 86 feature(cc1505) = f21
   id(cc1506) = 86 feature(cc1506) = f19
   id(cc1507) = 86 feature(cc1507) = f18
   id(cc1508) = 86 feature(cc1508) = f17
   id(cc1509) = 86 feature(cc1509) = f16
   id(cc1510) = 86 feature(cc1510) = f15
   id(cc1511) = 86 feature(cc1511) = f12
   id(cc1512) = 86 feature(cc1512) = f3
   id(cc1513) = 87 feature(cc1513) = f1
   id(cc1514) = 87 feature(cc1514) = f31
   id(cc1515) = 87 feature(cc1515) = f30
   id(cc1516) = 87 feature(cc1516) = f29
   id(cc1517) = 87 feature(cc1517) = f27
   id(cc1518) = 87 feature(cc1518) = f26
   id(cc1519) = 87 feature(cc1519) = f24
   id(cc1520) = 87 feature(cc1520) = f23
   id(cc1521) = 87 feature(cc1521) = f22
   id(cc1522) = 87 feature(cc1522) = f21
   id(cc1523) = 87 feature(cc1523) = f19
   id(cc1524) = 87 feature(cc1524) = f18
   id(cc1525) = 87 feature(cc1525) = f17
   id(cc1526) = 87 feature(cc1526) = f16
   id(cc1527) = 87 feature(cc1527) = f15
   id(cc1528) = 87 feature(cc1528) = f11
   id(cc1529) = 87 feature(cc1529) = f3
   id(cc1530) = 88 feature(cc1530) = f1
   id(cc1531) = 88 feature(cc1531) = f31
   id(cc1532) = 88 feature(cc1532) = f30
   id(cc1533) = 88 feature(cc1533) = f29
   id(cc1534) = 88 feature(cc1534) = f27
   id(cc1535) = 88 feature(cc1535) = f26
   id(cc1536) = 88 feature(cc1536) = f24
   id(cc1537) = 88 feature(cc1537) = f23
   id(cc1538) = 88 feature(cc1538) = f22
   id(cc1539) = 88 feature(cc1539) = f21
   id(cc1540) = 88 feature(cc1540) = f19
   id(cc1541) = 88 feature(cc1541) = f18
   id(cc1542) = 88 feature(cc1542) = f17
   id(cc1543) = 88 feature(cc1543) = f16
   id(cc1544) = 88 feature(cc1544) = f15
   id(cc1545) = 88 feature(cc1545) = f10
   id(cc1546) = 88 feature(cc1546) = f3
   id(cc1547) = 89 feature(cc1547) = f1
   id(cc1548) = 89 feature(cc1548) = f31
   id(cc1549) = 89 feature(cc1549) = f30
   id(cc1550) = 89 feature(cc1550) = f29
   id(cc1551) = 89 feature(cc1551) = f27
   id(cc1552) = 89 feature(cc1552) = f26
   id(cc1553) = 89 feature(cc1553) = f24
   id(cc1554) = 89 feature(cc1554) = f23
   id(cc1555) = 89 feature(cc1555) = f22
   id(cc1556) = 89 feature(cc1556) = f21
   id(cc1557) = 89 feature(cc1557) = f19
   id(cc1558) = 89 feature(cc1558) = f18
   id(cc1559) = 89 feature(cc1559) = f17
   id(cc1560) = 89 feature(cc1560) = f16
   id(cc1561) = 89 feature(cc1561) = f15
   id(cc1562) = 89 feature(cc1562) = f9
   id(cc1563) = 89 feature(cc1563) = f3
   id(cc1564) = 90 feature(cc1564) = f1
   id(cc1565) = 90 feature(cc1565) = f31
   id(cc1566) = 90 feature(cc1566) = f30
   id(cc1567) = 90 feature(cc1567) = f29
   id(cc1568) = 90 feature(cc1568) = f27
   id(cc1569) = 90 feature(cc1569) = f26
   id(cc1570) = 90 feature(cc1570) = f24
   id(cc1571) = 90 feature(cc1571) = f23
   id(cc1572) = 90 feature(cc1572) = f22
   id(cc1573) = 90 feature(cc1573) = f21
   id(cc1574) = 90 feature(cc1574) = f19
   id(cc1575) = 90 feature(cc1575) = f18
   id(cc1576) = 90 feature(cc1576) = f17
   id(cc1577) = 90 feature(cc1577) = f16
   id(cc1578) = 90 feature(cc1578) = f15
   id(cc1579) = 90 feature(cc1579) = f7
   id(cc1580) = 90 feature(cc1580) = f3
   id(cc1581) = 91 feature(cc1581) = f1
   id(cc1582) = 91 feature(cc1582) = f31
   id(cc1583) = 91 feature(cc1583) = f30
   id(cc1584) = 91 feature(cc1584) = f29
   id(cc1585) = 91 feature(cc1585) = f27
   id(cc1586) = 91 feature(cc1586) = f26
   id(cc1587) = 91 feature(cc1587) = f24
   id(cc1588) = 91 feature(cc1588) = f23
   id(cc1589) = 91 feature(cc1589) = f22
   id(cc1590) = 91 feature(cc1590) = f21
   id(cc1591) = 91 feature(cc1591) = f19
   id(cc1592) = 91 feature(cc1592) = f18
   id(cc1593) = 91 feature(cc1593) = f17
   id(cc1594) = 91 feature(cc1594) = f16
   id(cc1595) = 91 feature(cc1595) = f15
   id(cc1596) = 91 feature(cc1596) = f6
   id(cc1597) = 91 feature(cc1597) = f3
   id(cc1598) = 92 feature(cc1598) = f1
   id(cc1599) = 92 feature(cc1599) = f31
   id(cc1600) = 92 feature(cc1600) = f30
   id(cc1601) = 92 feature(cc1601) = f29
   id(cc1602) = 92 feature(cc1602) = f27
   id(cc1603) = 92 feature(cc1603) = f26
   id(cc1604) = 92 feature(cc1604) = f24
   id(cc1605) = 92 feature(cc1605) = f23
   id(cc1606) = 92 feature(cc1606) = f22
   id(cc1607) = 92 feature(cc1607) = f21
   id(cc1608) = 92 feature(cc1608) = f19
   id(cc1609) = 92 feature(cc1609) = f18
   id(cc1610) = 92 feature(cc1610) = f17
   id(cc1611) = 92 feature(cc1611) = f16
   id(cc1612) = 92 feature(cc1612) = f15
   id(cc1613) = 92 feature(cc1613) = f5
   id(cc1614) = 92 feature(cc1614) = f3
   id(cc1615) = 93 feature(cc1615) = f1
   id(cc1616) = 93 feature(cc1616) = f31
   id(cc1617) = 93 feature(cc1617) = f30
   id(cc1618) = 93 feature(cc1618) = f29
   id(cc1619) = 93 feature(cc1619) = f27
   id(cc1620) = 93 feature(cc1620) = f26
   id(cc1621) = 93 feature(cc1621) = f24
   id(cc1622) = 93 feature(cc1622) = f23
   id(cc1623) = 93 feature(cc1623) = f22
   id(cc1624) = 93 feature(cc1624) = f21
   id(cc1625) = 93 feature(cc1625) = f19
   id(cc1626) = 93 feature(cc1626) = f18
   id(cc1627) = 93 feature(cc1627) = f17
   id(cc1628) = 93 feature(cc1628) = f16
   id(cc1629) = 93 feature(cc1629) = f15
   id(cc1630) = 93 feature(cc1630) = f4
   id(cc1631) = 93 feature(cc1631) = f3
   id(cc1632) = 94 feature(cc1632) = f1
   id(cc1633) = 94 feature(cc1633) = f31
   id(cc1634) = 94 feature(cc1634) = f30
   id(cc1635) = 94 feature(cc1635) = f29
   id(cc1636) = 94 feature(cc1636) = f27
   id(cc1637) = 94 feature(cc1637) = f26
   id(cc1638) = 94 feature(cc1638) = f24
   id(cc1639) = 94 feature(cc1639) = f23
   id(cc1640) = 94 feature(cc1640) = f22
   id(cc1641) = 94 feature(cc1641) = f21
   id(cc1642) = 94 feature(cc1642) = f19
   id(cc1643) = 94 feature(cc1643) = f18
   id(cc1644) = 94 feature(cc1644) = f17
   id(cc1645) = 94 feature(cc1645) = f16
   id(cc1646) = 94 feature(cc1646) = f15
   id(cc1647) = 94 feature(cc1647) = f4
   id(cc1648) = 95 feature(cc1648) = f1
   id(cc1649) = 95 feature(cc1649) = f31
   id(cc1650) = 95 feature(cc1650) = f30
   id(cc1651) = 95 feature(cc1651) = f29
   id(cc1652) = 95 feature(cc1652) = f27
   id(cc1653) = 95 feature(cc1653) = f26
   id(cc1654) = 95 feature(cc1654) = f24
   id(cc1655) = 95 feature(cc1655) = f23
   id(cc1656) = 95 feature(cc1656) = f22
   id(cc1657) = 95 feature(cc1657) = f21
   id(cc1658) = 95 feature(cc1658) = f19
   id(cc1659) = 95 feature(cc1659) = f18
   id(cc1660) = 95 feature(cc1660) = f17
   id(cc1661) = 95 feature(cc1661) = f16
   id(cc1662) = 95 feature(cc1662) = f15
   id(cc1663) = 95 feature(cc1663) = f4
   id(cc1664) = 95 feature(cc1664) = f3
   id(cc1665) = 95 feature(cc1665) = f2
   id(cc1666) = 96 feature(cc1666) = f1
   id(cc1667) = 96 feature(cc1667) = f31
   id(cc1668) = 96 feature(cc1668) = f30
   id(cc1669) = 96 feature(cc1669) = f27
   id(cc1670) = 96 feature(cc1670) = f26
   id(cc1671) = 96 feature(cc1671) = f24
   id(cc1672) = 96 feature(cc1672) = f23
   id(cc1673) = 96 feature(cc1673) = f22
   id(cc1674) = 96 feature(cc1674) = f21
   id(cc1675) = 96 feature(cc1675) = f19
   id(cc1676) = 96 feature(cc1676) = f18
   id(cc1677) = 96 feature(cc1677) = f17
   id(cc1678) = 96 feature(cc1678) = f16
   id(cc1679) = 96 feature(cc1679) = f15
   id(cc1680) = 96 feature(cc1680) = f4
   id(cc1681) = 96 feature(cc1681) = f3
   id(cc1682) = 96 feature(cc1682) = f2
  


  # Variant-wise Quality Names and Domains
   name(qn1) = Cache
   name(qn2) = Cost
  
   domain(qd1) = String
  

  # Quality Values
   value(qv1) = 5742
   value(qv2) = 7196
   value(qv3) = 7654
   value(qv4) = 5429
   value(qv5) = 452
   value(qv6) = 6366
   value(qv7) = 1030
   value(qv8) = 322
   value(qv9) = 414
   value(qv10) = 2420
   value(qv11) = 4509
   value(qv12) = 1257
   value(qv13) = 2983
   value(qv14) = 3022
   value(qv15) = 5658
   value(qv16) = 6990
   value(qv17) = 4641
   value(qv18) = 7679
   value(qv19) = 1102
   value(qv20) = 1392
   value(qv21) = 2796
   value(qv22) = 2795
   value(qv23) = 922
   value(qv24) = 3438
   value(qv25) = 3207
   value(qv26) = 6671
   value(qv27) = 285
   value(qv28) = 6255
   value(qv29) = 5097
   value(qv30) = 1921
   value(qv31) = 7933
   value(qv32) = 4655
   value(qv33) = 3204
   value(qv34) = 4841
   value(qv35) = 7533
   value(qv36) = 4857
   value(qv37) = 7837
   value(qv38) = 4379
   value(qv39) = 713
   value(qv40) = 3746
   value(qv41) = 4954
   value(qv42) = 7192
   value(qv43) = 267
   value(qv44) = 2689
   value(qv45) = 3624
   value(qv46) = 5679
   value(qv47) = 4590
   value(qv48) = 2695
   value(qv49) = 5491
   value(qv50) = 6259
   value(qv51) = 1147
   value(qv52) = 5945
   value(qv53) = 1624
   value(qv54) = 1616
   value(qv55) = 4972
   value(qv56) = 7151
   value(qv57) = 2723
   value(qv58) = 2882
   value(qv59) = 5081
   value(qv60) = 6101
   value(qv61) = 1499
   value(qv62) = 3832
   value(qv63) = 1389
   value(qv64) = 483
   value(qv65) = 1058
   value(qv66) = 4076
   value(qv67) = 3211
   value(qv68) = 642
   value(qv69) = 4074
   value(qv70) = 6438
   value(qv71) = 7223
   value(qv72) = 5360
   value(qv73) = 100
   value(qv74) = 5281
   value(qv75) = 1006
   value(qv76) = 1103
   value(qv77) = 1033
   value(qv78) = 7761
   value(qv79) = 1942
   value(qv80) = 672
   value(qv81) = 6985
   value(qv82) = 3125
   value(qv83) = 6324
   value(qv84) = 972
   value(qv85) = 1571
   value(qv86) = 7187
   value(qv87) = 7505
   value(qv88) = 1540
   value(qv89) = 4500
   value(qv90) = 3052
   value(qv91) = 1695
   value(qv92) = 7014
   value(qv93) = 5862
   value(qv94) = 1989
   value(qv95) = 2428
   value(qv96) = 7197
   value(qv97) = 1998
  

  # Qualities
   name(qs1) = qn1 value(qs1) = qv77 domain(qs1) = qd1
   name(qs2) = qn1 value(qs2) = qv8 domain(qs2) = qd1
   name(qs3) = qn1 value(qs3) = qv39 domain(qs3) = qd1
   name(qs4) = qn1 value(qs4) = qv32 domain(qs4) = qd1
   name(qs5) = qn1 value(qs5) = qv95 domain(qs5) = qd1
   name(qs6) = qn1 value(qs6) = qv82 domain(qs6) = qd1
   name(qs7) = qn1 value(qs7) = qv83 domain(qs7) = qd1
   name(qs8) = qn1 value(qs8) = qv65 domain(qs8) = qd1
   name(qs9) = qn1 value(qs9) = qv56 domain(qs9) = qd1
   name(qs10) = qn1 value(qs10) = qv90 domain(qs10) = qd1
   name(qs11) = qn1 value(qs11) = qv89 domain(qs11) = qd1
   name(qs12) = qn1 value(qs12) = qv92 domain(qs12) = qd1
   name(qs13) = qn1 value(qs13) = qv24 domain(qs13) = qd1
   name(qs14) = qn1 value(qs14) = qv84 domain(qs14) = qd1
   name(qs15) = qn1 value(qs15) = qv62 domain(qs15) = qd1
   name(qs16) = qn1 value(qs16) = qv21 domain(qs16) = qd1
   name(qs17) = qn1 value(qs17) = qv75 domain(qs17) = qd1
   name(qs18) = qn1 value(qs18) = qv55 domain(qs18) = qd1
   name(qs19) = qn1 value(qs19) = qv66 domain(qs19) = qd1
   name(qs20) = qn1 value(qs20) = qv2 domain(qs20) = qd1
   name(qs21) = qn1 value(qs21) = qv70 domain(qs21) = qd1
   name(qs22) = qn1 value(qs22) = qv29 domain(qs22) = qd1
   name(qs23) = qn1 value(qs23) = qv64 domain(qs23) = qd1
   name(qs24) = qn1 value(qs24) = qv7 domain(qs24) = qd1
   name(qs25) = qn1 value(qs25) = qv6 domain(qs25) = qd1
   name(qs26) = qn1 value(qs26) = qv23 domain(qs26) = qd1
   name(qs27) = qn1 value(qs27) = qv36 domain(qs27) = qd1
   name(qs28) = qn1 value(qs28) = qv96 domain(qs28) = qd1
   name(qs29) = qn1 value(qs29) = qv80 domain(qs29) = qd1
   name(qs30) = qn1 value(qs30) = qv38 domain(qs30) = qd1
   name(qs31) = qn1 value(qs31) = qv59 domain(qs31) = qd1
   name(qs32) = qn1 value(qs32) = qv52 domain(qs32) = qd1
   name(qs33) = qn1 value(qs33) = qv86 domain(qs33) = qd1
   name(qs34) = qn1 value(qs34) = qv34 domain(qs34) = qd1
   name(qs35) = qn1 value(qs35) = qv49 domain(qs35) = qd1
   name(qs36) = qn1 value(qs36) = qv51 domain(qs36) = qd1
   name(qs37) = qn1 value(qs37) = qv22 domain(qs37) = qd1
   name(qs38) = qn1 value(qs38) = qv3 domain(qs38) = qd1
   name(qs39) = qn1 value(qs39) = qv46 domain(qs39) = qd1
   name(qs40) = qn1 value(qs40) = qv43 domain(qs40) = qd1
   name(qs41) = qn1 value(qs41) = qv12 domain(qs41) = qd1
   name(qs42) = qn1 value(qs42) = qv26 domain(qs42) = qd1
   name(qs43) = qn1 value(qs43) = qv13 domain(qs43) = qd1
   name(qs44) = qn1 value(qs44) = qv35 domain(qs44) = qd1
   name(qs45) = qn1 value(qs45) = qv61 domain(qs45) = qd1
   name(qs46) = qn2 value(qs46) = qv73 domain(qs46) = qd1
   name(qs47) = qn1 value(qs47) = qv57 domain(qs47) = qd1
   name(qs48) = qn1 value(qs48) = qv42 domain(qs48) = qd1
   name(qs49) = qn1 value(qs49) = qv78 domain(qs49) = qd1
   name(qs50) = qn1 value(qs50) = qv81 domain(qs50) = qd1
   name(qs51) = qn1 value(qs51) = qv20 domain(qs51) = qd1
   name(qs52) = qn1 value(qs52) = qv4 domain(qs52) = qd1
   name(qs53) = qn1 value(qs53) = qv94 domain(qs53) = qd1
   name(qs54) = qn1 value(qs54) = qv40 domain(qs54) = qd1
   name(qs55) = qn1 value(qs55) = qv41 domain(qs55) = qd1
   name(qs56) = qn1 value(qs56) = qv63 domain(qs56) = qd1
   name(qs57) = qn1 value(qs57) = qv91 domain(qs57) = qd1
   name(qs58) = qn1 value(qs58) = qv11 domain(qs58) = qd1
   name(qs59) = qn1 value(qs59) = qv69 domain(qs59) = qd1
   name(qs60) = qn1 value(qs60) = qv79 domain(qs60) = qd1
   name(qs61) = qn1 value(qs61) = qv85 domain(qs61) = qd1
   name(qs62) = qn1 value(qs62) = qv47 domain(qs62) = qd1
   name(qs63) = qn1 value(qs63) = qv48 domain(qs63) = qd1
   name(qs64) = qn1 value(qs64) = qv30 domain(qs64) = qd1
   name(qs65) = qn1 value(qs65) = qv50 domain(qs65) = qd1
   name(qs66) = qn1 value(qs66) = qv88 domain(qs66) = qd1
   name(qs67) = qn1 value(qs67) = qv28 domain(qs67) = qd1
   name(qs68) = qn1 value(qs68) = qv44 domain(qs68) = qd1
   name(qs69) = qn1 value(qs69) = qv19 domain(qs69) = qd1
   name(qs70) = qn1 value(qs70) = qv87 domain(qs70) = qd1
   name(qs71) = qn1 value(qs71) = qv45 domain(qs71) = qd1
   name(qs72) = qn1 value(qs72) = qv97 domain(qs72) = qd1
   name(qs73) = qn1 value(qs73) = qv67 domain(qs73) = qd1
   name(qs74) = qn1 value(qs74) = qv76 domain(qs74) = qd1
   name(qs75) = qn1 value(qs75) = qv18 domain(qs75) = qd1
   name(qs76) = qn1 value(qs76) = qv72 domain(qs76) = qd1
   name(qs77) = qn1 value(qs77) = qv37 domain(qs77) = qd1
   name(qs78) = qn1 value(qs78) = qv68 domain(qs78) = qd1
   name(qs79) = qn1 value(qs79) = qv71 domain(qs79) = qd1
   name(qs80) = qn1 value(qs80) = qv5 domain(qs80) = qd1
   name(qs81) = qn1 value(qs81) = qv1 domain(qs81) = qd1
   name(qs82) = qn1 value(qs82) = qv58 domain(qs82) = qd1
   name(qs83) = qn1 value(qs83) = qv93 domain(qs83) = qd1
   name(qs84) = qn1 value(qs84) = qv15 domain(qs84) = qd1
   name(qs85) = qn1 value(qs85) = qv9 domain(qs85) = qd1
   name(qs86) = qn1 value(qs86) = qv74 domain(qs86) = qd1
   name(qs87) = qn1 value(qs87) = qv31 domain(qs87) = qd1
   name(qs88) = qn1 value(qs88) = qv10 domain(qs88) = qd1
   name(qs89) = qn1 value(qs89) = qv54 domain(qs89) = qd1
   name(qs90) = qn1 value(qs90) = qv60 domain(qs90) = qd1
   name(qs91) = qn1 value(qs91) = qv17 domain(qs91) = qd1
   name(qs92) = qn1 value(qs92) = qv16 domain(qs92) = qd1
   name(qs93) = qn1 value(qs93) = qv53 domain(qs93) = qd1
   name(qs94) = qn1 value(qs94) = qv27 domain(qs94) = qd1
   name(qs95) = qn1 value(qs95) = qv14 domain(qs95) = qd1
   name(qs96) = qn1 value(qs96) = qv33 domain(qs96) = qd1
   name(qs97) = qn1 value(qs97) = qv25 domain(qs97) = qd1
  

  # QAs Sets
   id(qa1) = 1 qualities(qa1) = qs46
   id(qa2) = 1 qualities(qa2) = qs87
   id(qa3) = 2 qualities(qa3) = qs46
   id(qa4) = 2 qualities(qa4) = qs40
   id(qa5) = 3 qualities(qa5) = qs46
   id(qa6) = 3 qualities(qa6) = qs64
   id(qa7) = 4 qualities(qa7) = qs46
   id(qa8) = 4 qualities(qa8) = qs47
   id(qa9) = 5 qualities(qa9) = qs46
   id(qa10) = 5 qualities(qa10) = qs89
   id(qa11) = 6 qualities(qa11) = qs46
   id(qa12) = 6 qualities(qa12) = qs58
   id(qa13) = 7 qualities(qa13) = qs46
   id(qa14) = 7 qualities(qa14) = qs71
   id(qa15) = 8 qualities(qa15) = qs46
   id(qa16) = 8 qualities(qa16) = qs95
   id(qa17) = 9 qualities(qa17) = qs46
   id(qa18) = 9 qualities(qa18) = qs60
   id(qa19) = 10 qualities(qa19) = qs46
   id(qa20) = 10 qualities(qa20) = qs42
   id(qa21) = 11 qualities(qa21) = qs46
   id(qa22) = 11 qualities(qa22) = qs39
   id(qa23) = 12 qualities(qa23) = qs46
   id(qa24) = 12 qualities(qa24) = qs50
   id(qa25) = 13 qualities(qa25) = qs46
   id(qa26) = 13 qualities(qa26) = qs21
   id(qa27) = 14 qualities(qa27) = qs46
   id(qa28) = 14 qualities(qa28) = qs12
   id(qa29) = 15 qualities(qa29) = qs46
   id(qa30) = 15 qualities(qa30) = qs36
   id(qa31) = 16 qualities(qa31) = qs46
   id(qa32) = 16 qualities(qa32) = qs94
   id(qa33) = 17 qualities(qa33) = qs46
   id(qa34) = 17 qualities(qa34) = qs10
   id(qa35) = 18 qualities(qa35) = qs46
   id(qa36) = 18 qualities(qa36) = qs51
   id(qa37) = 19 qualities(qa37) = qs46
   id(qa38) = 19 qualities(qa38) = qs96
   id(qa39) = 20 qualities(qa39) = qs46
   id(qa40) = 20 qualities(qa40) = qs81
   id(qa41) = 21 qualities(qa41) = qs46
   id(qa42) = 21 qualities(qa42) = qs20
   id(qa43) = 22 qualities(qa43) = qs46
   id(qa44) = 22 qualities(qa44) = qs54
   id(qa45) = 23 qualities(qa45) = qs46
   id(qa46) = 23 qualities(qa46) = qs29
   id(qa47) = 24 qualities(qa47) = qs46
   id(qa48) = 24 qualities(qa48) = qs6
   id(qa49) = 25 qualities(qa49) = qs46
   id(qa50) = 25 qualities(qa50) = qs30
   id(qa51) = 26 qualities(qa51) = qs46
   id(qa52) = 26 qualities(qa52) = qs79
   id(qa53) = 27 qualities(qa53) = qs46
   id(qa54) = 27 qualities(qa54) = qs38
   id(qa55) = 28 qualities(qa55) = qs46
   id(qa56) = 28 qualities(qa56) = qs43
   id(qa57) = 29 qualities(qa57) = qs46
   id(qa58) = 29 qualities(qa58) = qs83
   id(qa59) = 30 qualities(qa59) = qs46
   id(qa60) = 30 qualities(qa60) = qs22
   id(qa61) = 31 qualities(qa61) = qs46
   id(qa62) = 31 qualities(qa62) = qs35
   id(qa63) = 32 qualities(qa63) = qs46
   id(qa64) = 32 qualities(qa64) = qs55
   id(qa65) = 33 qualities(qa65) = qs46
   id(qa66) = 33 qualities(qa66) = qs33
   id(qa67) = 34 qualities(qa67) = qs46
   id(qa68) = 34 qualities(qa68) = qs27
   id(qa69) = 35 qualities(qa69) = qs46
   id(qa70) = 35 qualities(qa70) = qs2
   id(qa71) = 36 qualities(qa71) = qs46
   id(qa72) = 36 qualities(qa72) = qs56
   id(qa73) = 37 qualities(qa73) = qs46
   id(qa74) = 37 qualities(qa74) = qs69
   id(qa75) = 38 qualities(qa75) = qs46
   id(qa76) = 38 qualities(qa76) = qs18
   id(qa77) = 39 qualities(qa77) = qs46
   id(qa78) = 39 qualities(qa78) = qs91
   id(qa79) = 40 qualities(qa79) = qs46
   id(qa80) = 40 qualities(qa80) = qs28
   id(qa81) = 41 qualities(qa81) = qs46
   id(qa82) = 41 qualities(qa82) = qs23
   id(qa83) = 42 qualities(qa83) = qs46
   id(qa84) = 42 qualities(qa84) = qs86
   id(qa85) = 43 qualities(qa85) = qs46
   id(qa86) = 43 qualities(qa86) = qs49
   id(qa87) = 44 qualities(qa87) = qs46
   id(qa88) = 44 qualities(qa88) = qs26
   id(qa89) = 45 qualities(qa89) = qs46
   id(qa90) = 45 qualities(qa90) = qs75
   id(qa91) = 46 qualities(qa91) = qs46
   id(qa92) = 46 qualities(qa92) = qs45
   id(qa93) = 47 qualities(qa93) = qs46
   id(qa94) = 47 qualities(qa94) = qs72
   id(qa95) = 48 qualities(qa95) = qs46
   id(qa96) = 48 qualities(qa96) = qs97
   id(qa97) = 49 qualities(qa97) = qs46
   id(qa98) = 49 qualities(qa98) = qs13
   id(qa99) = 50 qualities(qa99) = qs46
   id(qa100) = 50 qualities(qa100) = qs67
   id(qa101) = 51 qualities(qa101) = qs46
   id(qa102) = 51 qualities(qa102) = qs7
   id(qa103) = 52 qualities(qa103) = qs46
   id(qa104) = 52 qualities(qa104) = qs70
   id(qa105) = 53 qualities(qa105) = qs46
   id(qa106) = 53 qualities(qa106) = qs16
   id(qa107) = 54 qualities(qa107) = qs46
   id(qa108) = 54 qualities(qa108) = qs3
   id(qa109) = 55 qualities(qa109) = qs46
   id(qa110) = 55 qualities(qa110) = qs77
   id(qa111) = 56 qualities(qa111) = qs46
   id(qa112) = 56 qualities(qa112) = qs57
   id(qa113) = 57 qualities(qa113) = qs46
   id(qa114) = 57 qualities(qa114) = qs44
   id(qa115) = 58 qualities(qa115) = qs46
   id(qa116) = 58 qualities(qa116) = qs78
   id(qa117) = 59 qualities(qa117) = qs46
   id(qa118) = 59 qualities(qa118) = qs37
   id(qa119) = 60 qualities(qa119) = qs46
   id(qa120) = 60 qualities(qa120) = qs90
   id(qa121) = 61 qualities(qa121) = qs46
   id(qa122) = 61 qualities(qa122) = qs8
   id(qa123) = 62 qualities(qa123) = qs46
   id(qa124) = 62 qualities(qa124) = qs73
   id(qa125) = 63 qualities(qa125) = qs46
   id(qa126) = 63 qualities(qa126) = qs15
   id(qa127) = 64 qualities(qa127) = qs46
   id(qa128) = 64 qualities(qa128) = qs85
   id(qa129) = 65 qualities(qa129) = qs46
   id(qa130) = 65 qualities(qa130) = qs14
   id(qa131) = 66 qualities(qa131) = qs46
   id(qa132) = 66 qualities(qa132) = qs34
   id(qa133) = 67 qualities(qa133) = qs46
   id(qa134) = 67 qualities(qa134) = qs53
   id(qa135) = 68 qualities(qa135) = qs46
   id(qa136) = 68 qualities(qa136) = qs9
   id(qa137) = 69 qualities(qa137) = qs46
   id(qa138) = 69 qualities(qa138) = qs92
   id(qa139) = 70 qualities(qa139) = qs46
   id(qa140) = 70 qualities(qa140) = qs82
   id(qa141) = 71 qualities(qa141) = qs46
   id(qa142) = 71 qualities(qa142) = qs24
   id(qa143) = 72 qualities(qa143) = qs46
   id(qa144) = 72 qualities(qa144) = qs25
   id(qa145) = 73 qualities(qa145) = qs46
   id(qa146) = 73 qualities(qa146) = qs59
   id(qa147) = 74 qualities(qa147) = qs46
   id(qa148) = 74 qualities(qa148) = qs93
   id(qa149) = 75 qualities(qa149) = qs46
   id(qa150) = 75 qualities(qa150) = qs63
   id(qa151) = 76 qualities(qa151) = qs46
   id(qa152) = 76 qualities(qa152) = qs80
   id(qa153) = 77 qualities(qa153) = qs46
   id(qa154) = 77 qualities(qa154) = qs41
   id(qa155) = 78 qualities(qa155) = qs46
   id(qa156) = 78 qualities(qa156) = qs61
   id(qa157) = 79 qualities(qa157) = qs46
   id(qa158) = 79 qualities(qa158) = qs62
   id(qa159) = 80 qualities(qa159) = qs46
   id(qa160) = 80 qualities(qa160) = qs31
   id(qa161) = 81 qualities(qa161) = qs46
   id(qa162) = 81 qualities(qa162) = qs17
   id(qa163) = 82 qualities(qa163) = qs46
   id(qa164) = 82 qualities(qa164) = qs65
   id(qa165) = 83 qualities(qa165) = qs46
   id(qa166) = 83 qualities(qa166) = qs66
   id(qa167) = 84 qualities(qa167) = qs46
   id(qa168) = 84 qualities(qa168) = qs4
   id(qa169) = 85 qualities(qa169) = qs46
   id(qa170) = 85 qualities(qa170) = qs76
   id(qa171) = 86 qualities(qa171) = qs46
   id(qa172) = 86 qualities(qa172) = qs1
   id(qa173) = 87 qualities(qa173) = qs46
   id(qa174) = 87 qualities(qa174) = qs48
   id(qa175) = 88 qualities(qa175) = qs46
   id(qa176) = 88 qualities(qa176) = qs84
   id(qa177) = 89 qualities(qa177) = qs46
   id(qa178) = 89 qualities(qa178) = qs88
   id(qa179) = 90 qualities(qa179) = qs46
   id(qa180) = 90 qualities(qa180) = qs11
   id(qa181) = 91 qualities(qa181) = qs46
   id(qa182) = 91 qualities(qa182) = qs74
   id(qa183) = 92 qualities(qa183) = qs46
   id(qa184) = 92 qualities(qa184) = qs5
   id(qa185) = 93 qualities(qa185) = qs46
   id(qa186) = 93 qualities(qa186) = qs32
   id(qa187) = 94 qualities(qa187) = qs46
   id(qa188) = 94 qualities(qa188) = qs52
   id(qa189) = 95 qualities(qa189) = qs46
   id(qa190) = 95 qualities(qa190) = qs68
   id(qa191) = 96 qualities(qa191) = qs46
   id(qa192) = 96 qualities(qa192) = qs19
  

  # CC/QAs Linkage
   phi(qmc1) = 84 psi(qmc1) = 84
   phi(qmc2) = 61 psi(qmc2) = 61
   phi(qmc3) = 20 psi(qmc3) = 20
   phi(qmc4) = 2 psi(qmc4) = 2
   phi(qmc5) = 57 psi(qmc5) = 57
   phi(qmc6) = 94 psi(qmc6) = 94
   phi(qmc7) = 25 psi(qmc7) = 25
   phi(qmc8) = 58 psi(qmc8) = 58
   phi(qmc9) = 35 psi(qmc9) = 35
   phi(qmc10) = 90 psi(qmc10) = 90
   phi(qmc11) = 31 psi(qmc11) = 31
   phi(qmc12) = 91 psi(qmc12) = 91
   phi(qmc13) = 68 psi(qmc13) = 68
   phi(qmc14) = 63 psi(qmc14) = 63
   phi(qmc15) = 32 psi(qmc15) = 32
   phi(qmc16) = 64 psi(qmc16) = 64
   phi(qmc17) = 59 psi(qmc17) = 59
   phi(qmc18) = 5 psi(qmc18) = 5
   phi(qmc19) = 65 psi(qmc19) = 65
   phi(qmc20) = 92 psi(qmc20) = 92
   phi(qmc21) = 6 psi(qmc21) = 6
   phi(qmc22) = 33 psi(qmc22) = 33
   phi(qmc23) = 88 psi(qmc23) = 88
   phi(qmc24) = 70 psi(qmc24) = 70
   phi(qmc25) = 29 psi(qmc25) = 29
   phi(qmc26) = 39 psi(qmc26) = 39
   phi(qmc27) = 66 psi(qmc27) = 66
   phi(qmc28) = 7 psi(qmc28) = 7
   phi(qmc29) = 62 psi(qmc29) = 62
   phi(qmc30) = 72 psi(qmc30) = 72
   phi(qmc31) = 44 psi(qmc31) = 44
   phi(qmc32) = 3 psi(qmc32) = 3
   phi(qmc33) = 40 psi(qmc33) = 40
   phi(qmc34) = 95 psi(qmc34) = 95
   phi(qmc35) = 36 psi(qmc35) = 36
   phi(qmc36) = 96 psi(qmc36) = 96
   phi(qmc37) = 18 psi(qmc37) = 18
   phi(qmc38) = 73 psi(qmc38) = 73
   phi(qmc39) = 4 psi(qmc39) = 4
   phi(qmc40) = 14 psi(qmc40) = 14
   phi(qmc41) = 69 psi(qmc41) = 69
   phi(qmc42) = 9 psi(qmc42) = 9
   phi(qmc43) = 10 psi(qmc43) = 10
   phi(qmc44) = 37 psi(qmc44) = 37
   phi(qmc45) = 47 psi(qmc45) = 47
   phi(qmc46) = 42 psi(qmc46) = 42
   phi(qmc47) = 43 psi(qmc47) = 43
   phi(qmc48) = 38 psi(qmc48) = 38
   phi(qmc49) = 80 psi(qmc49) = 80
   phi(qmc50) = 75 psi(qmc50) = 75
   phi(qmc51) = 34 psi(qmc51) = 34
   phi(qmc52) = 11 psi(qmc52) = 11
   phi(qmc53) = 76 psi(qmc53) = 76
   phi(qmc54) = 16 psi(qmc54) = 16
   phi(qmc55) = 71 psi(qmc55) = 71
   phi(qmc56) = 12 psi(qmc56) = 12
   phi(qmc57) = 67 psi(qmc57) = 67
   phi(qmc58) = 77 psi(qmc58) = 77
   phi(qmc59) = 49 psi(qmc59) = 49
   phi(qmc60) = 8 psi(qmc60) = 8
   phi(qmc61) = 45 psi(qmc61) = 45
   phi(qmc62) = 82 psi(qmc62) = 82
   phi(qmc63) = 41 psi(qmc63) = 41
   phi(qmc64) = 51 psi(qmc64) = 51
   phi(qmc65) = 23 psi(qmc65) = 23
   phi(qmc66) = 78 psi(qmc66) = 78
   phi(qmc67) = 19 psi(qmc67) = 19
   phi(qmc68) = 74 psi(qmc68) = 74
   phi(qmc69) = 79 psi(qmc69) = 79
   phi(qmc70) = 56 psi(qmc70) = 56
   phi(qmc71) = 15 psi(qmc71) = 15
   phi(qmc72) = 52 psi(qmc72) = 52
   phi(qmc73) = 89 psi(qmc73) = 89
   phi(qmc74) = 48 psi(qmc74) = 48
   phi(qmc75) = 53 psi(qmc75) = 53
   phi(qmc76) = 30 psi(qmc76) = 30
   phi(qmc77) = 85 psi(qmc77) = 85
   phi(qmc78) = 26 psi(qmc78) = 26
   phi(qmc79) = 81 psi(qmc79) = 81
   phi(qmc80) = 21 psi(qmc80) = 21
   phi(qmc81) = 86 psi(qmc81) = 86
   phi(qmc82) = 22 psi(qmc82) = 22
   phi(qmc83) = 17 psi(qmc83) = 17
   phi(qmc84) = 27 psi(qmc84) = 27
   phi(qmc85) = 54 psi(qmc85) = 54
   phi(qmc86) = 13 psi(qmc86) = 13
   phi(qmc87) = 55 psi(qmc87) = 55
   phi(qmc88) = 50 psi(qmc88) = 50
   phi(qmc89) = 60 psi(qmc89) = 60
   phi(qmc90) = 87 psi(qmc90) = 87
   phi(qmc91) = 46 psi(qmc91) = 46
   phi(qmc92) = 1 psi(qmc92) = 1
   phi(qmc93) = 28 psi(qmc93) = 28
   phi(qmc94) = 83 psi(qmc94) = 83
   phi(qmc95) = 93 psi(qmc95) = 93
   phi(qmc96) = 24 psi(qmc96) = 24
  
options
	interpret_as_algebra = true
}

