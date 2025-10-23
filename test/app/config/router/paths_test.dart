import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/router/paths.dart';

void main() {
  group('Paths', () {
    test('should have correct path constants', () {
      expect(Paths.root, "/");
      expect(Paths.home, "/home");
      expect(Paths.onboarding, "/onboarding");
    });

    test('should have all paths as strings', () {
      expect(Paths.root, isA<String>());
      expect(Paths.home, isA<String>());
      expect(Paths.onboarding, isA<String>());
    });

    test('should have paths starting with forward slash', () {
      expect(Paths.root.startsWith('/'), true);
      expect(Paths.home.startsWith('/'), true);
      expect(Paths.onboarding.startsWith('/'), true);
    });
  });
}
