import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../stat_detail/stat_detail.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

@freezed
abstract class Stat with _$Stat {
  factory Stat({
    required int? baseStat,
    required int? effort,
    required StatDetail stat,
  }) = _Stat;

  factory Stat.fromJson(Json json) => _$StatFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
