import 'package:flutter/material.dart';

import '../../../../../domain/models/type_detail/type_detail.dart';
import '../../../../global/utils.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<TypeDetail?>? types;

  const PokemonTypesWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 8.0,
      children:
          types!.map((type) => getAssetForType(type: type?.name)).toList(),
    );
  }
}
