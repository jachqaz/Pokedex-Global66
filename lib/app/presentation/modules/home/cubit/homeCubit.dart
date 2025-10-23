import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/pokemon/pokemon.dart';
import '../../../../domain/usecases/add_favorite_usecase.dart';
import '../../../../domain/usecases/get_all_pokemons_usecase.dart';
import '../../../../domain/usecases/get_favorites_usecase.dart';
import '../../../../domain/usecases/is_favorite_usecase.dart';
import '../../../../domain/usecases/remove_favorite_usecase.dart';
import '../state/homeState.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllPokemonsUseCase getAllPokemonsUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  HomeCubit(
    this.getAllPokemonsUseCase,
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
    this.getFavoritesUseCase,
    this.isFavoriteUseCase,
  ) : super(HomeState());

  Future<void> loadPokemons() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final pokemons = await getAllPokemonsUseCase();
      final favorites = await getFavoritesUseCase();
      emit(state.copyWith(
        pokemons: pokemons,
        favorites: favorites,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
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
      emit(state.copyWith(favorites: favorites));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<bool> isFavorite(int pokemonId) async {
    return await isFavoriteUseCase(pokemonId);
  }
}
