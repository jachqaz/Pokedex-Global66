import '../models/pokemon/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetAllPokemonsUseCase {
  final PokemonRepository repository;

  GetAllPokemonsUseCase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.getAllPokemons();
  }
}
