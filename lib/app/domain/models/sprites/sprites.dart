import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../other_sprites/other_sprites.dart';
import '../sprites_versions/sprites_versions.dart';

part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
abstract class Sprites with _$Sprites {
  factory Sprites({
    required String backDefault,
    String? backFemale,
    required String backShiny,
    String? backShinyFemale,
    required String frontDefault,
    String? frontFemale,
    required String frontShiny,
    String? frontShinyFemale,
    required OtherSprites other,
    required SpritesVersions versions,
  }) = _Sprites;

  factory Sprites.fromJson(Json json) => _$SpritesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
