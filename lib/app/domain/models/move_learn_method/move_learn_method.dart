import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'move_learn_method.freezed.dart';
part 'move_learn_method.g.dart';

@freezed
abstract class MoveLearnMethod with _$MoveLearnMethod {
  factory MoveLearnMethod({
    required String? name,
    required String? url,
  }) = _MoveLearnMethod;

  factory MoveLearnMethod.fromJson(Json json) =>
      _$MoveLearnMethodFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
