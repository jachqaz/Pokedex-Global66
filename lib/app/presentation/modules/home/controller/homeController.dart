import '../../../../domain/usecases/get_all_pokemons_usecase.dart';
import '../../../global/state_notifier.dart';
import '../state/homeState.dart';

class HomeController extends StateNotifier<HomeState> {
  final GetAllPokemonsUseCase getAllPokemonsUseCase;

  HomeController(
    super.state,
    this.getAllPokemonsUseCase,
  );

  Future<void> init() async {
    await loadPokemons();
  }

  Future<void> loadPokemons() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pokemons = await getAllPokemonsUseCase();
      state = state.copyWith(
        pokemons: pokemons,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
