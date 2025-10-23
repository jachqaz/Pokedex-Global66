import '../models/pokemon/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetFavoritesUseCase {
  final PokemonRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.getFavorites();
  }
}
