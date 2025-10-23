import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';

import '../../../mocks.mocks.dart';

void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonRemoteDataSource mockRemoteDataSource;
  late MockLocalStorageService mockLocalStorageService;

  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSource();
    mockLocalStorageService = MockLocalStorageService();
    repository = PokemonRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localStorageService: mockLocalStorageService,
    );
  });

  group('PokemonRepositoryImpl', () {
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

    final tPokemonList = [tPokemon];

    test('should return cached pokemons when cache exists', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('cached_pokemons'))
          .thenReturn([tPokemon.toJson()]);

      // act
      final result = await repository.getAllPokemons();

      // assert
      expect(result.length, 1);
      expect(result.first.id, tPokemon.id);
      verify(mockLocalStorageService.getObjectList('cached_pokemons'));
      verifyNever(mockRemoteDataSource.getAllPokemons());
    });

    test('should fetch from remote when cache is empty', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('cached_pokemons'))
          .thenReturn([]);
      when(mockRemoteDataSource.getAllPokemons())
          .thenAnswer((_) async => tPokemonList);
      when(mockLocalStorageService.setObjectList(any, any))
          .thenAnswer((_) async => true);

      // act
      final result = await repository.getAllPokemons();

      // assert
      expect(result, tPokemonList);
      verify(mockLocalStorageService.getObjectList('cached_pokemons'));
      verify(mockRemoteDataSource.getAllPokemons());
      verify(mockLocalStorageService.setObjectList('cached_pokemons', any));
    });

    test('should add pokemon to favorites', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('favorite_pokemons'))
          .thenReturn([]);
      when(mockLocalStorageService.setObjectList(any, any))
          .thenAnswer((_) async => true);

      // act
      await repository.addFavorite(tPokemon);

      // assert
      verify(mockLocalStorageService.getObjectList('favorite_pokemons'));
      verify(mockLocalStorageService.setObjectList('favorite_pokemons', any));
    });

    test('should remove pokemon from favorites', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('favorite_pokemons'))
          .thenReturn([tPokemon.toJson()]);
      when(mockLocalStorageService.setObjectList(any, any))
          .thenAnswer((_) async => true);

      // act
      await repository.removeFavorite(1);

      // assert
      verify(mockLocalStorageService.getObjectList('favorite_pokemons'));
      verify(mockLocalStorageService.setObjectList('favorite_pokemons', any));
    });

    test('should return true when pokemon is favorite', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('favorite_pokemons'))
          .thenReturn([tPokemon.toJson()]);

      // act
      final result = await repository.isFavorite(1);

      // assert
      expect(result, true);
      verify(mockLocalStorageService.getObjectList('favorite_pokemons'));
    });

    test('should return false when pokemon is not favorite', () async {
      // arrange
      when(mockLocalStorageService.getObjectList('favorite_pokemons'))
          .thenReturn([]);

      // act
      final result = await repository.isFavorite(1);

      // assert
      expect(result, false);
      verify(mockLocalStorageService.getObjectList('favorite_pokemons'));
    });
  });
}
