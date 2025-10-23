import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation.freezed.dart';
part 'generation.g.dart';

@freezed
abstract class Generation with _$Generation {
  factory Generation({
    required String name,
    required String url,
  }) = _Generation;

  factory Generation.fromJson(Json json) => _$GenerationFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
