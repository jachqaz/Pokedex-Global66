import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'cries.freezed.dart';
part 'cries.g.dart';

@freezed
abstract class Cries with _$Cries {
  factory Cries({
    required String? latest,
    required String? legacy,
  }) = _Cries;

  factory Cries.fromJson(Json json) => _$CriesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
