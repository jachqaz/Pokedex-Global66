import '../../../../domain/models/pokemon/pokemon.dart';
import '../../../../domain/usecases/add_favorite_usecase.dart';
import '../../../../domain/usecases/get_all_pokemons_usecase.dart';
import '../../../../domain/usecases/get_favorites_usecase.dart';
import '../../../../domain/usecases/is_favorite_usecase.dart';
import '../../../../domain/usecases/remove_favorite_usecase.dart';
import '../../../global/state_notifier.dart';
import '../state/homeState.dart';

class HomeController extends StateNotifier<HomeState> {
  final GetAllPokemonsUseCase getAllPokemonsUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  HomeController(
    super.state,
    this.getAllPokemonsUseCase,
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
    this.getFavoritesUseCase,
    this.isFavoriteUseCase,
  );

  Future<void> init() async {
    await loadPokemons();
  }

  Future<void> loadPokemons() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pokemons = await getAllPokemonsUseCase();
      final favorites = await getFavoritesUseCase();
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
      final isFav = await isFavoriteUseCase(pokemon.id!);
      if (isFav) {
        await removeFavoriteUseCase(pokemon.id!);
      } else {
        await addFavoriteUseCase(pokemon);
      }
      final favorites = await getFavoritesUseCase();
      state = state.copyWith(favorites: favorites);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<bool> isFavorite(int pokemonId) async {
    return await isFavoriteUseCase(pokemonId);
  }
}
