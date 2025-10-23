import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/usecases/is_favorite_usecase.dart';

import '../../../mocks.mocks.dart';

void main() {
  late IsFavoriteUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = IsFavoriteUseCase(mockRepository);
  });

  group('IsFavoriteUseCase', () {
    const tPokemonId = 1;

    test('should return true when pokemon is favorite', () async {
      // arrange
      when(mockRepository.isFavorite(any)).thenAnswer((_) async => true);

      // act
      final result = await useCase(tPokemonId);

      // assert
      expect(result, true);
      verify(mockRepository.isFavorite(tPokemonId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return false when pokemon is not favorite', () async {
      // arrange
      when(mockRepository.isFavorite(any)).thenAnswer((_) async => false);

      // act
      final result = await useCase(tPokemonId);

      // assert
      expect(result, false);
      verify(mockRepository.isFavorite(tPokemonId));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
