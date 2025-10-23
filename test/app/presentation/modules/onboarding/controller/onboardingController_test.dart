import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/modules/onboarding/controller/onboardingController.dart';
import 'package:pokedex/app/presentation/modules/onboarding/state/onboardingState.dart';

void main() {
  late OnboardingController controller;

  setUp(() {
    controller = OnboardingController(OnboardingState());
  });

  group('OnboardingController', () {
    test('should initialize with OnboardingState', () {
      expect(controller.state, isA<OnboardingState>());
    });

    test('should complete init without errors', () async {
      // act & assert
      expect(() => controller.init(), returnsNormally);
    });
  });
}
