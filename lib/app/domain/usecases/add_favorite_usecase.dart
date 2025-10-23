import '../models/pokemon/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class AddFavoriteUseCase {
  final PokemonRepository repository;

  AddFavoriteUseCase(this.repository);

  Future<void> call(Pokemon pokemon) async {
    await repository.addFavorite(pokemon);
  }
}
