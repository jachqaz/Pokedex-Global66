import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/usecases/remove_favorite_usecase.dart';

import '../../../mocks.mocks.dart';

void main() {
  late RemoveFavoriteUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = RemoveFavoriteUseCase(mockRepository);
  });

  group('RemoveFavoriteUseCase', () {
    const tPokemonId = 1;

    test('should call repository removeFavorite method', () async {
      // arrange
      when(mockRepository.removeFavorite(any)).thenAnswer((_) async {});

      // act
      await useCase(tPokemonId);

      // assert
      verify(mockRepository.removeFavorite(tPokemonId));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
