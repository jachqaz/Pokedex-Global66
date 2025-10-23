import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../ability/ability.dart';
import '../generation/generation.dart';

part 'past_ability.freezed.dart';
part 'past_ability.g.dart';

@freezed
abstract class PastAbility with _$PastAbility {
  factory PastAbility({
    required List<Ability> abilities,
    required Generation generation,
  }) = _PastAbility;

  factory PastAbility.fromJson(Json json) => _$PastAbilityFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
