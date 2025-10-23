import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'move_detail.freezed.dart';
part 'move_detail.g.dart';

@freezed
abstract class MoveDetail with _$MoveDetail {
  factory MoveDetail({
    required String? name,
    required String? url,
  }) = _MoveDetail;

  factory MoveDetail.fromJson(Json json) => _$MoveDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
