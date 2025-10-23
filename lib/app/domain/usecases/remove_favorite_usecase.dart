import '../repositories/pokemon_repository.dart';

class RemoveFavoriteUseCase {
  final PokemonRepository repository;

  RemoveFavoriteUseCase(this.repository);

  Future<void> call(int pokemonId) async {
    await repository.removeFavorite(pokemonId);
  }
}
