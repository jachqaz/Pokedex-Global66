import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_v.freezed.dart';
part 'generation_v.g.dart';

@freezed
abstract class GenerationV with _$GenerationV {
  factory GenerationV({
    required BlackWhite blackWhite,
  }) = _GenerationV;

  factory GenerationV.fromJson(Json json) => _$GenerationVFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class BlackWhite with _$BlackWhite {
  factory BlackWhite({
    required Animated animated,
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _BlackWhite;

  factory BlackWhite.fromJson(Json json) => _$BlackWhiteFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Animated with _$Animated {
  factory Animated({
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _Animated;

  factory Animated.fromJson(Json json) => _$AnimatedFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
