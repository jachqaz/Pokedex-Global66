import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
abstract class Version with _$Version {
  factory Version({
    required String name,
    required String url,
  }) = _Version;

  factory Version.fromJson(Json json) => _$VersionFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
