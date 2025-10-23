import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';
import 'package:pokedex/app/domain/usecases/get_all_pokemons_usecase.dart';

import '../../../mocks.mocks.dart';

void main() {
  late GetAllPokemonsUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetAllPokemonsUseCase(mockRepository);
  });

  group('GetAllPokemonsUseCase', () {
    final tPokemonList = <Pokemon>[
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

    test('should get pokemons from repository', () async {
      // arrange
      when(mockRepository.getAllPokemons())
          .thenAnswer((_) async => tPokemonList);

      // act
      final result = await useCase();

      // assert
      expect(result, tPokemonList);
      verify(mockRepository.getAllPokemons());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
