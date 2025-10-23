import '../models/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons();

  Future<void> addFavorite(Pokemon pokemon);

  Future<void> removeFavorite(int pokemonId);

  Future<List<Pokemon>> getFavorites();

  Future<bool> isFavorite(int pokemonId);
}
