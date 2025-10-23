import 'dart:io';

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
    return getPokemonRange(1, 20);
  }

  Future<Pokemon> getPokemon(int id) async {
    try {
      final systemLanguage = Platform.localeName.startsWith('es') ? 'es' : 'en';

      final pokemonResponse =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$id');
      final speciesResponse =
          await dio.get('https://pokeapi.co/api/v2/pokemon-species/$id');

      final flavorTextEntries =
          speciesResponse.data['flavor_text_entries'] as List;
      final flavorText = flavorTextEntries.firstWhere(
        (entry) => entry['language']['name'] == systemLanguage,
        orElse: () => flavorTextEntries.first,
      )['flavor_text'] as String;

      final types = pokemonResponse.data['types'] as List;
      final List<Map<String, dynamic>> damageRelations = [];

      for (final type in types) {
        final typeUrl = type['type']['url'] as String;
        final typeId = typeUrl.split('/').where((s) => s.isNotEmpty).last;
        final typeResponse =
            await dio.get('https://pokeapi.co/api/v2/type/$typeId');
        final doubleDamageFrom =
            typeResponse.data['damage_relations']['double_damage_from'] as List;
        damageRelations.addAll(doubleDamageFrom.cast<Map<String, dynamic>>());
      }

      final pokemonData = Map<String, dynamic>.from(pokemonResponse.data);
      pokemonData['flavorText'] = flavorText;
      pokemonData['damageRelations'] = damageRelations;

      return Pokemon.fromJson(pokemonData);
    } catch (e) {
      throw Exception('Failed to fetch pokemon $id: $e');
    }
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
      final systemLanguage = Platform.localeName.startsWith('es') ? 'es' : 'en';

      for (int i = start; i <= end; i++) {
        final pokemonResponse =
            await dio.get('https://pokeapi.co/api/v2/pokemon/$i');
        final speciesResponse =
            await dio.get('https://pokeapi.co/api/v2/pokemon-species/$i');

        final flavorTextEntries =
            speciesResponse.data['flavor_text_entries'] as List;
        final flavorText = flavorTextEntries.firstWhere(
          (entry) => entry['language']['name'] == systemLanguage,
          orElse: () => flavorTextEntries.first,
        )['flavor_text'] as String;

        final types = pokemonResponse.data['types'] as List;
        final List<Map<String, dynamic>> damageRelations = [];

        for (final type in types) {
          final typeUrl = type['type']['url'] as String;
          final typeId = typeUrl.split('/').where((s) => s.isNotEmpty).last;
          final typeResponse =
              await dio.get('https://pokeapi.co/api/v2/type/$typeId');
          final doubleDamageFrom = typeResponse.data['damage_relations']
              ['double_damage_from'] as List;
          damageRelations.addAll(doubleDamageFrom.cast<Map<String, dynamic>>());
        }

        final pokemonData = Map<String, dynamic>.from(pokemonResponse.data);
        pokemonData['flavorText'] = flavorText;
        pokemonData['damageRelations'] = damageRelations;

        final pokemon = Pokemon.fromJson(pokemonData);
        pokemons.add(pokemon);
      }

      return pokemons;
    } catch (e) {
      throw Exception('Failed to fetch pokemons: $e');
    }
  }
}
