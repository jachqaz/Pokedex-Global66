import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'stat_detail.freezed.dart';
part 'stat_detail.g.dart';

@freezed
abstract class StatDetail with _$StatDetail {
  factory StatDetail({
    required String name,
    required String url,
  }) = _StatDetail;

  factory StatDetail.fromJson(Json json) => _$StatDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
