import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/pokemon/pokemon.dart';

part 'homeState.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<Pokemon> pokemons,
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeState;
}
