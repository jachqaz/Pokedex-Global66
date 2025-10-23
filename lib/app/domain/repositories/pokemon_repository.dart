import '../models/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}
