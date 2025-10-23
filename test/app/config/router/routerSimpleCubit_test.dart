import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/config/router/routerSimpleCubit.dart';

import '../../../mocks.mocks.dart';

void main() {
  late RouterSimpleCubit cubit;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockGoRouter = MockGoRouter();
    cubit = RouterSimpleCubit(mockGoRouter);
  });

  tearDown(() {
    cubit.close();
  });

  group('RouterSimpleCubit', () {
    test('initial state should be the provided GoRouter', () {
      expect(cubit.state, mockGoRouter);
    });

    test('should call pop when goBack is called', () {
      // act
      cubit.goBack();

      // assert
      verify(mockGoRouter.pop());
    });

    test('should call go with root path when goHome is called', () {
      // act
      cubit.goHome();

      // assert
      verify(mockGoRouter.go('/'));
    });
  });
}
