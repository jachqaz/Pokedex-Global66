import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../generation_i/generation_i.dart';
import '../generation_ii/generation_ii.dart';
import '../generation_iii/generation_iii.dart';
import '../generation_iv/generation_iv.dart';
import '../generation_v/generation_v.dart';
import '../generation_vi/generation_vi.dart';
import '../generation_vii/generation_vii.dart';
import '../generation_viii/generation_viii.dart';

part 'sprites_versions.freezed.dart';
part 'sprites_versions.g.dart';

@freezed
abstract class SpritesVersions with _$SpritesVersions {
  factory SpritesVersions({
    required GenerationI? generationI,
    required GenerationII? generationII,
    required GenerationIII? generationIII,
    required GenerationIV? generationIV,
    required GenerationV? generationV,
    required GenerationVI? generationVI,
    required GenerationVII? generationVII,
    required GenerationVIII? generationVIII,
  }) = _SpritesVersions;

  factory SpritesVersions.fromJson(Json json) =>
      _$SpritesVersionsFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
