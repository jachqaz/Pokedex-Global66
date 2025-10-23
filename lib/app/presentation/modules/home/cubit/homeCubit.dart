import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_all_pokemons_usecase.dart';
import '../state/homeState.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllPokemonsUseCase getAllPokemonsUseCase;

  HomeCubit(this.getAllPokemonsUseCase) : super(HomeState());

  Future<void> loadPokemons() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final pokemons = await getAllPokemonsUseCase();
      emit(state.copyWith(
        pokemons: pokemons,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
