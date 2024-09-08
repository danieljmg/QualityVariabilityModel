scope({c0_CodeLines:31, c0_Feature:31});
defaultScope(1);
intRange(-8, 7);
stringLength(16);

c0_Feature = Abstract("c0_Feature");
c0_CodeLines = c0_Feature.addChild("c0_CodeLines").withCard(1, 1);
c0_MobileMedia2 = Abstract("c0_MobileMedia2");
c0_MediaSelection = c0_MobileMedia2.addChild("c0_MediaSelection").withCard(1, 1).withGroupCard(1);
c0_Photo = c0_MediaSelection.addChild("c0_Photo").withCard(0, 1);
c0_Music = c0_MediaSelection.addChild("c0_Music").withCard(0, 1);
c0_MusicPlayer = c0_Music.addChild("c0_MusicPlayer").withCard(1, 1);
c0_Video = c0_MediaSelection.addChild("c0_Video").withCard(0, 1);
c0_MediaManagement = c0_MobileMedia2.addChild("c0_MediaManagement").withCard(1, 1);
c0_Favourites = c0_MediaManagement.addChild("c0_Favourites").withCard(0, 1);
c0_SetFavourites = c0_Favourites.addChild("c0_SetFavourites").withCard(1, 1);
c0_ViewFavourites = c0_Favourites.addChild("c0_ViewFavourites").withCard(1, 1);
c0_CopyMedia = c0_MediaManagement.addChild("c0_CopyMedia").withCard(0, 1);
c0_SMSTransfer = c0_MediaManagement.addChild("c0_SMSTransfer").withCard(0, 1);
c0_ReceivePhoto = c0_SMSTransfer.addChild("c0_ReceivePhoto").withCard(0, 1);
c0_SendPhoto = c0_SMSTransfer.addChild("c0_SendPhoto").withCard(0, 1);
c0_ScreenSize = c0_MobileMedia2.addChild("c0_ScreenSize").withCard(1, 1).withGroupCard(1, 1);
c0_Screen1 = c0_ScreenSize.addChild("c0_Screen1").withCard(0, 1);
c0_Screen2 = c0_ScreenSize.addChild("c0_Screen2").withCard(0, 1);
c0_Screen3 = c0_ScreenSize.addChild("c0_Screen3").withCard(0, 1);
c0_Speakerphone = c0_MobileMedia2.addChild("c0_Speakerphone").withCard(1, 1);
c0_Calendar = c0_MobileMedia2.addChild("c0_Calendar").withCard(1, 1);
c0_Radio = c0_MobileMedia2.addChild("c0_Radio").withCard(1, 1);
c0_CallManager = c0_MobileMedia2.addChild("c0_CallManager").withCard(1, 1);
c0_TVDigital = c0_MobileMedia2.addChild("c0_TVDigital").withCard(0, 1);
c0_OS = c0_MobileMedia2.addChild("c0_OS").withCard(1, 1).withGroupCard(1, 1);
c0_Androide = c0_OS.addChild("c0_Androide").withCard(0, 1);
c0_WindowsMobile = c0_OS.addChild("c0_WindowsMobile").withCard(0, 1);
c0_Symbia = c0_OS.addChild("c0_Symbia").withCard(0, 1);
c0_iOS = c0_OS.addChild("c0_iOS").withCard(0, 1);
c0_TouchScreen = c0_MobileMedia2.addChild("c0_TouchScreen").withCard(0, 1);
c0_Connectivity = c0_MobileMedia2.addChild("c0_Connectivity").withCard(0, 1).withGroupCard(1);
c0_Bluetooth = c0_Connectivity.addChild("c0_Bluetooth").withCard(0, 1);
c0_WiFi = c0_Connectivity.addChild("c0_WiFi").withCard(0, 1).withGroupCard(1);
c0_Gmail = c0_WiFi.addChild("c0_Gmail").withCard(0, 1);
c0_GoogleMaps = c0_WiFi.addChild("c0_GoogleMaps").withCard(0, 1);
c0_Youtube = c0_WiFi.addChild("c0_Youtube").withCard(0, 1);
c0_GPS = c0_MobileMedia2.addChild("c0_GPS").withCard(0, 1);
c0_ResolutionCamera = c0_MobileMedia2.addChild("c0_ResolutionCamera").withCard(0, 1).withGroupCard(1, 1);
c0_Resolution3MP = c0_ResolutionCamera.addChild("c0_Resolution3MP").withCard(0, 1);
c0_Resolution8MP = c0_ResolutionCamera.addChild("c0_Resolution8MP").withCard(0, 1);
c0_Language = c0_MobileMedia2.addChild("c0_Language").withCard(1, 1).withGroupCard(1);
c0_Portuguese = c0_Language.addChild("c0_Portuguese").withCard(0, 1);
c0_English = c0_Language.addChild("c0_English").withCard(0, 1);
c0_Spanish = c0_Language.addChild("c0_Spanish").withCard(0, 1);
c0_total_codelines = c0_MobileMedia2.addChild("c0_total_codelines").withCard(1, 1);
c0_CP = Clafer("c0_CP").withCard(1, 1);
c0_CodeLines.refToUnique(Int);
c0_CodeLines.addConstraint(greaterThanEqual(joinRef($this()), constant(0)));
c0_Photo.extending(c0_Feature);
c0_Photo.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(4)));
c0_MusicPlayer.extending(c0_Feature);
c0_MusicPlayer.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(4)));
c0_Video.extending(c0_Feature);
c0_Video.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(2)));
c0_SetFavourites.extending(c0_Feature);
c0_SetFavourites.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(5)));
c0_ViewFavourites.extending(c0_Feature);
c0_ViewFavourites.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_CopyMedia.extending(c0_Feature);
c0_CopyMedia.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(2)));
c0_ReceivePhoto.extending(c0_Feature);
c0_ReceivePhoto.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_SendPhoto.extending(c0_Feature);
c0_SendPhoto.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_Screen1.extending(c0_Feature);
c0_Screen1.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(2)));
c0_Screen2.extending(c0_Feature);
c0_Screen2.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(1)));
c0_Screen3.extending(c0_Feature);
c0_Screen3.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(1)));
c0_Speakerphone.extending(c0_Feature);
c0_Speakerphone.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(4)));
c0_Calendar.extending(c0_Feature);
c0_Calendar.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(3)));
c0_Radio.extending(c0_Feature);
c0_Radio.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(6)));
c0_CallManager.extending(c0_Feature);
c0_CallManager.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_TVDigital.extending(c0_Feature);
c0_TVDigital.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_Androide.extending(c0_Feature);
c0_Androide.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(9)));
c0_WindowsMobile.extending(c0_Feature);
c0_WindowsMobile.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(4)));
c0_Symbia.extending(c0_Feature);
c0_Symbia.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(2)));
c0_iOS.extending(c0_Feature);
c0_iOS.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(8)));
c0_TouchScreen.extending(c0_Feature);
c0_TouchScreen.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(7)));
c0_Bluetooth.extending(c0_Feature);
c0_Bluetooth.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(9)));
c0_Gmail.extending(c0_Feature);
c0_Gmail.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(5)));
c0_GoogleMaps.extending(c0_Feature);
c0_GoogleMaps.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(6)));
c0_Youtube.extending(c0_Feature);
c0_Youtube.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(4)));
c0_GPS.extending(c0_Feature);
c0_GPS.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(1)));
c0_Resolution3MP.extending(c0_Feature);
c0_Resolution3MP.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(6)));
c0_Resolution8MP.extending(c0_Feature);
c0_Resolution8MP.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(9)));
c0_Portuguese.extending(c0_Feature);
c0_Portuguese.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(5)));
c0_English.extending(c0_Feature);
c0_English.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(8)));
c0_Spanish.extending(c0_Feature);
c0_Spanish.addConstraint(equal(joinRef(join($this(), c0_CodeLines)), constant(6)));
c0_total_codelines.refToUnique(Int);
c0_MobileMedia2.addConstraint(implies(some(join($this(), c0_total_codelines)), equal(joinRef(join($this(), c0_total_codelines)), sum(join(global(c0_Feature), c0_CodeLines)))));
c0_CP.extending(c0_MobileMedia2);
Constraint(or(some(join(join(global(c0_MobileMedia2), c0_MediaSelection), c0_Video)), none(join(global(c0_MobileMedia2), c0_ResolutionCamera))));
Constraint(or(some(join(join(global(c0_MobileMedia2), c0_MediaSelection), c0_Photo)), none(join(global(c0_MobileMedia2), c0_ResolutionCamera))));
Constraint(or(none(join(join(global(c0_MobileMedia2), c0_MediaManagement), c0_CopyMedia)), some(join(join(global(c0_MobileMedia2), c0_MediaManagement), c0_SMSTransfer))));