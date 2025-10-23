import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_i.freezed.dart';
part 'generation_i.g.dart';

@freezed
abstract class GenerationI with _$GenerationI {
  factory GenerationI() = _GenerationI;

  factory GenerationI.fromJson(Json json) => _$GenerationIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
