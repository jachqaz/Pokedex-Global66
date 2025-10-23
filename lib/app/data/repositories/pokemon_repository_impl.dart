import '../../data/local/localStorageService.dart';
import '../../domain/models/pokemon/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final LocalStorageService localStorageService;
  static const String _pokemonsKey = 'cached_pokemons';

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      // final cachedData = localStorageService.getObjectList(_pokemonsKey);
      //
      // if (cachedData.isNotEmpty) {
      //   return cachedData.map((json) => Pokemon.fromJson(json)).toList();
      // }

      final first50 = await remoteDataSource.getAllPokemons();

      _loadRemainingPokemonsInBackground();

      return first50;
    } catch (e) {
      throw Exception('Failed to get pokemons: $e');
    }
  }

  void _loadRemainingPokemonsInBackground() async {
    try {
      final count = await (remoteDataSource as PokemonRemoteDataSourceImpl)
          .getPokemonCount();
      final remaining = await (remoteDataSource as PokemonRemoteDataSourceImpl)
          .getPokemonRange(51, count);
      final first50 = await remoteDataSource.getAllPokemons();
      final allPokemons = [...first50, ...remaining];
      final pokemonsJson =
          allPokemons.map((pokemon) => pokemon.toJson()).toList();
      await localStorageService.setObjectList(_pokemonsKey, pokemonsJson);
    } catch (e) {
      // Silently handle background loading errors
    }
  }
}
