import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/modules/onboarding/cubit/onboardingCubit.dart';
import 'package:pokedex/app/presentation/modules/onboarding/state/onboardingState.dart';

void main() {
  late OnboardingCubit cubit;

  setUp(() {
    cubit = OnboardingCubit(OnboardingState());
  });

  tearDown(() {
    cubit.close();
  });

  group('OnboardingCubit', () {
    test('initial state should be OnboardingState', () {
      expect(cubit.state, isA<OnboardingState>());
    });

    blocTest<OnboardingCubit, OnboardingState>(
      'should maintain state when no actions are performed',
      build: () => cubit,
      expect: () => [],
    );
  });
}
