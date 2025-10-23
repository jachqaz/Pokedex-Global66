import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../move_detail/move_detail.dart';
import '../version_group_detail/version_group_detail.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
abstract class Move with _$Move {
  factory Move({
    required MoveDetail move,
    required List<VersionGroupDetail?>? versionGroupDetails,
  }) = _Move;

  factory Move.fromJson(Json json) => _$MoveFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
