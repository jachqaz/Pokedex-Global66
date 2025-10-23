import 'package:dio/dio.dart';

import '../../domain/models/pokemon/pokemon.dart';
import '../../domain/models/pokemon_list_response/pokemon_list_response.dart';

abstract class PokemonRemoteDataSource {
  Future<List<Pokemon>> getAllPokemons();

  Future<List<Pokemon>> getPokemonRange(int start, int end);

  Future<int> getPokemonCount();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    return getPokemonRange(1, 50);
  }

  @override
  Future<int> getPokemonCount() async {
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon');
      final pokemonListResponse = PokemonListResponse.fromJson(response.data);
      return pokemonListResponse.count;
    } catch (e) {
      throw Exception('Failed to fetch pokemon count: $e');
    }
  }

  @override
  Future<List<Pokemon>> getPokemonRange(int start, int end) async {
    try {
      final List<Pokemon> pokemons = [];

      for (int i = start; i <= end; i++) {
        final pokemonResponse =
            await dio.get('https://pokeapi.co/api/v2/pokemon/$i');
        final pokemon = Pokemon.fromJson(pokemonResponse.data);
        pokemons.add(pokemon);
      }

      return pokemons;
    } catch (e) {
      throw Exception('Failed to fetch pokemons: $e');
    }
  }
}
