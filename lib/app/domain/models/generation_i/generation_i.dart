import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'generation_i.freezed.dart';
part 'generation_i.g.dart';

@freezed
abstract class GenerationI with _$GenerationI {
  factory GenerationI({
    required RedBlue redBlue,
    required Yellow yellow,
  }) = _GenerationI;

  factory GenerationI.fromJson(Json json) => _$GenerationIFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class RedBlue with _$RedBlue {
  factory RedBlue({
    required String? backDefault,
    required String? backGray,
    required String? backTransparent,
    required String? frontDefault,
    required String? frontGray,
    required String? frontTransparent,
  }) = _RedBlue;

  factory RedBlue.fromJson(Json json) => _$RedBlueFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
abstract class Yellow with _$Yellow {
  factory Yellow({
    required String? backDefault,
    required String? backGray,
    required String? backTransparent,
    required String? frontDefault,
    required String? frontGray,
    required String? frontTransparent,
  }) = _Yellow;

  factory Yellow.fromJson(Json json) => _$YellowFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
