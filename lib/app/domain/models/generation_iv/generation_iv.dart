import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_iv.freezed.dart';
part 'generation_iv.g.dart';

@freezed
abstract class GenerationIV with _$GenerationIV {
  factory GenerationIV({
    required DiamondPearl diamondPearl,
    required HeartgoldSoulsilver heartgoldSoulsilver,
    required Platinum platinum,
  }) = _GenerationIV;

  factory GenerationIV.fromJson(Json json) => _$GenerationIVFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class DiamondPearl with _$DiamondPearl {
  factory DiamondPearl({
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _DiamondPearl;

  factory DiamondPearl.fromJson(Json json) => _$DiamondPearlFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class HeartgoldSoulsilver with _$HeartgoldSoulsilver {
  factory HeartgoldSoulsilver({
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _HeartgoldSoulsilver;

  factory HeartgoldSoulsilver.fromJson(Json json) =>
      _$HeartgoldSoulsilverFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Platinum with _$Platinum {
  factory Platinum({
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _Platinum;

  factory Platinum.fromJson(Json json) => _$PlatinumFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
