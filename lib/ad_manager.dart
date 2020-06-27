import 'dart:io';

class AdManager {
  static String get appId {
    if(Platform.isAndroid)
      return "com.example.loanapp";
    else if(Platform.isIOS)
      return "";
    else{
      throw new UnsupportedError("Unsupported Platform");
    }
  }

  static String get bannerAdUnitId {
    if(Platform.isAndroid) return "ca-app-pub-3515842249805175/8667504188";
    else if(Platform.isIOS) return "ca-app-pub-3940256099942544~2594085930";
    else {
      throw new UnsupportedError("Unsupported Platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3515842249805175/8667504188";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544~2594085930";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3515842249805175/8667504188";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544~2594085930";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}