import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';
import 'package:pokedex/app/domain/usecases/add_favorite_usecase.dart';

import '../../../mocks.mocks.dart';

void main() {
  late AddFavoriteUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = AddFavoriteUseCase(mockRepository);
  });

  group('AddFavoriteUseCase', () {
    final tPokemon = Pokemon(
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
    );

    test('should call repository addFavorite method', () async {
      // arrange
      when(mockRepository.addFavorite(any)).thenAnswer((_) async {});

      // act
      await useCase(tPokemon);

      // assert
      verify(mockRepository.addFavorite(tPokemon));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
