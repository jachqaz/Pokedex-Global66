# Tests Structure

Este directorio contiene todas las pruebas unitarias del proyecto Pokedex, siguiendo la misma estructura de Clean
Architecture que el código fuente.

## Estructura de Directorios

```
test/
├── app/
│   ├── config/
│   │   ├── router/
│   │   └── theme/
│   ├── data/
│   │   ├── datasources/
│   │   ├── local/
│   │   └── repositories/
│   ├── domain/
│   │   ├── repositories/
│   │   └── usecases/
│   └── presentation/
│       ├── global/
│       └── modules/
│           ├── home/
│           │   ├── controller/
│           │   └── cubit/
│           └── onboarding/
│               ├── controller/
│               └── cubit/
├── mocks.dart
├── mocks.mocks.dart
└── README.md
```

## Archivos de Test Creados

### Domain Layer

- `test/app/domain/typedefs_test.dart` - Tests para type definitions
- `test/app/domain/usecases/add_favorite_usecase_test.dart` - Tests para AddFavoriteUseCase
- `test/app/domain/usecases/get_all_pokemons_usecase_test.dart` - Tests para GetAllPokemonsUseCase
- `test/app/domain/usecases/get_favorites_usecase_test.dart` - Tests para GetFavoritesUseCase
- `test/app/domain/usecases/is_favorite_usecase_test.dart` - Tests para IsFavoriteUseCase
- `test/app/domain/usecases/remove_favorite_usecase_test.dart` - Tests para RemoveFavoriteUseCase

### Data Layer

- `test/app/data/datasources/pokemon_remote_datasource_test.dart` - Tests para PokemonRemoteDataSource
- `test/app/data/local/localStorageService_test.dart` - Tests para LocalStorageService
- `test/app/data/repositories/pokemon_repository_impl_test.dart` - Tests para PokemonRepositoryImpl

### Presentation Layer

- `test/app/presentation/modules/home/cubit/homeCubit_test.dart` - Tests para HomeCubit
- `test/app/presentation/modules/home/controller/homeController_test.dart` - Tests para HomeController
- `test/app/presentation/modules/onboarding/cubit/onboardingCubit_test.dart` - Tests para OnboardingCubit
- `test/app/presentation/modules/onboarding/controller/onboardingController_test.dart` - Tests para OnboardingController
- `test/app/presentation/global/extensions_test.dart` - Tests para extensiones globales
- `test/app/presentation/global/platformUtils_test.dart` - Tests para PlatformUtils
- `test/app/presentation/global/state_notifier_test.dart` - Tests para StateNotifier
- `test/app/presentation/global/enums_test.dart` - Tests para enums

### Config Layer

- `test/app/config/router/paths_test.dart` - Tests para Paths
- `test/app/config/router/routes_test.dart` - Tests para Routes
- `test/app/config/router/routerSimpleCubit_test.dart` - Tests para RouterSimpleCubit
- `test/app/config/theme/app_colors_test.dart` - Tests para AppColors
- `test/app/config/theme/app_text_styles_test.dart` - Tests para AppTextStyles
- `test/app/config/theme/app_theme_test.dart` - Tests para AppTheme

### Main

- `test/main_test.dart` - Tests básicos para main.dart

## Mocks

Los mocks están centralizados en:

- `test/mocks.dart` - Configuración de mocks con anotaciones
- `test/mocks.mocks.dart` - Implementación manual de mocks

## Comandos para Ejecutar Tests

### Ejecutar todos los tests

```bash
fvm flutter test
```

### Ejecutar tests específicos

```bash
fvm flutter test test/app/domain/usecases/
fvm flutter test test/app/data/
fvm flutter test test/app/presentation/
```

### Ejecutar un test individual

```bash
fvm flutter test test/app/domain/typedefs_test.dart
```

### Ejecutar tests con cobertura

```bash
fvm flutter test --coverage
```

## Dependencias de Testing

Las siguientes dependencias están configuradas en `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.0
  bloc_test: ^9.1.4
  build_runner: ^2.4.5
```

## Notas Importantes

1. **Archivos Excluidos**: No se crearon tests para archivos `.freezed.dart` y `.g.dart` ya que son generados
   automáticamente.

2. **Clean Architecture**: La estructura de tests sigue exactamente la misma organización que el código fuente para
   mantener consistencia.

3. **Mocks Manuales**: Se optó por crear mocks manuales para evitar problemas con build_runner en este proyecto
   específico.

4. **Cobertura**: Los tests cubren las principales funcionalidades de cada capa de la arquitectura.

5. **Patrones de Test**: Se siguieron las mejores prácticas de testing con arrange-act-assert pattern.
