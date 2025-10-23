import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'showdown.freezed.dart';
part 'showdown.g.dart';

@freezed
abstract class Showdown with _$Showdown {
  factory Showdown({
    @JsonKey(name: 'back_default') required String? backDefault,
    @JsonKey(name: 'back_female') String? backFemale,
    @JsonKey(name: 'back_shiny') required String? backShiny,
    @JsonKey(name: 'back_shiny_female') String? backShinyFemale,
    @JsonKey(name: 'front_default') required String? frontDefault,
    @JsonKey(name: 'front_female') String? frontFemale,
    @JsonKey(name: 'front_shiny') required String? frontShiny,
    @JsonKey(name: 'front_shiny_female') String? frontShinyFemale,
  }) = _Showdown;

  factory Showdown.fromJson(Json json) => _$ShowdownFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
