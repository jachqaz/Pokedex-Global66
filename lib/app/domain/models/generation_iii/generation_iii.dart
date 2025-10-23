import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_iii.freezed.dart';
part 'generation_iii.g.dart';

@freezed
abstract class GenerationIII with _$GenerationIII {
  factory GenerationIII({
    required Emerald emerald,
    required FireredLeafgreen fireredLeafgreen,
    required RubySapphire rubySapphire,
  }) = _GenerationIII;

  factory GenerationIII.fromJson(Json json) => _$GenerationIIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Emerald with _$Emerald {
  factory Emerald({
    required String? frontDefault,
    required String? frontShiny,
  }) = _Emerald;

  factory Emerald.fromJson(Json json) => _$EmeraldFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class FireredLeafgreen with _$FireredLeafgreen {
  factory FireredLeafgreen({
    required String? backDefault,
    required String? backShiny,
    required String? frontDefault,
    required String? frontShiny,
  }) = _FireredLeafgreen;

  factory FireredLeafgreen.fromJson(Json json) =>
      _$FireredLeafgreenFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class RubySapphire with _$RubySapphire {
  factory RubySapphire({
    required String? backDefault,
    required String? backShiny,
    required String? frontDefault,
    required String? frontShiny,
  }) = _RubySapphire;

  factory RubySapphire.fromJson(Json json) => _$RubySapphireFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
