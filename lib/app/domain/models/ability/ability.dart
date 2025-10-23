import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../ability_detail/ability_detail.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
abstract class Ability with _$Ability {
  factory Ability({
    required AbilityDetail ability,
    required bool? isHidden,
    required int? slot,
  }) = _Ability;

  factory Ability.fromJson(Json json) => _$AbilityFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
