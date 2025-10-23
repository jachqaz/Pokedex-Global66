import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../ability/ability.dart';
import '../cries/cries.dart';
import '../form/form.dart';
import '../game_index/game_index.dart';
import '../move/move.dart';
import '../past_ability/past_ability.dart';
import '../species/species.dart';
import '../sprites/sprites.dart';
import '../stat/stat.dart';
import '../type/pokemon_type.dart';
import '../type_detail/type_detail.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  factory Pokemon({
    @required List<Ability?>? abilities,
    @required int? baseExperience,
    @required Cries? cries,
    @required List<Form?>? forms,
    @required List<GameIndex?>? gameIndices,
    @required int? height,
    @required int? id,
    @required bool? isDefault,
    @required String? locationAreaEncounters,
    @required List<Move?>? moves,
    @required String? name,
    @required int? order,
    @required List<PastAbility?>? pastAbilities,
    @required Species? species,
    @required Sprites? sprites,
    @required List<Stat?>? stats,
    @required List<PokemonType?>? types,
    @required int? weight,
    @required String? flavorText,
    @required List<TypeDetail?>? damageRelations,
  }) = _Pokemon;

  factory Pokemon.fromJson(Json json) => _$PokemonFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
