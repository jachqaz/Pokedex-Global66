import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'showdown.freezed.dart';
part 'showdown.g.dart';

@freezed
abstract class Showdown with _$Showdown {
  factory Showdown({
    required String? backDefault,
    String? backFemale,
    required String? backShiny,
    String? backShinyFemale,
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _Showdown;

  factory Showdown.fromJson(Json json) => _$ShowdownFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
