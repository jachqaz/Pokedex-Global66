import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class PlatformUtils {
  static bool get isWeb => kIsWeb;

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static bool get isIOS => !kIsWeb && Platform.isIOS;

  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static bool get isWindows => !kIsWeb && Platform.isWindows;

  static bool get isMacOS => !kIsWeb && Platform.isMacOS;

  static bool get isLinux => !kIsWeb && Platform.isLinux;

  static bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static String get platformName {
    if (kIsWeb) return 'Web';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    if (Platform.isWindows) return 'Windows';
    if (Platform.isMacOS) return 'macOS';
    if (Platform.isLinux) return 'Linux';
    return 'Unknown';
  }

  static PlatformType get platformType {
    if (kIsWeb) return PlatformType.web;
    if (Platform.isAndroid || Platform.isIOS) return PlatformType.mobile;
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return PlatformType.desktop;
    }
    return PlatformType.unknown;
  }
}

enum PlatformType { web, mobile, desktop, unknown }
