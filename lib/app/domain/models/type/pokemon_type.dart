import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../type_detail/type_detail.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
abstract class PokemonType with _$PokemonType {
  factory PokemonType({
    required int slot,
    required TypeDetail? type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Json json) => _$PokemonTypeFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
