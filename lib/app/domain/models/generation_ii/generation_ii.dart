import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_ii.freezed.dart';
part 'generation_ii.g.dart';

@freezed
abstract class GenerationII with _$GenerationII {
  factory GenerationII() = _GenerationII;

  factory GenerationII.fromJson(Json json) => _$GenerationIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
