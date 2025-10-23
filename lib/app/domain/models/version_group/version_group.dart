import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'version_group.freezed.dart';
part 'version_group.g.dart';

@freezed
abstract class VersionGroup with _$VersionGroup {
  factory VersionGroup({
    required String? name,
    required String? url,
  }) = _VersionGroup;

  factory VersionGroup.fromJson(Json json) => _$VersionGroupFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
