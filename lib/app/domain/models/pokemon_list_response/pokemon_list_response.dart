import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'pokemon_list_response.freezed.dart';
part 'pokemon_list_response.g.dart';

@freezed
abstract class PokemonListResponse with _$PokemonListResponse {
  factory PokemonListResponse({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItem> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Json json) =>
      _$PokemonListResponseFromJson(json);
}

@freezed
abstract class PokemonListItem with _$PokemonListItem {
  factory PokemonListItem({
    required String? name,
    required String? url,
  }) = _PokemonListItem;

  factory PokemonListItem.fromJson(Json json) =>
      _$PokemonListItemFromJson(json);
}
