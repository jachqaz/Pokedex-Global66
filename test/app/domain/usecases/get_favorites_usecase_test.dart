import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';
import 'package:pokedex/app/domain/usecases/get_favorites_usecase.dart';

import '../../../mocks.mocks.dart';

void main() {
  late GetFavoritesUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetFavoritesUseCase(mockRepository);
  });

  group('GetFavoritesUseCase', () {
    final tFavoritesList = <Pokemon>[
      Pokemon(
        id: 1,
        name: 'bulbasaur',
        abilities: [],
        baseExperience: 64,
        cries: null,
        forms: [],
        gameIndices: [],
        height: 7,
        isDefault: true,
        locationAreaEncounters: '',
        moves: [],
        order: 1,
        pastAbilities: [],
        species: null,
        sprites: null,
        stats: [],
        types: [],
        weight: 69,
        flavorText: '',
        damageRelations: [],
      ),
    ];

    test('should get favorites from repository', () async {
      // arrange
      when(mockRepository.getFavorites())
          .thenAnswer((_) async => tFavoritesList);

      // act
      final result = await useCase();

      // assert
      expect(result, tFavoritesList);
      verify(mockRepository.getFavorites());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
