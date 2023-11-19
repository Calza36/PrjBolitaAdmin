import 'package:flutter/material.dart';

class AppConfigSize {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = AppConfigSize.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = AppConfigSize.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

/* enum AppPlatform { ANDROID, IOS }
enum Environment { PROD, DEV, DEMO }
enum ServerAPI { GERMAN, USA } */
enum AppLocale { EN, ES }

// ignore: avoid_classes_with_only_static_members
class AppConfig {
  static bool get isInDebugMode {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  ///Access to info about current platform
/*   static AppPlatform get platform =>
      Platform.isIOS ? AppPlatform.IOS : AppPlatform.ANDROID; */
}

class AppSettings {
  static bool cacheIsEnabled = false;
  static bool profileEnabled = true;
}
