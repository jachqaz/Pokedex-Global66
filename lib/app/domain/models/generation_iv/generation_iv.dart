import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_iv.freezed.dart';
part 'generation_iv.g.dart';

@freezed
abstract class GenerationIV with _$GenerationIV {
  factory GenerationIV() = _GenerationIV;

  factory GenerationIV.fromJson(Json json) => _$GenerationIVFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
