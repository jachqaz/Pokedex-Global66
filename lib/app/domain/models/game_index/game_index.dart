import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../version/version.dart';

part 'game_index.freezed.dart';
part 'game_index.g.dart';

@freezed
abstract class GameIndex with _$GameIndex {
  factory GameIndex({
    required int gameIndex,
    required Version version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Json json) => _$GameIndexFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
