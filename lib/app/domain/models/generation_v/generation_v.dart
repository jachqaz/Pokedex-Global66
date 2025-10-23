import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_v.freezed.dart';
part 'generation_v.g.dart';

@freezed
abstract class GenerationV with _$GenerationV {
  factory GenerationV() = _GenerationV;

  factory GenerationV.fromJson(Json json) => _$GenerationVFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
