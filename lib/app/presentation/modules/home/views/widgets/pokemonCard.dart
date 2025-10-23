import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../../generated/assets.gen.dart';
import 'pokemonDetailView.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      color: AppColors.cardWater.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.cardWater.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => _showPokemonDetail(widget.pokemon),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N°${widget.pokemon.id}',
                      style: AppTextStyles.poppinsSemiBold12.copyWith(
                        color: AppColors.textCard,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.pokemon.name.toString(),
                      style: AppTextStyles.poppinsSemiBold21,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Assets.images.svg.types.agua.svg(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: _buildCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.images.svg.temp.svg(),
        Assets.images.png.pokemons.bulbasaur.image(),
        Positioned(
          top: 8,
          right: 8,
          child: Assets.images.svg.icons.favorites.noFavorite.svg(),
        ),
      ],
    );
  }

  void _showPokemonDetail(Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailView(pokemon: pokemon),
      ),
    );
  }
}
