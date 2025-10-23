import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'ability_detail.freezed.dart';
part 'ability_detail.g.dart';

@freezed
abstract class AbilityDetail with _$AbilityDetail {
  factory AbilityDetail({
    required String name,
    required String url,
  }) = _AbilityDetail;

  factory AbilityDetail.fromJson(Json json) => _$AbilityDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
