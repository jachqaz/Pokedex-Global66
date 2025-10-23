import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_vii.freezed.dart';
part 'generation_vii.g.dart';

@freezed
abstract class GenerationVII with _$GenerationVII {
  factory GenerationVII() = _GenerationVII;

  factory GenerationVII.fromJson(Json json) => _$GenerationVIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
