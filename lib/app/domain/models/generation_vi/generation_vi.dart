import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_vi.freezed.dart';
part 'generation_vi.g.dart';

@freezed
abstract class GenerationVI with _$GenerationVI {
  factory GenerationVI() = _GenerationVI;

  factory GenerationVI.fromJson(Json json) => _$GenerationVIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
