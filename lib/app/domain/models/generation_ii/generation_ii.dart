import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_ii.freezed.dart';
part 'generation_ii.g.dart';

@freezed
abstract class GenerationII with _$GenerationII {
  factory GenerationII({
    required Crystal crystal,
    required Gold gold,
    required Silver silver,
  }) = _GenerationII;

  factory GenerationII.fromJson(Json json) => _$GenerationIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Crystal with _$Crystal {
  factory Crystal({
    required String? backDefault,
    required String? backShiny,
    required String? backShinyTransparent,
    required String? backTransparent,
    required String? frontDefault,
    required String? frontShiny,
    required String? frontShinyTransparent,
    required String? frontTransparent,
  }) = _Crystal;

  factory Crystal.fromJson(Json json) => _$CrystalFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Gold with _$Gold {
  factory Gold({
    required String? backDefault,
    required String? backShiny,
    required String? frontDefault,
    required String? frontShiny,
    required String? frontTransparent,
  }) = _Gold;

  factory Gold.fromJson(Json json) => _$GoldFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Silver with _$Silver {
  factory Silver({
    required String? backDefault,
    required String? backShiny,
    required String? frontDefault,
    required String? frontShiny,
    required String? frontTransparent,
  }) = _Silver;

  factory Silver.fromJson(Json json) => _$SilverFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
