import 'package:flutter_svg/svg.dart';

import '../../domain/models/pokemon/pokemon.dart';
import '../../generated/assets.gen.dart';

SvgPicture getAssetForType({Pokemon? pokemon, String? type}) {
  String? compareType = type?.toLowerCase().trim() ??
      pokemon?.types?.first?.type?.name?.toLowerCase().trim();
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
