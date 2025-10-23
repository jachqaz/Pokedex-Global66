import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../generation_vii/generation_vii.dart';

part 'generation_viii.freezed.dart';
part 'generation_viii.g.dart';

@freezed
abstract class GenerationVIII with _$GenerationVIII {
  factory GenerationVIII({
    required Icons icons,
  }) = _GenerationVIII;

  factory GenerationVIII.fromJson(Json json) => _$GenerationVIIIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
