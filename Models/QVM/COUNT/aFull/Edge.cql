# File name: EDGE.cql
# (Copyright) Author: Daniel-Jesus Munoz
# Date created: 06/05/2024
# Version: CQL IDE 5/2024 + Java JDK 17.0.11
# Description: EDGE System SPL modelled in CQL

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
    Cost: Feature -> Integer
    Security: Feature -> String
    
  
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
    f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 : Feature
  
  # Quality Model
    qn1 qn2 : Qn # Unique instances
    qv1 qv2 qv3 qv4 qv5 qv6 qv7 qv8 qv9 qv10 qv11 qv12 qv13 qv14 qv15 qv16 qv17 qv18 qv19 qv20 qv21 qv22 qv23 qv24 qv25 qv26 qv27 qv28 qv29 qv30 qv31 qv32 qv33 qv34 qv35 qv36 qv37 qv38 qv39 qv40 qv41 qv42 qv43 qv44 qv45 qv46 qv47 qv48 qv49 qv50 qv51 qv52 qv53 qv54 qv55 qv56 qv57 qv58 qv59 qv60 qv61 qv62 qv63 qv64 qv65 qv66 qv67 qv68 qv69 qv70 qv71 qv72 qv73 qv74 qv75 qv76 qv77 qv78 qv79 qv80 qv81 qv82 qv83 qv84 qv85 qv86 qv87 qv88 qv89 qv90 qv91 qv92 qv93 qv94 qv95 qv96 qv97 qv98 qv99 qv100 qv101 qv102 qv103 qv104 qv105 qv106 qv107 qv108 qv109 qv110 qv111 qv112 qv113 qv114 qv115 qv116 qv117 qv118 : Qv # Unique instances
    qd1 : Qd # Unique instances
    qs1 qs2 qs3 qs4 qs5 qs6 qs7 qs8 qs9 qs10 qs11 qs12 qs13 qs14 qs15 qs16 qs17 qs18 qs19 qs20 qs21 qs22 qs23 qs24 qs25 qs26 qs27 qs28 qs29 qs30 qs31 qs32 qs33 qs34 qs35 qs36 qs37 qs38 qs39 qs40 qs41 qs42 qs43 qs44 qs45 qs46 qs47 qs48 qs49 qs50 qs51 qs52 qs53 qs54 qs55 qs56 qs57 qs58 qs59 qs60 qs61 qs62 qs63 qs64 qs65 qs66 qs67 qs68 qs69 qs70 qs71 qs72 qs73 qs74 qs75 qs76 qs77 qs78 qs79 qs80 qs81 qs82 qs83 qs84 qs85 qs86 qs87 qs88 qs89 qs90 qs91 qs92 qs93 qs94 qs95 qs96 qs97 qs98 qs99 qs100 qs101 qs102 qs103 qs104 qs105 qs106 qs107 qs108 qs109 qs110 qs111 qs112 qs113 qs114 qs115 qs116 qs117 qs118 qs119 qs120 qs121 qs122 : Qs # Unique instances

  # Virtual arrows instances
    qa1 qa2 qa3 qa4 qa5 qa6 qa7 qa8 qa9 qa10 qa11 qa12 qa13 qa14 qa15 qa16 qa17 qa18 qa19 qa20 qa21 qa22 qa23 qa24 qa25 qa26 qa27 qa28 qa29 qa30 qa31 qa32 qa33 qa34 qa35 qa36 qa37 qa38 qa39 qa40 qa41 qa42 qa43 qa44 qa45 qa46 qa47 qa48 qa49 qa50 qa51 qa52 qa53 qa54 qa55 qa56 qa57 qa58 qa59 qa60 qa61 qa62 qa63 qa64 qa65 qa66 qa67 qa68 qa69 qa70 qa71 qa72 qa73 qa74 qa75 qa76 qa77 qa78 qa79 qa80 qa81 qa82 qa83 qa84 qa85 qa86 qa87 qa88 qa89 qa90 qa91 qa92 qa93 qa94 qa95 qa96 qa97 qa98 qa99 qa100 qa101 qa102 qa103 qa104 qa105 qa106 qa107 qa108 qa109 qa110 qa111 qa112 qa113 qa114 qa115 qa116 qa117 qa118 qa119 qa120 qa121 qa122 qa123 qa124 qa125 qa126 : QAs 
    cc1 cc2 cc3 cc4 cc5 cc6 cc7 cc8 cc9 cc10 cc11 cc12 cc13 cc14 cc15 cc16 cc17 cc18 cc19 cc20 cc21 cc22 cc23 cc24 cc25 cc26 cc27 cc28 cc29 cc30 cc31 cc32 cc33 cc34 cc35 cc36 cc37 cc38 cc39 cc40 cc41 cc42 cc43 cc44 cc45 cc46 cc47 cc48 cc49 cc50 cc51 cc52 cc53 cc54 cc55 cc56 cc57 cc58 cc59 cc60 cc61 cc62 cc63 cc64 cc65 cc66 cc67 cc68 cc69 cc70 cc71 cc72 cc73 cc74 cc75 cc76 cc77 cc78 cc79 cc80 cc81 cc82 cc83 cc84 cc85 cc86 cc87 cc88 cc89 cc90 cc91 cc92 cc93 cc94 cc95 cc96 cc97 cc98 cc99 cc100 cc101 cc102 cc103 cc104 cc105 cc106 cc107 cc108 cc109 cc110 cc111 cc112 cc113 cc114 cc115 cc116 cc117 cc118 cc119 cc120 cc121 cc122 cc123 cc124 cc125 cc126 cc127 cc128 cc129 cc130 cc131 cc132 cc133 cc134 cc135 cc136 cc137 cc138 cc139 cc140 cc141 cc142 cc143 cc144 cc145 cc146 cc147 cc148 cc149 cc150 cc151 cc152 cc153 cc154 cc155 cc156 cc157 cc158 cc159 cc160 cc161 cc162 cc163 cc164 cc165 cc166 cc167 cc168 cc169 cc170 cc171 cc172 cc173 cc174 cc175 cc176 cc177 cc178 cc179 cc180 cc181 cc182 cc183 cc184 cc185 cc186 cc187 cc188 cc189 cc190 cc191 cc192 cc193 cc194 cc195 cc196 cc197 cc198 cc199 cc200 cc201 cc202 cc203 cc204 cc205 cc206 cc207 cc208 cc209 cc210 cc211 cc212 cc213 cc214 cc215 cc216 cc217 cc218 cc219 cc220 cc221 cc222 cc223 cc224 cc225 cc226 cc227 cc228 cc229 cc230 cc231 cc232 cc233 cc234 cc235 cc236 cc237 cc238 cc239 cc240 cc241 cc242 cc243 cc244 cc245 cc246 cc247 cc248 cc249 cc250 cc251 cc252 cc253 cc254 cc255 cc256 cc257 cc258 cc259 cc260 cc261 cc262 cc263 cc264 cc265 cc266 cc267 cc268 cc269 cc270 cc271 cc272 cc273 cc274 cc275 cc276 cc277 cc278 cc279 cc280 cc281 cc282 cc283 cc284 cc285 cc286 cc287 cc288 cc289 cc290 cc291 cc292 cc293 cc294 cc295 cc296 cc297 cc298 cc299 cc300 cc301 cc302 cc303 cc304 cc305 cc306 cc307 cc308 cc309 cc310 cc311 cc312 cc313 cc314 cc315 cc316 cc317 cc318 cc319 cc320 cc321 cc322 cc323 cc324 cc325 cc326 cc327 cc328 cc329 cc330 cc331 cc332 cc333 cc334 cc335 cc336 cc337 cc338 cc339 cc340 cc341 cc342 cc343 cc344 cc345 cc346 cc347 cc348 cc349 cc350 cc351 cc352 cc353 cc354 cc355 cc356 cc357 cc358 cc359 cc360 cc361 cc362 cc363 cc364 cc365 cc366 cc367 cc368 cc369 cc370 cc371 cc372 cc373 cc374 cc375 cc376 cc377 cc378 cc379 cc380 cc381 cc382 cc383 cc384 cc385 cc386 cc387 cc388 cc389 cc390 cc391 cc392 cc393 cc394 cc395 cc396 cc397 cc398 cc399 cc400 cc401 cc402 cc403 cc404 cc405 cc406 cc407 cc408 cc409 cc410 cc411 cc412 cc413 cc414 cc415 cc416 cc417 cc418 cc419 cc420 cc421 cc422 cc423 cc424 cc425 cc426 cc427 cc428 cc429 cc430 cc431 cc432 cc433 cc434 cc435 cc436 cc437 cc438 cc439 cc440 cc441 cc442 cc443 cc444 cc445 cc446 cc447 cc448 cc449 cc450 cc451 cc452 cc453 cc454 cc455 cc456 cc457 cc458 cc459 cc460 cc461 cc462 cc463 cc464 cc465 cc466 cc467 cc468 cc469 cc470 cc471 cc472 cc473 cc474 cc475 cc476 cc477 cc478 cc479 cc480 cc481 cc482 cc483 cc484 cc485 cc486 : CCs 
    qmc1 qmc2 qmc3 qmc4 qmc5 qmc6 qmc7 qmc8 qmc9 qmc10 qmc11 qmc12 qmc13 qmc14 qmc15 qmc16 qmc17 qmc18 qmc19 qmc20 qmc21 qmc22 qmc23 qmc24 qmc25 qmc26 qmc27 qmc28 qmc29 qmc30 qmc31 qmc32 qmc33 qmc34 qmc35 qmc36 qmc37 qmc38 qmc39 qmc40 qmc41 qmc42 qmc43 qmc44 qmc45 qmc46 qmc47 qmc48 qmc49 qmc50 qmc51 qmc52 qmc53 qmc54 qmc55 qmc56 qmc57 qmc58 qmc59 qmc60 qmc61 qmc62 qmc63 : QMC


  equations
  # Boolean features
   name(f1) = EDGE cardinality(f1) = all optionality(f1) = false parent(f1) = f1 domain(f1) = Bool 
   name(f2) = Antenna cardinality(f2) = xor optionality(f2) = true parent(f2) = f1 domain(f2) = Bool 
   name(f3) = Large cardinality(f3) = leaf optionality(f3) = false parent(f3) = f2 domain(f3) = Bool  Cost(f3) = 21
   Security(f3) = "L"
  
   name(f4) = Medium cardinality(f4) = leaf optionality(f4) = false parent(f4) = f2 domain(f4) = Bool  Cost(f4) = 12
   Security(f4) = "M"
  
   name(f5) = Small cardinality(f5) = leaf optionality(f5) = false parent(f5) = f2 domain(f5) = Bool  Cost(f5) = 10
   Security(f5) = "L"
  
   name(f6) = VNFs cardinality(f6) = xor optionality(f6) = false parent(f6) = f1 domain(f6) = Bool 
   name(f7) = Encryption cardinality(f7) = leaf optionality(f7) = false parent(f7) = f6 domain(f7) = Bool  Cost(f7) = 18
   Security(f7) = "L"
  
   name(f8) = Firewall cardinality(f8) = leaf optionality(f8) = false parent(f8) = f6 domain(f8) = Bool  Cost(f8) = 24
   Security(f8) = "L"
  
   name(f9) = Monitor cardinality(f9) = leaf optionality(f9) = false parent(f9) = f6 domain(f9) = Bool  Cost(f9) = 25
   Security(f9) = "H"
  
   name(f10) = Interface cardinality(f10) = xor optionality(f10) = false parent(f10) = f1 domain(f10) = Bool 
   name(f11) = EthernetMbps cardinality(f11) = xor optionality(f11) = false parent(f11) = f10 domain(f11) = Bool 
   name(f12) = EthernetMbps100 cardinality(f12) = leaf optionality(f12) = false parent(f12) = f11 domain(f12) = Bool  Cost(f12) = 6
   Security(f12) = "L"
  
   name(f13) = EthernetMbps10 cardinality(f13) = leaf optionality(f13) = false parent(f13) = f11 domain(f13) = Bool  Cost(f13) = 15
   Security(f13) = "M"
  
   name(f14) = EthernetMbps1 cardinality(f14) = leaf optionality(f14) = false parent(f14) = f11 domain(f14) = Bool  Cost(f14) = 17
   Security(f14) = "L"
  
   name(f15) = WiFi cardinality(f15) = xor optionality(f15) = false parent(f15) = f10 domain(f15) = Bool 
   name(f16) = GHz5 cardinality(f16) = leaf optionality(f16) = false parent(f16) = f15 domain(f16) = Bool  Cost(f16) = 19
   Security(f16) = "L"
  
   name(f17) = GHz24 cardinality(f17) = leaf optionality(f17) = false parent(f17) = f15 domain(f17) = Bool  Cost(f17) = 6
   Security(f17) = "L"
  
   name(f18) = Mobile cardinality(f18) = xor optionality(f18) = false parent(f18) = f10 domain(f18) = Bool 
   name(f19) = G6 cardinality(f19) = leaf optionality(f19) = false parent(f19) = f18 domain(f19) = Bool  Cost(f19) = 12
   Security(f19) = "M"
  
   name(f20) = G5 cardinality(f20) = leaf optionality(f20) = false parent(f20) = f18 domain(f20) = Bool  Cost(f20) = 23
   Security(f20) = "L"
  
   name(f21) = G4 cardinality(f21) = leaf optionality(f21) = false parent(f21) = f18 domain(f21) = Bool  Cost(f21) = 16
   Security(f21) = "M"
  
   name(f22) = G3 cardinality(f22) = leaf optionality(f22) = false parent(f22) = f18 domain(f22) = Bool  Cost(f22) = 7
   Security(f22) = "L"
  
  

  # Numerical features
  

  # CC Virtual Linkages
   id(cc1) = 1 feature(cc1) = f1
   id(cc2) = 1 feature(cc2) = f10
   id(cc3) = 1 feature(cc3) = f11
   id(cc4) = 1 feature(cc4) = f14
   id(cc5) = 1 feature(cc5) = f6
   id(cc6) = 1 feature(cc6) = f9
   id(cc7) = 2 feature(cc7) = f1
   id(cc8) = 2 feature(cc8) = f10
   id(cc9) = 2 feature(cc9) = f11
   id(cc10) = 2 feature(cc10) = f14
   id(cc11) = 2 feature(cc11) = f6
   id(cc12) = 2 feature(cc12) = f8
   id(cc13) = 3 feature(cc13) = f1
   id(cc14) = 3 feature(cc14) = f10
   id(cc15) = 3 feature(cc15) = f11
   id(cc16) = 3 feature(cc16) = f14
   id(cc17) = 3 feature(cc17) = f6
   id(cc18) = 3 feature(cc18) = f7
   id(cc19) = 4 feature(cc19) = f1
   id(cc20) = 4 feature(cc20) = f10
   id(cc21) = 4 feature(cc21) = f11
   id(cc22) = 4 feature(cc22) = f12
   id(cc23) = 4 feature(cc23) = f6
   id(cc24) = 4 feature(cc24) = f7
   id(cc25) = 5 feature(cc25) = f1
   id(cc26) = 5 feature(cc26) = f10
   id(cc27) = 5 feature(cc27) = f11
   id(cc28) = 5 feature(cc28) = f12
   id(cc29) = 5 feature(cc29) = f6
   id(cc30) = 5 feature(cc30) = f9
   id(cc31) = 6 feature(cc31) = f1
   id(cc32) = 6 feature(cc32) = f10
   id(cc33) = 6 feature(cc33) = f18
   id(cc34) = 6 feature(cc34) = f22
   id(cc35) = 6 feature(cc35) = f6
   id(cc36) = 6 feature(cc36) = f9
   id(cc37) = 6 feature(cc37) = f2
   id(cc38) = 6 feature(cc38) = f3
   id(cc39) = 7 feature(cc39) = f1
   id(cc40) = 7 feature(cc40) = f10
   id(cc41) = 7 feature(cc41) = f18
   id(cc42) = 7 feature(cc42) = f22
   id(cc43) = 7 feature(cc43) = f6
   id(cc44) = 7 feature(cc44) = f9
   id(cc45) = 7 feature(cc45) = f2
   id(cc46) = 7 feature(cc46) = f4
   id(cc47) = 8 feature(cc47) = f1
   id(cc48) = 8 feature(cc48) = f10
   id(cc49) = 8 feature(cc49) = f18
   id(cc50) = 8 feature(cc50) = f22
   id(cc51) = 8 feature(cc51) = f6
   id(cc52) = 8 feature(cc52) = f7
   id(cc53) = 8 feature(cc53) = f2
   id(cc54) = 8 feature(cc54) = f4
   id(cc55) = 9 feature(cc55) = f1
   id(cc56) = 9 feature(cc56) = f10
   id(cc57) = 9 feature(cc57) = f18
   id(cc58) = 9 feature(cc58) = f22
   id(cc59) = 9 feature(cc59) = f6
   id(cc60) = 9 feature(cc60) = f7
   id(cc61) = 9 feature(cc61) = f2
   id(cc62) = 9 feature(cc62) = f5
   id(cc63) = 10 feature(cc63) = f1
   id(cc64) = 10 feature(cc64) = f10
   id(cc65) = 10 feature(cc65) = f18
   id(cc66) = 10 feature(cc66) = f19
   id(cc67) = 10 feature(cc67) = f6
   id(cc68) = 10 feature(cc68) = f7
   id(cc69) = 10 feature(cc69) = f2
   id(cc70) = 10 feature(cc70) = f5
   id(cc71) = 11 feature(cc71) = f1
   id(cc72) = 11 feature(cc72) = f10
   id(cc73) = 11 feature(cc73) = f18
   id(cc74) = 11 feature(cc74) = f21
   id(cc75) = 11 feature(cc75) = f6
   id(cc76) = 11 feature(cc76) = f7
   id(cc77) = 11 feature(cc77) = f2
   id(cc78) = 11 feature(cc78) = f5
   id(cc79) = 12 feature(cc79) = f1
   id(cc80) = 12 feature(cc80) = f10
   id(cc81) = 12 feature(cc81) = f18
   id(cc82) = 12 feature(cc82) = f21
   id(cc83) = 12 feature(cc83) = f6
   id(cc84) = 12 feature(cc84) = f9
   id(cc85) = 12 feature(cc85) = f2
   id(cc86) = 12 feature(cc86) = f5
   id(cc87) = 13 feature(cc87) = f1
   id(cc88) = 13 feature(cc88) = f10
   id(cc89) = 13 feature(cc89) = f18
   id(cc90) = 13 feature(cc90) = f20
   id(cc91) = 13 feature(cc91) = f6
   id(cc92) = 13 feature(cc92) = f9
   id(cc93) = 13 feature(cc93) = f2
   id(cc94) = 13 feature(cc94) = f5
   id(cc95) = 14 feature(cc95) = f1
   id(cc96) = 14 feature(cc96) = f10
   id(cc97) = 14 feature(cc97) = f18
   id(cc98) = 14 feature(cc98) = f19
   id(cc99) = 14 feature(cc99) = f6
   id(cc100) = 14 feature(cc100) = f9
   id(cc101) = 14 feature(cc101) = f2
   id(cc102) = 14 feature(cc102) = f5
   id(cc103) = 15 feature(cc103) = f1
   id(cc104) = 15 feature(cc104) = f10
   id(cc105) = 15 feature(cc105) = f15
   id(cc106) = 15 feature(cc106) = f16
   id(cc107) = 15 feature(cc107) = f6
   id(cc108) = 15 feature(cc108) = f7
   id(cc109) = 15 feature(cc109) = f2
   id(cc110) = 15 feature(cc110) = f5
   id(cc111) = 16 feature(cc111) = f1
   id(cc112) = 16 feature(cc112) = f10
   id(cc113) = 16 feature(cc113) = f15
   id(cc114) = 16 feature(cc114) = f17
   id(cc115) = 16 feature(cc115) = f6
   id(cc116) = 16 feature(cc116) = f7
   id(cc117) = 16 feature(cc117) = f2
   id(cc118) = 16 feature(cc118) = f5
   id(cc119) = 17 feature(cc119) = f1
   id(cc120) = 17 feature(cc120) = f10
   id(cc121) = 17 feature(cc121) = f15
   id(cc122) = 17 feature(cc122) = f17
   id(cc123) = 17 feature(cc123) = f6
   id(cc124) = 17 feature(cc124) = f8
   id(cc125) = 17 feature(cc125) = f2
   id(cc126) = 17 feature(cc126) = f5
   id(cc127) = 18 feature(cc127) = f1
   id(cc128) = 18 feature(cc128) = f10
   id(cc129) = 18 feature(cc129) = f15
   id(cc130) = 18 feature(cc130) = f16
   id(cc131) = 18 feature(cc131) = f6
   id(cc132) = 18 feature(cc132) = f8
   id(cc133) = 18 feature(cc133) = f2
   id(cc134) = 18 feature(cc134) = f5
   id(cc135) = 19 feature(cc135) = f1
   id(cc136) = 19 feature(cc136) = f10
   id(cc137) = 19 feature(cc137) = f15
   id(cc138) = 19 feature(cc138) = f16
   id(cc139) = 19 feature(cc139) = f6
   id(cc140) = 19 feature(cc140) = f9
   id(cc141) = 19 feature(cc141) = f2
   id(cc142) = 19 feature(cc142) = f5
   id(cc143) = 20 feature(cc143) = f1
   id(cc144) = 20 feature(cc144) = f10
   id(cc145) = 20 feature(cc145) = f18
   id(cc146) = 20 feature(cc146) = f22
   id(cc147) = 20 feature(cc147) = f6
   id(cc148) = 20 feature(cc148) = f9
   id(cc149) = 20 feature(cc149) = f2
   id(cc150) = 20 feature(cc150) = f5
   id(cc151) = 21 feature(cc151) = f1
   id(cc152) = 21 feature(cc152) = f10
   id(cc153) = 21 feature(cc153) = f15
   id(cc154) = 21 feature(cc154) = f17
   id(cc155) = 21 feature(cc155) = f6
   id(cc156) = 21 feature(cc156) = f9
   id(cc157) = 21 feature(cc157) = f2
   id(cc158) = 21 feature(cc158) = f5
   id(cc159) = 22 feature(cc159) = f1
   id(cc160) = 22 feature(cc160) = f10
   id(cc161) = 22 feature(cc161) = f15
   id(cc162) = 22 feature(cc162) = f16
   id(cc163) = 22 feature(cc163) = f6
   id(cc164) = 22 feature(cc164) = f9
   id(cc165) = 22 feature(cc165) = f2
   id(cc166) = 22 feature(cc166) = f4
   id(cc167) = 23 feature(cc167) = f1
   id(cc168) = 23 feature(cc168) = f10
   id(cc169) = 23 feature(cc169) = f15
   id(cc170) = 23 feature(cc170) = f16
   id(cc171) = 23 feature(cc171) = f6
   id(cc172) = 23 feature(cc172) = f9
   id(cc173) = 23 feature(cc173) = f2
   id(cc174) = 23 feature(cc174) = f3
   id(cc175) = 24 feature(cc175) = f1
   id(cc176) = 24 feature(cc176) = f10
   id(cc177) = 24 feature(cc177) = f11
   id(cc178) = 24 feature(cc178) = f13
   id(cc179) = 24 feature(cc179) = f6
   id(cc180) = 24 feature(cc180) = f9
   id(cc181) = 25 feature(cc181) = f1
   id(cc182) = 25 feature(cc182) = f10
   id(cc183) = 25 feature(cc183) = f15
   id(cc184) = 25 feature(cc184) = f17
   id(cc185) = 25 feature(cc185) = f6
   id(cc186) = 25 feature(cc186) = f9
   id(cc187) = 25 feature(cc187) = f2
   id(cc188) = 25 feature(cc188) = f3
   id(cc189) = 26 feature(cc189) = f1
   id(cc190) = 26 feature(cc190) = f10
   id(cc191) = 26 feature(cc191) = f15
   id(cc192) = 26 feature(cc192) = f17
   id(cc193) = 26 feature(cc193) = f6
   id(cc194) = 26 feature(cc194) = f9
   id(cc195) = 26 feature(cc195) = f2
   id(cc196) = 26 feature(cc196) = f4
   id(cc197) = 27 feature(cc197) = f1
   id(cc198) = 27 feature(cc198) = f10
   id(cc199) = 27 feature(cc199) = f15
   id(cc200) = 27 feature(cc200) = f17
   id(cc201) = 27 feature(cc201) = f6
   id(cc202) = 27 feature(cc202) = f8
   id(cc203) = 27 feature(cc203) = f2
   id(cc204) = 27 feature(cc204) = f4
   id(cc205) = 28 feature(cc205) = f1
   id(cc206) = 28 feature(cc206) = f10
   id(cc207) = 28 feature(cc207) = f15
   id(cc208) = 28 feature(cc208) = f17
   id(cc209) = 28 feature(cc209) = f6
   id(cc210) = 28 feature(cc210) = f8
   id(cc211) = 28 feature(cc211) = f2
   id(cc212) = 28 feature(cc212) = f3
   id(cc213) = 29 feature(cc213) = f1
   id(cc214) = 29 feature(cc214) = f10
   id(cc215) = 29 feature(cc215) = f11
   id(cc216) = 29 feature(cc216) = f13
   id(cc217) = 29 feature(cc217) = f6
   id(cc218) = 29 feature(cc218) = f8
   id(cc219) = 30 feature(cc219) = f1
   id(cc220) = 30 feature(cc220) = f10
   id(cc221) = 30 feature(cc221) = f15
   id(cc222) = 30 feature(cc222) = f16
   id(cc223) = 30 feature(cc223) = f6
   id(cc224) = 30 feature(cc224) = f8
   id(cc225) = 30 feature(cc225) = f2
   id(cc226) = 30 feature(cc226) = f4
   id(cc227) = 31 feature(cc227) = f1
   id(cc228) = 31 feature(cc228) = f10
   id(cc229) = 31 feature(cc229) = f15
   id(cc230) = 31 feature(cc230) = f16
   id(cc231) = 31 feature(cc231) = f6
   id(cc232) = 31 feature(cc232) = f8
   id(cc233) = 31 feature(cc233) = f2
   id(cc234) = 31 feature(cc234) = f3
   id(cc235) = 32 feature(cc235) = f1
   id(cc236) = 32 feature(cc236) = f10
   id(cc237) = 32 feature(cc237) = f15
   id(cc238) = 32 feature(cc238) = f16
   id(cc239) = 32 feature(cc239) = f6
   id(cc240) = 32 feature(cc240) = f7
   id(cc241) = 32 feature(cc241) = f2
   id(cc242) = 32 feature(cc242) = f3
   id(cc243) = 33 feature(cc243) = f1
   id(cc244) = 33 feature(cc244) = f10
   id(cc245) = 33 feature(cc245) = f15
   id(cc246) = 33 feature(cc246) = f16
   id(cc247) = 33 feature(cc247) = f6
   id(cc248) = 33 feature(cc248) = f7
   id(cc249) = 33 feature(cc249) = f2
   id(cc250) = 33 feature(cc250) = f4
   id(cc251) = 34 feature(cc251) = f1
   id(cc252) = 34 feature(cc252) = f10
   id(cc253) = 34 feature(cc253) = f11
   id(cc254) = 34 feature(cc254) = f13
   id(cc255) = 34 feature(cc255) = f6
   id(cc256) = 34 feature(cc256) = f7
   id(cc257) = 35 feature(cc257) = f1
   id(cc258) = 35 feature(cc258) = f10
   id(cc259) = 35 feature(cc259) = f15
   id(cc260) = 35 feature(cc260) = f17
   id(cc261) = 35 feature(cc261) = f6
   id(cc262) = 35 feature(cc262) = f7
   id(cc263) = 35 feature(cc263) = f2
   id(cc264) = 35 feature(cc264) = f3
   id(cc265) = 36 feature(cc265) = f1
   id(cc266) = 36 feature(cc266) = f10
   id(cc267) = 36 feature(cc267) = f15
   id(cc268) = 36 feature(cc268) = f17
   id(cc269) = 36 feature(cc269) = f6
   id(cc270) = 36 feature(cc270) = f7
   id(cc271) = 36 feature(cc271) = f2
   id(cc272) = 36 feature(cc272) = f4
   id(cc273) = 37 feature(cc273) = f1
   id(cc274) = 37 feature(cc274) = f10
   id(cc275) = 37 feature(cc275) = f18
   id(cc276) = 37 feature(cc276) = f22
   id(cc277) = 37 feature(cc277) = f6
   id(cc278) = 37 feature(cc278) = f7
   id(cc279) = 37 feature(cc279) = f2
   id(cc280) = 37 feature(cc280) = f3
   id(cc281) = 38 feature(cc281) = f1
   id(cc282) = 38 feature(cc282) = f10
   id(cc283) = 38 feature(cc283) = f18
   id(cc284) = 38 feature(cc284) = f20
   id(cc285) = 38 feature(cc285) = f6
   id(cc286) = 38 feature(cc286) = f7
   id(cc287) = 38 feature(cc287) = f2
   id(cc288) = 38 feature(cc288) = f3
   id(cc289) = 39 feature(cc289) = f1
   id(cc290) = 39 feature(cc290) = f10
   id(cc291) = 39 feature(cc291) = f18
   id(cc292) = 39 feature(cc292) = f21
   id(cc293) = 39 feature(cc293) = f6
   id(cc294) = 39 feature(cc294) = f7
   id(cc295) = 39 feature(cc295) = f2
   id(cc296) = 39 feature(cc296) = f3
   id(cc297) = 40 feature(cc297) = f1
   id(cc298) = 40 feature(cc298) = f10
   id(cc299) = 40 feature(cc299) = f18
   id(cc300) = 40 feature(cc300) = f19
   id(cc301) = 40 feature(cc301) = f6
   id(cc302) = 40 feature(cc302) = f7
   id(cc303) = 40 feature(cc303) = f2
   id(cc304) = 40 feature(cc304) = f3
   id(cc305) = 41 feature(cc305) = f1
   id(cc306) = 41 feature(cc306) = f10
   id(cc307) = 41 feature(cc307) = f18
   id(cc308) = 41 feature(cc308) = f19
   id(cc309) = 41 feature(cc309) = f6
   id(cc310) = 41 feature(cc310) = f9
   id(cc311) = 41 feature(cc311) = f2
   id(cc312) = 41 feature(cc312) = f3
   id(cc313) = 42 feature(cc313) = f1
   id(cc314) = 42 feature(cc314) = f10
   id(cc315) = 42 feature(cc315) = f18
   id(cc316) = 42 feature(cc316) = f20
   id(cc317) = 42 feature(cc317) = f6
   id(cc318) = 42 feature(cc318) = f9
   id(cc319) = 42 feature(cc319) = f2
   id(cc320) = 42 feature(cc320) = f3
   id(cc321) = 43 feature(cc321) = f1
   id(cc322) = 43 feature(cc322) = f10
   id(cc323) = 43 feature(cc323) = f18
   id(cc324) = 43 feature(cc324) = f21
   id(cc325) = 43 feature(cc325) = f6
   id(cc326) = 43 feature(cc326) = f9
   id(cc327) = 43 feature(cc327) = f2
   id(cc328) = 43 feature(cc328) = f3
   id(cc329) = 44 feature(cc329) = f1
   id(cc330) = 44 feature(cc330) = f10
   id(cc331) = 44 feature(cc331) = f18
   id(cc332) = 44 feature(cc332) = f21
   id(cc333) = 44 feature(cc333) = f6
   id(cc334) = 44 feature(cc334) = f8
   id(cc335) = 44 feature(cc335) = f2
   id(cc336) = 44 feature(cc336) = f3
   id(cc337) = 45 feature(cc337) = f1
   id(cc338) = 45 feature(cc338) = f10
   id(cc339) = 45 feature(cc339) = f18
   id(cc340) = 45 feature(cc340) = f22
   id(cc341) = 45 feature(cc341) = f6
   id(cc342) = 45 feature(cc342) = f8
   id(cc343) = 45 feature(cc343) = f2
   id(cc344) = 45 feature(cc344) = f3
   id(cc345) = 46 feature(cc345) = f1
   id(cc346) = 46 feature(cc346) = f10
   id(cc347) = 46 feature(cc347) = f18
   id(cc348) = 46 feature(cc348) = f20
   id(cc349) = 46 feature(cc349) = f6
   id(cc350) = 46 feature(cc350) = f8
   id(cc351) = 46 feature(cc351) = f2
   id(cc352) = 46 feature(cc352) = f3
   id(cc353) = 47 feature(cc353) = f1
   id(cc354) = 47 feature(cc354) = f10
   id(cc355) = 47 feature(cc355) = f18
   id(cc356) = 47 feature(cc356) = f19
   id(cc357) = 47 feature(cc357) = f6
   id(cc358) = 47 feature(cc358) = f8
   id(cc359) = 47 feature(cc359) = f2
   id(cc360) = 47 feature(cc360) = f3
   id(cc361) = 48 feature(cc361) = f1
   id(cc362) = 48 feature(cc362) = f10
   id(cc363) = 48 feature(cc363) = f18
   id(cc364) = 48 feature(cc364) = f19
   id(cc365) = 48 feature(cc365) = f6
   id(cc366) = 48 feature(cc366) = f8
   id(cc367) = 48 feature(cc367) = f2
   id(cc368) = 48 feature(cc368) = f4
   id(cc369) = 49 feature(cc369) = f1
   id(cc370) = 49 feature(cc370) = f10
   id(cc371) = 49 feature(cc371) = f18
   id(cc372) = 49 feature(cc372) = f22
   id(cc373) = 49 feature(cc373) = f6
   id(cc374) = 49 feature(cc374) = f8
   id(cc375) = 49 feature(cc375) = f2
   id(cc376) = 49 feature(cc376) = f4
   id(cc377) = 50 feature(cc377) = f1
   id(cc378) = 50 feature(cc378) = f10
   id(cc379) = 50 feature(cc379) = f18
   id(cc380) = 50 feature(cc380) = f20
   id(cc381) = 50 feature(cc381) = f6
   id(cc382) = 50 feature(cc382) = f8
   id(cc383) = 50 feature(cc383) = f2
   id(cc384) = 50 feature(cc384) = f4
   id(cc385) = 51 feature(cc385) = f1
   id(cc386) = 51 feature(cc386) = f10
   id(cc387) = 51 feature(cc387) = f18
   id(cc388) = 51 feature(cc388) = f21
   id(cc389) = 51 feature(cc389) = f6
   id(cc390) = 51 feature(cc390) = f8
   id(cc391) = 51 feature(cc391) = f2
   id(cc392) = 51 feature(cc392) = f4
   id(cc393) = 52 feature(cc393) = f1
   id(cc394) = 52 feature(cc394) = f10
   id(cc395) = 52 feature(cc395) = f18
   id(cc396) = 52 feature(cc396) = f21
   id(cc397) = 52 feature(cc397) = f6
   id(cc398) = 52 feature(cc398) = f9
   id(cc399) = 52 feature(cc399) = f2
   id(cc400) = 52 feature(cc400) = f4
   id(cc401) = 53 feature(cc401) = f1
   id(cc402) = 53 feature(cc402) = f10
   id(cc403) = 53 feature(cc403) = f18
   id(cc404) = 53 feature(cc404) = f20
   id(cc405) = 53 feature(cc405) = f6
   id(cc406) = 53 feature(cc406) = f9
   id(cc407) = 53 feature(cc407) = f2
   id(cc408) = 53 feature(cc408) = f4
   id(cc409) = 54 feature(cc409) = f1
   id(cc410) = 54 feature(cc410) = f10
   id(cc411) = 54 feature(cc411) = f18
   id(cc412) = 54 feature(cc412) = f19
   id(cc413) = 54 feature(cc413) = f6
   id(cc414) = 54 feature(cc414) = f9
   id(cc415) = 54 feature(cc415) = f2
   id(cc416) = 54 feature(cc416) = f4
   id(cc417) = 55 feature(cc417) = f1
   id(cc418) = 55 feature(cc418) = f10
   id(cc419) = 55 feature(cc419) = f18
   id(cc420) = 55 feature(cc420) = f19
   id(cc421) = 55 feature(cc421) = f6
   id(cc422) = 55 feature(cc422) = f7
   id(cc423) = 55 feature(cc423) = f2
   id(cc424) = 55 feature(cc424) = f4
   id(cc425) = 56 feature(cc425) = f1
   id(cc426) = 56 feature(cc426) = f10
   id(cc427) = 56 feature(cc427) = f18
   id(cc428) = 56 feature(cc428) = f20
   id(cc429) = 56 feature(cc429) = f6
   id(cc430) = 56 feature(cc430) = f7
   id(cc431) = 56 feature(cc431) = f2
   id(cc432) = 56 feature(cc432) = f4
   id(cc433) = 57 feature(cc433) = f1
   id(cc434) = 57 feature(cc434) = f10
   id(cc435) = 57 feature(cc435) = f18
   id(cc436) = 57 feature(cc436) = f21
   id(cc437) = 57 feature(cc437) = f6
   id(cc438) = 57 feature(cc438) = f7
   id(cc439) = 57 feature(cc439) = f2
   id(cc440) = 57 feature(cc440) = f4
   id(cc441) = 58 feature(cc441) = f1
   id(cc442) = 58 feature(cc442) = f10
   id(cc443) = 58 feature(cc443) = f11
   id(cc444) = 58 feature(cc444) = f12
   id(cc445) = 58 feature(cc445) = f6
   id(cc446) = 58 feature(cc446) = f8
   id(cc447) = 59 feature(cc447) = f1
   id(cc448) = 59 feature(cc448) = f10
   id(cc449) = 59 feature(cc449) = f18
   id(cc450) = 59 feature(cc450) = f19
   id(cc451) = 59 feature(cc451) = f6
   id(cc452) = 59 feature(cc452) = f8
   id(cc453) = 59 feature(cc453) = f2
   id(cc454) = 59 feature(cc454) = f5
   id(cc455) = 60 feature(cc455) = f1
   id(cc456) = 60 feature(cc456) = f10
   id(cc457) = 60 feature(cc457) = f18
   id(cc458) = 60 feature(cc458) = f22
   id(cc459) = 60 feature(cc459) = f6
   id(cc460) = 60 feature(cc460) = f8
   id(cc461) = 60 feature(cc461) = f2
   id(cc462) = 60 feature(cc462) = f5
   id(cc463) = 61 feature(cc463) = f1
   id(cc464) = 61 feature(cc464) = f10
   id(cc465) = 61 feature(cc465) = f18
   id(cc466) = 61 feature(cc466) = f20
   id(cc467) = 61 feature(cc467) = f6
   id(cc468) = 61 feature(cc468) = f8
   id(cc469) = 61 feature(cc469) = f2
   id(cc470) = 61 feature(cc470) = f5
   id(cc471) = 62 feature(cc471) = f1
   id(cc472) = 62 feature(cc472) = f10
   id(cc473) = 62 feature(cc473) = f18
   id(cc474) = 62 feature(cc474) = f21
   id(cc475) = 62 feature(cc475) = f6
   id(cc476) = 62 feature(cc476) = f8
   id(cc477) = 62 feature(cc477) = f2
   id(cc478) = 62 feature(cc478) = f5
   id(cc479) = 63 feature(cc479) = f1
   id(cc480) = 63 feature(cc480) = f10
   id(cc481) = 63 feature(cc481) = f18
   id(cc482) = 63 feature(cc482) = f20
   id(cc483) = 63 feature(cc483) = f6
   id(cc484) = 63 feature(cc484) = f7
   id(cc485) = 63 feature(cc485) = f2
   id(cc486) = 63 feature(cc486) = f5
  


  # Variant-wise Quality Names and Domains
   name(qn1) = Energy
   name(qn2) = Time
  
   domain(qd1) = String
  

  # Quality Values
   value(qv1) = 347
   value(qv2) = 115
   value(qv3) = 843
   value(qv4) = 697
   value(qv5) = 648
   value(qv6) = 664
   value(qv7) = 222
   value(qv8) = 684
   value(qv9) = 671
   value(qv10) = 870
   value(qv11) = 656
   value(qv12) = 793
   value(qv13) = 123
   value(qv14) = 170
   value(qv15) = 450
   value(qv16) = 349
   value(qv17) = 600
   value(qv18) = 2
   value(qv19) = 544
   value(qv20) = 714
   value(qv21) = 829
   value(qv22) = 882
   value(qv23) = 943
   value(qv24) = 420
   value(qv25) = 785
   value(qv26) = 26
   value(qv27) = 891
   value(qv28) = 176
   value(qv29) = 392
   value(qv30) = 403
   value(qv31) = 253
   value(qv32) = 16
   value(qv33) = 709
   value(qv34) = 266
   value(qv35) = 953
   value(qv36) = 534
   value(qv37) = 550
   value(qv38) = 579
   value(qv39) = 198
   value(qv40) = 692
   value(qv41) = 189
   value(qv42) = 42
   value(qv43) = 930
   value(qv44) = 724
   value(qv45) = 779
   value(qv46) = 345
   value(qv47) = 152
   value(qv48) = 845
   value(qv49) = 211
   value(qv50) = 262
   value(qv51) = 145
   value(qv52) = 558
   value(qv53) = 108
   value(qv54) = 972
   value(qv55) = 746
   value(qv56) = 60
   value(qv57) = 627
   value(qv58) = 630
   value(qv59) = 585
   value(qv60) = 360
   value(qv61) = 589
   value(qv62) = 369
   value(qv63) = 681
   value(qv64) = 66
   value(qv65) = 31
   value(qv66) = 100
   value(qv67) = 835
   value(qv68) = 174
   value(qv69) = 56
   value(qv70) = 132
   value(qv71) = 379
   value(qv72) = 246
   value(qv73) = 342
   value(qv74) = 104
   value(qv75) = 848
   value(qv76) = 364
   value(qv77) = 832
   value(qv78) = 143
   value(qv79) = 691
   value(qv80) = 25
   value(qv81) = 956
   value(qv82) = 351
   value(qv83) = 129
   value(qv84) = 941
   value(qv85) = 288
   value(qv86) = 43
   value(qv87) = 976
   value(qv88) = 606
   value(qv89) = 165
   value(qv90) = 370
   value(qv91) = 871
   value(qv92) = 883
   value(qv93) = 337
   value(qv94) = 993
   value(qv95) = 444
   value(qv96) = 273
   value(qv97) = 321
   value(qv98) = 659
   value(qv99) = 296
   value(qv100) = 802
   value(qv101) = 640
   value(qv102) = 493
   value(qv103) = 281
   value(qv104) = 781
   value(qv105) = 30
   value(qv106) = 6
   value(qv107) = 119
   value(qv108) = 854
   value(qv109) = 998
   value(qv110) = 763
   value(qv111) = 46
   value(qv112) = 251
   value(qv113) = 546
   value(qv114) = 344
   value(qv115) = 193
   value(qv116) = 456
   value(qv117) = 67
   value(qv118) = 294
  

  # Qualities
   name(qs1) = qn1 value(qs1) = qv109 domain(qs1) = qd1
   name(qs2) = qn2 value(qs2) = qv66 domain(qs2) = qd1
   name(qs3) = qn1 value(qs3) = qv72 domain(qs3) = qd1
   name(qs4) = qn1 value(qs4) = qv27 domain(qs4) = qd1
   name(qs5) = qn2 value(qs5) = qv28 domain(qs5) = qd1
   name(qs6) = qn1 value(qs6) = qv92 domain(qs6) = qd1
   name(qs7) = qn1 value(qs7) = qv17 domain(qs7) = qd1
   name(qs8) = qn1 value(qs8) = qv93 domain(qs8) = qd1
   name(qs9) = qn2 value(qs9) = qv112 domain(qs9) = qd1
   name(qs10) = qn2 value(qs10) = qv63 domain(qs10) = qd1
   name(qs11) = qn2 value(qs11) = qv108 domain(qs11) = qd1
   name(qs12) = qn2 value(qs12) = qv86 domain(qs12) = qd1
   name(qs13) = qn2 value(qs13) = qv51 domain(qs13) = qd1
   name(qs14) = qn2 value(qs14) = qv70 domain(qs14) = qd1
   name(qs15) = qn1 value(qs15) = qv41 domain(qs15) = qd1
   name(qs16) = qn1 value(qs16) = qv4 domain(qs16) = qd1
   name(qs17) = qn2 value(qs17) = qv18 domain(qs17) = qd1
   name(qs18) = qn2 value(qs18) = qv56 domain(qs18) = qd1
   name(qs19) = qn2 value(qs19) = qv12 domain(qs19) = qd1
   name(qs20) = qn1 value(qs20) = qv9 domain(qs20) = qd1
   name(qs21) = qn2 value(qs21) = qv48 domain(qs21) = qd1
   name(qs22) = qn2 value(qs22) = qv65 domain(qs22) = qd1
   name(qs23) = qn1 value(qs23) = qv98 domain(qs23) = qd1
   name(qs24) = qn2 value(qs24) = qv47 domain(qs24) = qd1
   name(qs25) = qn2 value(qs25) = qv1 domain(qs25) = qd1
   name(qs26) = qn2 value(qs26) = qv2 domain(qs26) = qd1
   name(qs27) = qn1 value(qs27) = qv111 domain(qs27) = qd1
   name(qs28) = qn2 value(qs28) = qv77 domain(qs28) = qd1
   name(qs29) = qn2 value(qs29) = qv11 domain(qs29) = qd1
   name(qs30) = qn1 value(qs30) = qv57 domain(qs30) = qd1
   name(qs31) = qn2 value(qs31) = qv35 domain(qs31) = qd1
   name(qs32) = qn1 value(qs32) = qv68 domain(qs32) = qd1
   name(qs33) = qn2 value(qs33) = qv74 domain(qs33) = qd1
   name(qs34) = qn2 value(qs34) = qv61 domain(qs34) = qd1
   name(qs35) = qn1 value(qs35) = qv88 domain(qs35) = qd1
   name(qs36) = qn2 value(qs36) = qv32 domain(qs36) = qd1
   name(qs37) = qn2 value(qs37) = qv90 domain(qs37) = qd1
   name(qs38) = qn2 value(qs38) = qv94 domain(qs38) = qd1
   name(qs39) = qn2 value(qs39) = qv110 domain(qs39) = qd1
   name(qs40) = qn1 value(qs40) = qv42 domain(qs40) = qd1
   name(qs41) = qn2 value(qs41) = qv99 domain(qs41) = qd1
   name(qs42) = qn2 value(qs42) = qv38 domain(qs42) = qd1
   name(qs43) = qn1 value(qs43) = qv67 domain(qs43) = qd1
   name(qs44) = qn1 value(qs44) = qv30 domain(qs44) = qd1
   name(qs45) = qn2 value(qs45) = qv10 domain(qs45) = qd1
   name(qs46) = qn1 value(qs46) = qv21 domain(qs46) = qd1
   name(qs47) = qn2 value(qs47) = qv16 domain(qs47) = qd1
   name(qs48) = qn1 value(qs48) = qv78 domain(qs48) = qd1
   name(qs49) = qn2 value(qs49) = qv44 domain(qs49) = qd1
   name(qs50) = qn2 value(qs50) = qv95 domain(qs50) = qd1
   name(qs51) = qn1 value(qs51) = qv54 domain(qs51) = qd1
   name(qs52) = qn1 value(qs52) = qv82 domain(qs52) = qd1
   name(qs53) = qn1 value(qs53) = qv31 domain(qs53) = qd1
   name(qs54) = qn2 value(qs54) = qv43 domain(qs54) = qd1
   name(qs55) = qn2 value(qs55) = qv113 domain(qs55) = qd1
   name(qs56) = qn1 value(qs56) = qv3 domain(qs56) = qd1
   name(qs57) = qn1 value(qs57) = qv22 domain(qs57) = qd1
   name(qs58) = qn1 value(qs58) = qv49 domain(qs58) = qd1
   name(qs59) = qn1 value(qs59) = qv108 domain(qs59) = qd1
   name(qs60) = qn2 value(qs60) = qv116 domain(qs60) = qd1
   name(qs61) = qn2 value(qs61) = qv50 domain(qs61) = qd1
   name(qs62) = qn2 value(qs62) = qv114 domain(qs62) = qd1
   name(qs63) = qn1 value(qs63) = qv117 domain(qs63) = qd1
   name(qs64) = qn1 value(qs64) = qv79 domain(qs64) = qd1
   name(qs65) = qn1 value(qs65) = qv106 domain(qs65) = qd1
   name(qs66) = qn1 value(qs66) = qv56 domain(qs66) = qd1
   name(qs67) = qn2 value(qs67) = qv84 domain(qs67) = qd1
   name(qs68) = qn2 value(qs68) = qv45 domain(qs68) = qd1
   name(qs69) = qn2 value(qs69) = qv39 domain(qs69) = qd1
   name(qs70) = qn1 value(qs70) = qv50 domain(qs70) = qd1
   name(qs71) = qn1 value(qs71) = qv73 domain(qs71) = qd1
   name(qs72) = qn1 value(qs72) = qv20 domain(qs72) = qd1
   name(qs73) = qn2 value(qs73) = qv107 domain(qs73) = qd1
   name(qs74) = qn1 value(qs74) = qv14 domain(qs74) = qd1
   name(qs75) = qn2 value(qs75) = qv58 domain(qs75) = qd1
   name(qs76) = qn2 value(qs76) = qv37 domain(qs76) = qd1
   name(qs77) = qn2 value(qs77) = qv87 domain(qs77) = qd1
   name(qs78) = qn1 value(qs78) = qv104 domain(qs78) = qd1
   name(qs79) = qn2 value(qs79) = qv55 domain(qs79) = qd1
   name(qs80) = qn2 value(qs80) = qv81 domain(qs80) = qd1
   name(qs81) = qn1 value(qs81) = qv52 domain(qs81) = qd1
   name(qs82) = qn1 value(qs82) = qv26 domain(qs82) = qd1
   name(qs83) = qn2 value(qs83) = qv83 domain(qs83) = qd1
   name(qs84) = qn1 value(qs84) = qv6 domain(qs84) = qd1
   name(qs85) = qn1 value(qs85) = qv46 domain(qs85) = qd1
   name(qs86) = qn2 value(qs86) = qv96 domain(qs86) = qd1
   name(qs87) = qn2 value(qs87) = qv102 domain(qs87) = qd1
   name(qs88) = qn2 value(qs88) = qv101 domain(qs88) = qd1
   name(qs89) = qn1 value(qs89) = qv118 domain(qs89) = qd1
   name(qs90) = qn2 value(qs90) = qv105 domain(qs90) = qd1
   name(qs91) = qn1 value(qs91) = qv29 domain(qs91) = qd1
   name(qs92) = qn2 value(qs92) = qv60 domain(qs92) = qd1
   name(qs93) = qn1 value(qs93) = qv10 domain(qs93) = qd1
   name(qs94) = qn2 value(qs94) = qv71 domain(qs94) = qd1
   name(qs95) = qn2 value(qs95) = qv115 domain(qs95) = qd1
   name(qs96) = qn2 value(qs96) = qv97 domain(qs96) = qd1
   name(qs97) = qn1 value(qs97) = qv25 domain(qs97) = qd1
   name(qs98) = qn1 value(qs98) = qv5 domain(qs98) = qd1
   name(qs99) = qn1 value(qs99) = qv64 domain(qs99) = qd1
   name(qs100) = qn1 value(qs100) = qv75 domain(qs100) = qd1
   name(qs101) = qn1 value(qs101) = qv69 domain(qs101) = qd1
   name(qs102) = qn1 value(qs102) = qv89 domain(qs102) = qd1
   name(qs103) = qn1 value(qs103) = qv7 domain(qs103) = qd1
   name(qs104) = qn1 value(qs104) = qv13 domain(qs104) = qd1
   name(qs105) = qn2 value(qs105) = qv100 domain(qs105) = qd1
   name(qs106) = qn1 value(qs106) = qv40 domain(qs106) = qd1
   name(qs107) = qn1 value(qs107) = qv36 domain(qs107) = qd1
   name(qs108) = qn1 value(qs108) = qv85 domain(qs108) = qd1
   name(qs109) = qn2 value(qs109) = qv91 domain(qs109) = qd1
   name(qs110) = qn2 value(qs110) = qv34 domain(qs110) = qd1
   name(qs111) = qn2 value(qs111) = qv76 domain(qs111) = qd1
   name(qs112) = qn1 value(qs112) = qv19 domain(qs112) = qd1
   name(qs113) = qn1 value(qs113) = qv15 domain(qs113) = qd1
   name(qs114) = qn2 value(qs114) = qv33 domain(qs114) = qd1
   name(qs115) = qn1 value(qs115) = qv80 domain(qs115) = qd1
   name(qs116) = qn1 value(qs116) = qv24 domain(qs116) = qd1
   name(qs117) = qn1 value(qs117) = qv59 domain(qs117) = qd1
   name(qs118) = qn2 value(qs118) = qv103 domain(qs118) = qd1
   name(qs119) = qn1 value(qs119) = qv23 domain(qs119) = qd1
   name(qs120) = qn1 value(qs120) = qv8 domain(qs120) = qd1
   name(qs121) = qn2 value(qs121) = qv62 domain(qs121) = qd1
   name(qs122) = qn1 value(qs122) = qv53 domain(qs122) = qd1
  

  # QAs Sets
   id(qa1) = 1 qualities(qa1) = qs60
   id(qa2) = 1 qualities(qa2) = qs53
   id(qa3) = 2 qualities(qa3) = qs75
   id(qa4) = 2 qualities(qa4) = qs115
   id(qa5) = 3 qualities(qa5) = qs55
   id(qa6) = 3 qualities(qa6) = qs100
   id(qa7) = 4 qualities(qa7) = qs67
   id(qa8) = 4 qualities(qa8) = qs91
   id(qa9) = 5 qualities(qa9) = qs49
   id(qa10) = 5 qualities(qa10) = qs6
   id(qa11) = 6 qualities(qa11) = qs25
   id(qa12) = 6 qualities(qa12) = qs46
   id(qa13) = 7 qualities(qa13) = qs69
   id(qa14) = 7 qualities(qa14) = qs84
   id(qa15) = 8 qualities(qa15) = qs50
   id(qa16) = 8 qualities(qa16) = qs8
   id(qa17) = 9 qualities(qa17) = qs21
   id(qa18) = 9 qualities(qa18) = qs15
   id(qa19) = 10 qualities(qa19) = qs61
   id(qa20) = 10 qualities(qa20) = qs85
   id(qa21) = 11 qualities(qa21) = qs29
   id(qa22) = 11 qualities(qa22) = qs107
   id(qa23) = 12 qualities(qa23) = qs87
   id(qa24) = 12 qualities(qa24) = qs108
   id(qa25) = 13 qualities(qa25) = qs109
   id(qa26) = 13 qualities(qa26) = qs48
   id(qa27) = 14 qualities(qa27) = qs18
   id(qa28) = 14 qualities(qa28) = qs81
   id(qa29) = 15 qualities(qa29) = qs77
   id(qa30) = 15 qualities(qa30) = qs71
   id(qa31) = 16 qualities(qa31) = qs10
   id(qa32) = 16 qualities(qa32) = qs119
   id(qa33) = 17 qualities(qa33) = qs12
   id(qa34) = 17 qualities(qa34) = qs30
   id(qa35) = 18 qualities(qa35) = qs94
   id(qa36) = 18 qualities(qa36) = qs58
   id(qa37) = 19 qualities(qa37) = qs86
   id(qa38) = 19 qualities(qa38) = qs32
   id(qa39) = 20 qualities(qa39) = qs114
   id(qa40) = 20 qualities(qa40) = qs51
   id(qa41) = 21 qualities(qa41) = qs31
   id(qa42) = 21 qualities(qa42) = qs63
   id(qa43) = 22 qualities(qa43) = qs5
   id(qa44) = 22 qualities(qa44) = qs104
   id(qa45) = 23 qualities(qa45) = qs110
   id(qa46) = 23 qualities(qa46) = qs112
   id(qa47) = 24 qualities(qa47) = qs34
   id(qa48) = 24 qualities(qa48) = qs98
   id(qa49) = 25 qualities(qa49) = qs13
   id(qa50) = 25 qualities(qa50) = qs93
   id(qa51) = 26 qualities(qa51) = qs14
   id(qa52) = 26 qualities(qa52) = qs103
   id(qa53) = 27 qualities(qa53) = qs2
   id(qa54) = 27 qualities(qa54) = qs116
   id(qa55) = 28 qualities(qa55) = qs92
   id(qa56) = 28 qualities(qa56) = qs65
   id(qa57) = 29 qualities(qa57) = qs45
   id(qa58) = 29 qualities(qa58) = qs43
   id(qa59) = 30 qualities(qa59) = qs121
   id(qa60) = 30 qualities(qa60) = qs82
   id(qa61) = 31 qualities(qa61) = qs38
   id(qa62) = 31 qualities(qa62) = qs113
   id(qa63) = 32 qualities(qa63) = qs62
   id(qa64) = 32 qualities(qa64) = qs74
   id(qa65) = 33 qualities(qa65) = qs96
   id(qa66) = 33 qualities(qa66) = qs1
   id(qa67) = 34 qualities(qa67) = qs41
   id(qa68) = 34 qualities(qa68) = qs57
   id(qa69) = 35 qualities(qa69) = qs26
   id(qa70) = 35 qualities(qa70) = qs63
   id(qa71) = 36 qualities(qa71) = qs49
   id(qa72) = 36 qualities(qa72) = qs27
   id(qa73) = 37 qualities(qa73) = qs36
   id(qa74) = 37 qualities(qa74) = qs4
   id(qa75) = 38 qualities(qa75) = qs39
   id(qa76) = 38 qualities(qa76) = qs64
   id(qa77) = 39 qualities(qa77) = qs19
   id(qa78) = 39 qualities(qa78) = qs52
   id(qa79) = 40 qualities(qa79) = qs111
   id(qa80) = 40 qualities(qa80) = qs70
   id(qa81) = 41 qualities(qa81) = qs73
   id(qa82) = 41 qualities(qa82) = qs16
   id(qa83) = 42 qualities(qa83) = qs68
   id(qa84) = 42 qualities(qa84) = qs117
   id(qa85) = 43 qualities(qa85) = qs17
   id(qa86) = 43 qualities(qa86) = qs120
   id(qa87) = 44 qualities(qa87) = qs37
   id(qa88) = 44 qualities(qa88) = qs99
   id(qa89) = 45 qualities(qa89) = qs28
   id(qa90) = 45 qualities(qa90) = qs66
   id(qa91) = 46 qualities(qa91) = qs118
   id(qa92) = 46 qualities(qa92) = qs44
   id(qa93) = 47 qualities(qa93) = qs88
   id(qa94) = 47 qualities(qa94) = qs59
   id(qa95) = 48 qualities(qa95) = qs95
   id(qa96) = 48 qualities(qa96) = qs71
   id(qa97) = 49 qualities(qa97) = qs24
   id(qa98) = 49 qualities(qa98) = qs35
   id(qa99) = 50 qualities(qa99) = qs80
   id(qa100) = 50 qualities(qa100) = qs72
   id(qa101) = 51 qualities(qa101) = qs11
   id(qa102) = 51 qualities(qa102) = qs102
   id(qa103) = 52 qualities(qa103) = qs79
   id(qa104) = 52 qualities(qa104) = qs23
   id(qa105) = 53 qualities(qa105) = qs54
   id(qa106) = 53 qualities(qa106) = qs106
   id(qa107) = 54 qualities(qa107) = qs76
   id(qa108) = 54 qualities(qa108) = qs78
   id(qa109) = 55 qualities(qa109) = qs90
   id(qa110) = 55 qualities(qa110) = qs89
   id(qa111) = 56 qualities(qa111) = qs42
   id(qa112) = 56 qualities(qa112) = qs101
   id(qa113) = 57 qualities(qa113) = qs88
   id(qa114) = 57 qualities(qa114) = qs97
   id(qa115) = 58 qualities(qa115) = qs47
   id(qa116) = 58 qualities(qa116) = qs40
   id(qa117) = 59 qualities(qa117) = qs83
   id(qa118) = 59 qualities(qa118) = qs3
   id(qa119) = 60 qualities(qa119) = qs105
   id(qa120) = 60 qualities(qa120) = qs56
   id(qa121) = 61 qualities(qa121) = qs33
   id(qa122) = 61 qualities(qa122) = qs20
   id(qa123) = 62 qualities(qa123) = qs22
   id(qa124) = 62 qualities(qa124) = qs122
   id(qa125) = 63 qualities(qa125) = qs9
   id(qa126) = 63 qualities(qa126) = qs7
  

  # CC/QAs Linkage
   phi(qmc1) = 56 psi(qmc1) = 56
   phi(qmc2) = 43 psi(qmc2) = 43
   phi(qmc3) = 52 psi(qmc3) = 52
   phi(qmc4) = 61 psi(qmc4) = 61
   phi(qmc5) = 20 psi(qmc5) = 20
   phi(qmc6) = 29 psi(qmc6) = 29
   phi(qmc7) = 38 psi(qmc7) = 38
   phi(qmc8) = 33 psi(qmc8) = 33
   phi(qmc9) = 37 psi(qmc9) = 37
   phi(qmc10) = 39 psi(qmc10) = 39
   phi(qmc11) = 42 psi(qmc11) = 42
   phi(qmc12) = 2 psi(qmc12) = 2
   phi(qmc13) = 48 psi(qmc13) = 48
   phi(qmc14) = 57 psi(qmc14) = 57
   phi(qmc15) = 34 psi(qmc15) = 34
   phi(qmc16) = 11 psi(qmc16) = 11
   phi(qmc17) = 53 psi(qmc17) = 53
   phi(qmc18) = 30 psi(qmc18) = 30
   phi(qmc19) = 7 psi(qmc19) = 7
   phi(qmc20) = 16 psi(qmc20) = 16
   phi(qmc21) = 62 psi(qmc21) = 62
   phi(qmc22) = 25 psi(qmc22) = 25
   phi(qmc23) = 58 psi(qmc23) = 58
   phi(qmc24) = 26 psi(qmc24) = 26
   phi(qmc25) = 35 psi(qmc25) = 35
   phi(qmc26) = 44 psi(qmc26) = 44
   phi(qmc27) = 3 psi(qmc27) = 3
   phi(qmc28) = 12 psi(qmc28) = 12
   phi(qmc29) = 21 psi(qmc29) = 21
   phi(qmc30) = 22 psi(qmc30) = 22
   phi(qmc31) = 31 psi(qmc31) = 31
   phi(qmc32) = 40 psi(qmc32) = 40
   phi(qmc33) = 49 psi(qmc33) = 49
   phi(qmc34) = 8 psi(qmc34) = 8
   phi(qmc35) = 17 psi(qmc35) = 17
   phi(qmc36) = 27 psi(qmc36) = 27
   phi(qmc37) = 36 psi(qmc37) = 36
   phi(qmc38) = 45 psi(qmc38) = 45
   phi(qmc39) = 54 psi(qmc39) = 54
   phi(qmc40) = 63 psi(qmc40) = 63
   phi(qmc41) = 13 psi(qmc41) = 13
   phi(qmc42) = 32 psi(qmc42) = 32
   phi(qmc43) = 18 psi(qmc43) = 18
   phi(qmc44) = 55 psi(qmc44) = 55
   phi(qmc45) = 41 psi(qmc45) = 41
   phi(qmc46) = 50 psi(qmc46) = 50
   phi(qmc47) = 59 psi(qmc47) = 59
   phi(qmc48) = 51 psi(qmc48) = 51
   phi(qmc49) = 60 psi(qmc49) = 60
   phi(qmc50) = 4 psi(qmc50) = 4
   phi(qmc51) = 5 psi(qmc51) = 5
   phi(qmc52) = 14 psi(qmc52) = 14
   phi(qmc53) = 23 psi(qmc53) = 23
   phi(qmc54) = 9 psi(qmc54) = 9
   phi(qmc55) = 46 psi(qmc55) = 46
   phi(qmc56) = 1 psi(qmc56) = 1
   phi(qmc57) = 24 psi(qmc57) = 24
   phi(qmc58) = 10 psi(qmc58) = 10
   phi(qmc59) = 19 psi(qmc59) = 19
   phi(qmc60) = 28 psi(qmc60) = 28
   phi(qmc61) = 6 psi(qmc61) = 6
   phi(qmc62) = 47 psi(qmc62) = 47
   phi(qmc63) = 15 psi(qmc63) = 15
  
options
	interpret_as_algebra = true
	
}

# RES Category for COUNT reasoning operation
schema RESCOUNT = literal : Ty {
 entities
  COUNT 
 attributes
  "# Measured Configurations": COUNT -> Integer

}

query COUNT = literal : VariabilityModelCategory -> RESCOUNT {
 entity 
  COUNT -> {
   attributes
    "# Measured Configurations" -> from CCID : QMC
   						where
						   and(ge(CCID.phi, 0), ge(CCID.psi, 0)) = True
  	    		 		return
  	    		 			1
  	    		    		aggregate 0 lambda arg1 arg2. add(arg1,1)
  }
}

instance COUNTSolver = eval COUNT VariabilityModelData
