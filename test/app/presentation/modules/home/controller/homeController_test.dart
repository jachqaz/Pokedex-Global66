import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';
import 'package:pokedex/app/presentation/modules/home/controller/homeController.dart';
import 'package:pokedex/app/presentation/modules/home/state/homeState.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late HomeController controller;
  late MockGetAllPokemonsUseCase mockGetAllPokemonsUseCase;
  late MockAddFavoriteUseCase mockAddFavoriteUseCase;
  late MockRemoveFavoriteUseCase mockRemoveFavoriteUseCase;
  late MockGetFavoritesUseCase mockGetFavoritesUseCase;
  late MockIsFavoriteUseCase mockIsFavoriteUseCase;

  setUp(() {
    mockGetAllPokemonsUseCase = MockGetAllPokemonsUseCase();
    mockAddFavoriteUseCase = MockAddFavoriteUseCase();
    mockRemoveFavoriteUseCase = MockRemoveFavoriteUseCase();
    mockGetFavoritesUseCase = MockGetFavoritesUseCase();
    mockIsFavoriteUseCase = MockIsFavoriteUseCase();

    controller = HomeController(
      HomeState(),
      mockGetAllPokemonsUseCase,
      mockAddFavoriteUseCase,
      mockRemoveFavoriteUseCase,
      mockGetFavoritesUseCase,
      mockIsFavoriteUseCase,
    );
  });

  group('HomeController', () {
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
    final tFavoritesList = [tPokemon];

    test('should load pokemons successfully', () async {
      // arrange
      when(mockGetAllPokemonsUseCase()).thenAnswer((_) async => tPokemonList);
      when(mockGetFavoritesUseCase()).thenAnswer((_) async => tFavoritesList);

      // act
      await controller.loadPokemons();

      // assert
      expect(controller.state.pokemons, tPokemonList);
      expect(controller.state.favorites, tFavoritesList);
      expect(controller.state.isLoading, false);
      expect(controller.state.error, null);
    });

    test('should handle error when loading pokemons fails', () async {
      // arrange
      when(mockGetAllPokemonsUseCase()).thenThrow(Exception('Error'));

      // act
      await controller.loadPokemons();

      // assert
      expect(controller.state.isLoading, false);
      expect(controller.state.error, 'Exception: Error');
    });

    test('should add pokemon to favorites when not favorite', () async {
      // arrange
      when(mockIsFavoriteUseCase(any)).thenAnswer((_) async => false);
      when(mockAddFavoriteUseCase(any)).thenAnswer((_) async {});
      when(mockGetFavoritesUseCase()).thenAnswer((_) async => tFavoritesList);

      // act
      await controller.toggleFavorite(tPokemon);

      // assert
      verify(mockAddFavoriteUseCase(tPokemon));
      expect(controller.state.favorites, tFavoritesList);
    });

    test('should remove pokemon from favorites when is favorite', () async {
      // arrange
      when(mockIsFavoriteUseCase(any)).thenAnswer((_) async => true);
      when(mockRemoveFavoriteUseCase(any)).thenAnswer((_) async {});
      when(mockGetFavoritesUseCase()).thenAnswer((_) async => []);

      // act
      await controller.toggleFavorite(tPokemon);

      // assert
      verify(mockRemoveFavoriteUseCase(tPokemon.id!));
      expect(controller.state.favorites, []);
    });

    test('should return favorite status', () async {
      // arrange
      when(mockIsFavoriteUseCase(any)).thenAnswer((_) async => true);

      // act
      final result = await controller.isFavorite(1);

      // assert
      expect(result, true);
      verify(mockIsFavoriteUseCase(1));
    });
  });
}
