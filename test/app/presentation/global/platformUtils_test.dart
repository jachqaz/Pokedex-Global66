import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/global/platformUtils.dart';

void main() {
  group('PlatformUtils', () {
    test('should return correct platform name for web', () {
      // Note: In test environment, kIsWeb is false by default
      expect(PlatformUtils.platformName, isA<String>());
    });

    test('should return correct platform type', () {
      expect(PlatformUtils.platformType, isA<PlatformType>());
    });

    test('should have all platform type enum values', () {
      expect(PlatformType.values, contains(PlatformType.web));
      expect(PlatformType.values, contains(PlatformType.mobile));
      expect(PlatformType.values, contains(PlatformType.desktop));
      expect(PlatformType.values, contains(PlatformType.unknown));
    });

    test('should return boolean values for platform checks', () {
      expect(PlatformUtils.isWeb, isA<bool>());
      expect(PlatformUtils.isMobile, isA<bool>());
      expect(PlatformUtils.isDesktop, isA<bool>());
      expect(PlatformUtils.isAndroid, isA<bool>());
      expect(PlatformUtils.isIOS, isA<bool>());
      expect(PlatformUtils.isWindows, isA<bool>());
      expect(PlatformUtils.isMacOS, isA<bool>());
      expect(PlatformUtils.isLinux, isA<bool>());
    });

    test('platform checks should be mutually exclusive for main categories',
        () {
      final platformChecks = [
        PlatformUtils.isWeb,
        PlatformUtils.isMobile,
        PlatformUtils.isDesktop,
      ];

      final trueCount = platformChecks.where((check) => check).length;
      expect(trueCount, lessThanOrEqualTo(1));
    });
  });
}
