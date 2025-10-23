import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/domain/models/pokemon/pokemon.dart';
import 'package:pokedex/app/presentation/modules/home/cubit/homeCubit.dart';
import 'package:pokedex/app/presentation/modules/home/state/homeState.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late HomeCubit cubit;
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

    cubit = HomeCubit(
      mockGetAllPokemonsUseCase,
      mockAddFavoriteUseCase,
      mockRemoveFavoriteUseCase,
      mockGetFavoritesUseCase,
      mockIsFavoriteUseCase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('HomeCubit', () {
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

    test('initial state should be HomeState with empty lists', () {
      expect(cubit.state, HomeState());
    });

    blocTest<HomeCubit, HomeState>(
      'should emit loading and success states when loadPokemons is successful',
      build: () {
        when(mockGetAllPokemonsUseCase()).thenAnswer((_) async => tPokemonList);
        when(mockGetFavoritesUseCase()).thenAnswer((_) async => tFavoritesList);
        return cubit;
      },
      act: (cubit) => cubit.loadPokemons(),
      expect: () => [
        HomeState(isLoading: true),
        HomeState(
          pokemons: tPokemonList,
          favorites: tFavoritesList,
          isLoading: false,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should emit loading and error states when loadPokemons fails',
      build: () {
        when(mockGetAllPokemonsUseCase()).thenThrow(Exception('Error'));
        return cubit;
      },
      act: (cubit) => cubit.loadPokemons(),
      expect: () => [
        HomeState(isLoading: true),
        HomeState(isLoading: false, error: 'Exception: Error'),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should toggle favorite when pokemon is not favorite',
      build: () {
        when(mockIsFavoriteUseCase(any)).thenAnswer((_) async => false);
        when(mockAddFavoriteUseCase(any)).thenAnswer((_) async {});
        when(mockGetFavoritesUseCase()).thenAnswer((_) async => tFavoritesList);
        return cubit;
      },
      act: (cubit) => cubit.toggleFavorite(tPokemon),
      expect: () => [
        HomeState(favorites: tFavoritesList),
      ],
    );

    test('should return favorite status', () async {
      // arrange
      when(mockIsFavoriteUseCase(any)).thenAnswer((_) async => true);

      // act
      final result = await cubit.isFavorite(1);

      // assert
      expect(result, true);
      verify(mockIsFavoriteUseCase(1));
    });
  });
}
