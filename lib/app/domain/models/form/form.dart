import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'form.freezed.dart';
part 'form.g.dart';

@freezed
abstract class Form with _$Form {
  factory Form({
    required String? name,
    required String? url,
  }) = _Form;

  factory Form.fromJson(Json json) => _$FormFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
