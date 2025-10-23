import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:pokedex/app/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/app/data/local/localStorageService.dart';
import 'package:pokedex/app/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/domain/usecases/add_favorite_usecase.dart';
import 'package:pokedex/app/domain/usecases/get_all_pokemons_usecase.dart';
import 'package:pokedex/app/domain/usecases/get_favorites_usecase.dart';
import 'package:pokedex/app/domain/usecases/is_favorite_usecase.dart';
import 'package:pokedex/app/domain/usecases/remove_favorite_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  PokemonRepository,
  PokemonRemoteDataSource,
  LocalStorageService,
  SharedPreferences,
  Dio,
  GoRouter,
  GetAllPokemonsUseCase,
  AddFavoriteUseCase,
  RemoveFavoriteUseCase,
  GetFavoritesUseCase,
  IsFavoriteUseCase,
])
void main() {}
