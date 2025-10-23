import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../other_sprites/other_sprites.dart';
import '../sprites_versions/sprites_versions.dart';

part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
abstract class Sprites with _$Sprites {
  factory Sprites({
    @JsonKey(name: 'back_default') required String? backDefault,
    @JsonKey(name: 'back_female') String? backFemale,
    @JsonKey(name: 'back_shiny') required String? backShiny,
    @JsonKey(name: 'back_shiny_female') String? backShinyFemale,
    @JsonKey(name: 'front_default') required String? frontDefault,
    @JsonKey(name: 'front_female') String? frontFemale,
    @JsonKey(name: 'front_shiny') required String? frontShiny,
    @JsonKey(name: 'front_shiny_female') String? frontShinyFemale,
    required OtherSprites other,
    required SpritesVersions versions,
  }) = _Sprites;

  factory Sprites.fromJson(Json json) => _$SpritesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
