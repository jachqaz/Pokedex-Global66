import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_vii.freezed.dart';
part 'generation_vii.g.dart';

@freezed
abstract class GenerationVII with _$GenerationVII {
  factory GenerationVII({
    required Icons icons,
    required UltraSunUltraMoon ultraSunUltraMoon,
  }) = _GenerationVII;

  factory GenerationVII.fromJson(Json json) => _$GenerationVIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Icons with _$Icons {
  factory Icons({
    required String? frontDefault,
    String? frontFemale,
  }) = _Icons;

  factory Icons.fromJson(Json json) => _$IconsFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class UltraSunUltraMoon with _$UltraSunUltraMoon {
  factory UltraSunUltraMoon({
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _UltraSunUltraMoon;

  factory UltraSunUltraMoon.fromJson(Json json) =>
      _$UltraSunUltraMoonFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
