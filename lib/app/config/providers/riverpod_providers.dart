import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/pokemon/pokemon.dart';
import '../../domain/usecases/add_favorite_usecase.dart';
import '../../domain/usecases/get_all_pokemons_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/is_favorite_usecase.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';
import '../../presentation/modules/home/state/homeState.dart';
import '../di/injection_container.dart' as di;

final getAllPokemonsUseCaseProvider =
    Provider<GetAllPokemonsUseCase>((ref) => di.sl());
final addFavoriteUseCaseProvider =
    Provider<AddFavoriteUseCase>((ref) => di.sl());
final removeFavoriteUseCaseProvider =
    Provider<RemoveFavoriteUseCase>((ref) => di.sl());
final getFavoritesUseCaseProvider =
    Provider<GetFavoritesUseCase>((ref) => di.sl());
final isFavoriteUseCaseProvider = Provider<IsFavoriteUseCase>((ref) => di.sl());

final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    ref.read(getAllPokemonsUseCaseProvider),
    ref.read(addFavoriteUseCaseProvider),
    ref.read(removeFavoriteUseCaseProvider),
    ref.read(getFavoritesUseCaseProvider),
    ref.read(isFavoriteUseCaseProvider),
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  final GetAllPokemonsUseCase _getAllPokemonsUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;

  HomeNotifier(
    this._getAllPokemonsUseCase,
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._getFavoritesUseCase,
    this._isFavoriteUseCase,
  ) : super(HomeState());

  Future<void> loadPokemons() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pokemons = await _getAllPokemonsUseCase();
      final favorites = await _getFavoritesUseCase();
      state = state.copyWith(
        pokemons: pokemons,
        favorites: favorites,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    try {
      final isFav = await _isFavoriteUseCase(pokemon.id!);
      if (isFav) {
        await _removeFavoriteUseCase(pokemon.id!);
      } else {
        await _addFavoriteUseCase(pokemon);
      }
      final favorites = await _getFavoritesUseCase();
      state = state.copyWith(favorites: favorites);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<bool> isFavorite(int pokemonId) async {
    return await _isFavoriteUseCase(pokemonId);
  }
}
