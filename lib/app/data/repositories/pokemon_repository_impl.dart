import '../../data/local/localStorageService.dart';
import '../../domain/models/pokemon/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final LocalStorageService localStorageService;
  static const String _pokemonsKey = 'cached_pokemons';
  static const String _favoritesKey = 'favorite_pokemons';

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final cachedData = localStorageService.getObjectList(_pokemonsKey);

      if (cachedData.isNotEmpty) {
        return cachedData.map((json) => Pokemon.fromJson(json)).toList();
      }

      final first20 = await remoteDataSource.getAllPokemons();

      final pokemonsJson = first20.map((pokemon) => pokemon.toJson()).toList();
      await localStorageService.setObjectList(_pokemonsKey, pokemonsJson);

      _loadRemainingPokemonsInBackground();

      return first20;
    } catch (e) {
      throw Exception('Failed to get pokemons: $e');
    }
  }

  @override
  Future<void> addFavorite(Pokemon pokemon) async {
    final favorites = await getFavorites();
    if (!favorites.any((p) => p.id == pokemon.id)) {
      favorites.add(pokemon);
      final favoritesJson = favorites.map((p) => p.toJson()).toList();
      await localStorageService.setObjectList(_favoritesKey, favoritesJson);
    }
  }

  @override
  Future<void> removeFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    favorites.removeWhere((p) => p.id == pokemonId);
    final favoritesJson = favorites.map((p) => p.toJson()).toList();
    await localStorageService.setObjectList(_favoritesKey, favoritesJson);
  }

  @override
  Future<List<Pokemon>> getFavorites() async {
    final favoritesJson = localStorageService.getObjectList(_favoritesKey);
    return favoritesJson.map((json) => Pokemon.fromJson(json)).toList();
  }

  @override
  Future<bool> isFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    return favorites.any((p) => p.id == pokemonId);
  }

  void _loadRemainingPokemonsInBackground() async {
    try {
      final count = await (remoteDataSource as PokemonRemoteDataSourceImpl)
          .getPokemonCount();
      final cachedData = localStorageService.getObjectList(_pokemonsKey);
      final currentPokemons =
          cachedData.map((json) => Pokemon.fromJson(json)).toList();

      for (int i = 21; i <= count; i++) {
        try {
          final pokemon =
              await (remoteDataSource as PokemonRemoteDataSourceImpl)
                  .getPokemon(i);
          currentPokemons.add(pokemon);
          final pokemonsJson = currentPokemons.map((p) => p.toJson()).toList();
          await localStorageService.setObjectList(_pokemonsKey, pokemonsJson);
        } catch (_) {}
      }
    } catch (_) {}
  }
}
