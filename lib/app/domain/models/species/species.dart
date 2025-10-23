import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'species.freezed.dart';
part 'species.g.dart';

@freezed
abstract class Species with _$Species {
  factory Species({
    required String name,
    required String url,
  }) = _Species;

  factory Species.fromJson(Json json) => _$SpeciesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
