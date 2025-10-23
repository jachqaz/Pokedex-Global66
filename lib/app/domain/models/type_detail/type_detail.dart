import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'type_detail.freezed.dart';
part 'type_detail.g.dart';

@freezed
abstract class TypeDetail with _$TypeDetail {
  factory TypeDetail({
    required String name,
    required String url,
  }) = _TypeDetail;

  factory TypeDetail.fromJson(Json json) => _$TypeDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
