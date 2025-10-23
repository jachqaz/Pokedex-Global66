import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'dream_world.freezed.dart';
part 'dream_world.g.dart';

@freezed
abstract class DreamWorld with _$DreamWorld {
  factory DreamWorld({
    required String? frontDefault,
    String? frontFemale,
  }) = _DreamWorld;

  factory DreamWorld.fromJson(Json json) => _$DreamWorldFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
