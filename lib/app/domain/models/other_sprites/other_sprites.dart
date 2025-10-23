import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../dream_world/dream_world.dart';
import '../home/home.dart';
import '../official_artwork/official_artwork.dart';
import '../showdown/showdown.dart';

part 'other_sprites.freezed.dart';
part 'other_sprites.g.dart';

@freezed
abstract class OtherSprites with _$OtherSprites {
  factory OtherSprites({
    required DreamWorld? dreamWorld,
    required Home? home,
    required OfficialArtwork? officialArtwork,
    required Showdown? showdown,
  }) = _OtherSprites;

  factory OtherSprites.fromJson(Json json) => _$OtherSpritesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
