import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'home.freezed.dart';
part 'home.g.dart';

@freezed
abstract class Home with _$Home {
  factory Home({
    required String? frontDefault,
    String? frontFemale,
    required String? frontShiny,
    String? frontShinyFemale,
  }) = _Home;

  factory Home.fromJson(Json json) => _$HomeFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
