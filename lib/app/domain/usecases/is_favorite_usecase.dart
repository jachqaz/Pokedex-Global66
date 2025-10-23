import '../repositories/pokemon_repository.dart';

class IsFavoriteUseCase {
  final PokemonRepository repository;

  IsFavoriteUseCase(this.repository);

  Future<bool> call(int pokemonId) async {
    return await repository.isFavorite(pokemonId);
  }
}
