import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/router/routes.dart';

void main() {
  group('Routes', () {
    test('should have correct route constants', () {
      expect(Routes.home, 'home');
      expect(Routes.onboarding, 'onboarding');
    });

    test('should have all routes as strings', () {
      expect(Routes.home, isA<String>());
      expect(Routes.onboarding, isA<String>());
    });

    test('should not have leading slashes in route names', () {
      expect(Routes.home.startsWith('/'), false);
      expect(Routes.onboarding.startsWith('/'), false);
    });
  });
}
