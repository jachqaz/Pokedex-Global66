import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_iii.freezed.dart';
part 'generation_iii.g.dart';

@freezed
abstract class GenerationIII with _$GenerationIII {
  factory GenerationIII() = _GenerationIII;

  factory GenerationIII.fromJson(Json json) => _$GenerationIIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
