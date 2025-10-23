import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'official_artwork.freezed.dart';
part 'official_artwork.g.dart';

@freezed
abstract class OfficialArtwork with _$OfficialArtwork {
  factory OfficialArtwork({
    required String frontDefault,
    required String frontShiny,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Json json) =>
      _$OfficialArtworkFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
