scope({c0_Cost:15, c0_Feature:15, c0_Security:15});
defaultScope(1);
intRange(-8, 7);
stringLength(16);

c0_Feature = Abstract("c0_Feature");
c0_Cost = c0_Feature.addChild("c0_Cost").withCard(1, 1);
c0_Security = c0_Feature.addChild("c0_Security").withCard(1, 1);
c0_EDGE = Abstract("c0_EDGE");
c0_Interface = c0_EDGE.addChild("c0_Interface").withCard(1, 1).withGroupCard(1, 1);
c0_Mobile = c0_Interface.addChild("c0_Mobile").withCard(0, 1).withGroupCard(1, 1);
c0_G3 = c0_Mobile.addChild("c0_G3").withCard(0, 1);
c0_G4 = c0_Mobile.addChild("c0_G4").withCard(0, 1);
c0_G5 = c0_Mobile.addChild("c0_G5").withCard(0, 1);
c0_G6 = c0_Mobile.addChild("c0_G6").withCard(0, 1);
c0_WiFi = c0_Interface.addChild("c0_WiFi").withCard(0, 1).withGroupCard(1, 1);
c0_GHz24 = c0_WiFi.addChild("c0_GHz24").withCard(0, 1);
c0_GHz5 = c0_WiFi.addChild("c0_GHz5").withCard(0, 1);
c0_EthernetMbps = c0_Interface.addChild("c0_EthernetMbps").withCard(0, 1).withGroupCard(1, 1);
c0_EthernetMbps1 = c0_EthernetMbps.addChild("c0_EthernetMbps1").withCard(0, 1);
c0_EthernetMbps10 = c0_EthernetMbps.addChild("c0_EthernetMbps10").withCard(0, 1);
c0_EthernetMbps100 = c0_EthernetMbps.addChild("c0_EthernetMbps100").withCard(0, 1);
c0_VNFs = c0_EDGE.addChild("c0_VNFs").withCard(1, 1).withGroupCard(1, 1);
c0_Monitor = c0_VNFs.addChild("c0_Monitor").withCard(0, 1);
c0_Firewall = c0_VNFs.addChild("c0_Firewall").withCard(0, 1);
c0_Encryption = c0_VNFs.addChild("c0_Encryption").withCard(0, 1);
c0_Antenna = c0_EDGE.addChild("c0_Antenna").withCard(0, 1).withGroupCard(1, 1);
c0_Small = c0_Antenna.addChild("c0_Small").withCard(0, 1);
c0_Medium = c0_Antenna.addChild("c0_Medium").withCard(0, 1);
c0_Large = c0_Antenna.addChild("c0_Large").withCard(0, 1);
c0_total_cost = c0_EDGE.addChild("c0_total_cost").withCard(1, 1);
c0_total_security = c0_EDGE.addChild("c0_total_security").withCard(1, 1);
c0_CP = Clafer("c0_CP").withCard(1, 1);
c0_Cost.refToUnique(Int);
c0_Cost.addConstraint(greaterThanEqual(joinRef($this()), constant(0)));
c0_Security.refToUnique(Int);
c0_G3.extending(c0_Feature);
c0_G3.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(6)));
c0_G3.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_G4.extending(c0_Feature);
c0_G4.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(14)));
c0_G4.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_G5.extending(c0_Feature);
c0_G5.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(22)));
c0_G5.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_G6.extending(c0_Feature);
c0_G6.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(15)));
c0_G6.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_GHz24.extending(c0_Feature);
c0_GHz24.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(14)));
c0_GHz24.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(3)));
c0_GHz5.extending(c0_Feature);
c0_GHz5.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(25)));
c0_GHz5.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(1)));
c0_EthernetMbps1.extending(c0_Feature);
c0_EthernetMbps1.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(23)));
c0_EthernetMbps1.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_EthernetMbps10.extending(c0_Feature);
c0_EthernetMbps10.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(12)));
c0_EthernetMbps10.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(3)));
c0_EthernetMbps100.extending(c0_Feature);
c0_EthernetMbps100.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(17)));
c0_EthernetMbps100.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(1)));
c0_Monitor.extending(c0_Feature);
c0_Monitor.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(7)));
c0_Monitor.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_Firewall.extending(c0_Feature);
c0_Firewall.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(5)));
c0_Firewall.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(1)));
c0_Encryption.extending(c0_Feature);
c0_Encryption.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(6)));
c0_Encryption.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(1)));
c0_Small.extending(c0_Feature);
c0_Small.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(15)));
c0_Small.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(2)));
c0_Medium.extending(c0_Feature);
c0_Medium.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(24)));
c0_Medium.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(3)));
c0_Large.extending(c0_Feature);
c0_Large.addConstraint(equal(joinRef(join($this(), c0_Cost)), constant(13)));
c0_Large.addConstraint(equal(joinRef(join($this(), c0_Security)), constant(1)));
c0_total_cost.refToUnique(Int);
c0_EDGE.addConstraint(implies(some(join($this(), c0_total_cost)), equal(joinRef(join($this(), c0_total_cost)), sum(join(global(c0_Feature), c0_Cost)))));
c0_total_security.refToUnique(Int);
c0_EDGE.addConstraint(implies(some(join($this(), c0_total_security)), equal(joinRef(join($this(), c0_total_security)), minimum(joinRef(join(global(c0_Feature), c0_Security))))));
c0_CP.extending(c0_EDGE);
Constraint(implies(or(some(join(join(global(c0_EDGE), c0_Interface), c0_Mobile)), some(join(join(global(c0_EDGE), c0_Interface), c0_WiFi))), some(join(global(c0_EDGE), c0_Antenna))));
Constraint(implies(some(join(join(global(c0_EDGE), c0_Interface), c0_EthernetMbps)), none(join(global(c0_EDGE), c0_Antenna))));
