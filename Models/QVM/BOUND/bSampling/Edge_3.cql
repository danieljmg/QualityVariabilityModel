# File name: EDGE_3.cql
# (Copyright) Author: Daniel-Jesus Munoz
# Date created: 06/05/2024
# Version: CQL IDE 5/2024 + Java JDK 17.0.11
# Description: EDGE System SPL modelled in CQL Variant-Wise Sampling 3

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
    qv1 qv2 qv3 qv4 qv5 qv6 : Qv # Unique instances
    qd1 : Qd # Unique instances
    qs1 qs2 qs3 qs4 qs5 qs6 : Qs # Unique instances

  # Virtual arrows instances
    qa1 qa2 qa3 qa4 qa5 qa6 : QAs 
    cc1 cc2 cc3 cc4 cc5 cc6 cc7 cc8 cc9 cc10 cc11 cc12 cc13 cc14 cc15 cc16 cc17 cc18 : CCs 
    qmc1 qmc2 qmc3 : QMC


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
  


  # Variant-wise Quality Names and Domains
   name(qn1) = Time
   name(qn2) = Energy
  
   domain(qd1) = String
  

  # Quality Values
   value(qv1) = 415
   value(qv2) = 245
   value(qv3) = 394
   value(qv4) = 958
   value(qv5) = 298
   value(qv6) = 954
  

  # Qualities
   name(qs1) = qn1 value(qs1) = qv2 domain(qs1) = qd1
   name(qs2) = qn1 value(qs2) = qv3 domain(qs2) = qd1
   name(qs3) = qn1 value(qs3) = qv5 domain(qs3) = qd1
   name(qs4) = qn2 value(qs4) = qv6 domain(qs4) = qd1
   name(qs5) = qn2 value(qs5) = qv1 domain(qs5) = qd1
   name(qs6) = qn2 value(qs6) = qv4 domain(qs6) = qd1
  

  # QAs Sets
   id(qa1) = 1 qualities(qa1) = qs1
   id(qa2) = 1 qualities(qa2) = qs4
   id(qa3) = 2 qualities(qa3) = qs3
   id(qa4) = 2 qualities(qa4) = qs6
   id(qa5) = 3 qualities(qa5) = qs2
   id(qa6) = 3 qualities(qa6) = qs5
  

  # CC/QAs Linkage
   phi(qmc1) = 1 psi(qmc1) = 1
   phi(qmc2) = 3 psi(qmc2) = 3
   phi(qmc3) = 2 psi(qmc3) = 2
   
options
	interpret_as_algebra = true
  
}
