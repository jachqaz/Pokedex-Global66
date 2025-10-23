import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_vi.freezed.dart';
part 'generation_vi.g.dart';

@freezed
abstract class GenerationVI with _$GenerationVI {
  factory GenerationVI({
    required OmegarubyAlphasapphire omegarubyAlphasapphire,
    required XY xY,
  }) = _GenerationVI;

  factory GenerationVI.fromJson(Json json) => _$GenerationVIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class OmegarubyAlphasapphire with _$OmegarubyAlphasapphire {
  factory OmegarubyAlphasapphire({
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _OmegarubyAlphasapphire;

  factory OmegarubyAlphasapphire.fromJson(Json json) =>
      _$OmegarubyAlphasapphireFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class XY with _$XY {
  factory XY({
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _XY;

  factory XY.fromJson(Json json) => _$XYFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
