import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/app_text_styles.dart';
import '../../../../../domain/models/pokemon/pokemon.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../global/extensions.dart';
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
      color: _getColorForType(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: _getColorForType(),
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
                      widget.pokemon.name!.capitalize(),
                      style: AppTextStyles.poppinsSemiBold21,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: widget.pokemon.types!
                          .map((type) => getAssetForType(type?.type?.name))
                          .toList(),
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
        getAssetForType(null),
        CachedNetworkImage(
          imageUrl: widget.pokemon.sprites?.frontDefault ?? '',
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Assets.images.svg.icons.favorites.noFavorite.svg(),
        ),
      ],
    );
  }

  Color _getColorForType() {
    switch (widget.pokemon.types?.first?.type?.name?.toLowerCase().trim()) {
      case 'normal':
        return AppColors.cardNormal;
      case 'fire':
        return AppColors.cardFire;
      case 'water':
        return AppColors.cardWater;
      case 'grass':
        return AppColors.cardGrass;
      case 'electric':
        return AppColors.cardElectric;
      case 'ice':
        return AppColors.cardIce;
      case 'fighting':
        return AppColors.cardFighting;
      case 'poison':
        return AppColors.cardPoison;
      case 'ground':
        return AppColors.cardGround;
      case 'flying':
        return AppColors.cardFlying;
      case 'psychic':
        return AppColors.cardPsychic;
      case 'bug':
        return AppColors.cardBug;
      case 'rock':
        return AppColors.cardRock;
      case 'ghost':
        return AppColors.cardGhost;
      case 'dragon':
        return AppColors.cardDragon;
      case 'steel':
        return AppColors.cardSteel;
      case 'dark':
        return AppColors.cardDark;
      case 'fairy':
        return AppColors.cardFairy;
      case 'stellar':
        return AppColors.cardStellar;
      default:
        return AppColors.cardUnknown;
    }
  }

  SvgPicture getAssetForType(String? type) {
    String? compareType = type?.toLowerCase().trim() ??
        widget.pokemon.types?.first?.type?.name?.toLowerCase().trim();
    switch (compareType) {
      case 'normal':
        return type != null
            ? Assets.images.svg.types.normal.svg()
            : Assets.images.svg.cards.cardNormal.svg();
      case 'fire':
        return type != null
            ? Assets.images.svg.types.fuego.svg()
            : Assets.images.svg.cards.cardFire.svg();
      case 'water':
        return type != null
            ? Assets.images.svg.types.agua.svg()
            : Assets.images.svg.cards.cardWater.svg();
      case 'grass':
        return type != null
            ? Assets.images.svg.types.planta.svg()
            : Assets.images.svg.cards.cardGrass.svg();
      case 'electric':
        return type != null
            ? Assets.images.svg.types.electrico.svg()
            : Assets.images.svg.cards.cardElectric.svg();
      case 'ice':
        return type != null
            ? Assets.images.svg.types.hielo.svg()
            : Assets.images.svg.cards.cardIce.svg();
      case 'fighting':
        return type != null
            ? Assets.images.svg.types.lucha.svg()
            : Assets.images.svg.cards.cardFighting.svg();
      case 'poison':
        return type != null
            ? Assets.images.svg.types.veneno.svg()
            : Assets.images.svg.cards.cardPoison.svg();
      case 'ground':
        return type != null
            ? Assets.images.svg.types.tierra.svg()
            : Assets.images.svg.cards.cardGround.svg();
      case 'flying':
        return type != null
            ? Assets.images.svg.types.volador.svg()
            : Assets.images.svg.cards.cardFlying.svg();
      case 'psychic':
        return type != null
            ? Assets.images.svg.types.psQuico.svg()
            : Assets.images.svg.cards.cardPsychic.svg();
      case 'bug':
        return type != null
            ? Assets.images.svg.types.bicho.svg()
            : Assets.images.svg.cards.cardBug.svg();
      case 'rock':
        return type != null
            ? Assets.images.svg.types.roca.svg()
            : Assets.images.svg.cards.cardRock.svg();
      case 'ghost':
        return type != null
            ? Assets.images.svg.types.fantasma.svg()
            : Assets.images.svg.cards.cardGhost.svg();
      case 'dragon':
        return type != null
            ? Assets.images.svg.types.dragon.svg()
            : Assets.images.svg.cards.cardDragon.svg();
      case 'steel':
        return type != null
            ? Assets.images.svg.types.acero.svg()
            : Assets.images.svg.cards.cardSteel.svg();
      case 'dark':
        return type != null
            ? Assets.images.svg.types.siniestro.svg()
            : Assets.images.svg.cards.cardDark.svg();
      case 'fairy':
        return type != null
            ? Assets.images.svg.types.hada.svg()
            : Assets.images.svg.cards.cardFairy.svg();
      case 'stellar':
        return type != null
            ? Assets.images.svg.types.normal.svg()
            : Assets.images.svg.cards.cardNormal.svg();
      case 'unknown':
      default:
        return type != null
            ? Assets.images.svg.types.normal.svg()
            : Assets.images.svg.cards.cardNormal.svg();
    }
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
