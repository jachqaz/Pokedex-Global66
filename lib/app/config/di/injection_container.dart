import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/local/localStorageService.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/usecases/add_favorite_usecase.dart';
import '../../domain/usecases/get_all_pokemons_usecase.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/is_favorite_usecase.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => Dio());

  // Local Storage
  final localStorage = await LocalStorageService.getInstance();
  sl.registerLazySingleton(() => localStorage);

  // Data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: sl(),
      localStorageService: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllPokemonsUseCase(sl()));
  sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => IsFavoriteUseCase(sl()));
}
