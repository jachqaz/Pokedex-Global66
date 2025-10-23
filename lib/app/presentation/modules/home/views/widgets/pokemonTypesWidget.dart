import 'package:flutter/material.dart';

import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../global/utils.dart';

class PokemonTypesWidget extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTypesWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pokemon.types!
          .map((type) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: getAssetForType(type: type?.type?.name),
              ))
          .toList(),
    );
  }
}
