import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'version_group_detail.freezed.dart';
part 'version_group_detail.g.dart';

@freezed
abstract class VersionGroupDetail with _$VersionGroupDetail {
  factory VersionGroupDetail({
    required String? name,
    required String? url,
  }) = _VersionGroupDetail;

  factory VersionGroupDetail.fromJson(Json json) =>
      _$VersionGroupDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
