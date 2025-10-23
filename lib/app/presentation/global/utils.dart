import 'package:flutter_svg/svg.dart';

import '../../domain/models/pokemon/pokemon.dart';
import '../../generated/assets.gen.dart';

SvgPicture getAssetForType({Pokemon? pokemon, String? type, String? property}) {
  String? compareType = type?.toLowerCase().trim() ??
      pokemon?.types?.first?.type?.name?.toLowerCase().trim() ??
      property;
  switch (compareType) {
    case 'normal':
      return property != null
          ? Assets.images.svg.properties.normal.svg()
          : type != null
              ? Assets.images.svg.types.normal.svg()
              : Assets.images.svg.cards.cardNormal.svg();
    case 'fire':
      return property != null
          ? Assets.images.svg.properties.fire.svg()
          : type != null
              ? Assets.images.svg.types.fuego.svg()
          : Assets.images.svg.cards.cardFire.svg();
    case 'water':
      return property != null
          ? Assets.images.svg.properties.water.svg()
          : type != null
              ? Assets.images.svg.types.agua.svg()
          : Assets.images.svg.cards.cardWater.svg();
    case 'grass':
      return property != null
          ? Assets.images.svg.properties.grass.svg()
          : type != null
              ? Assets.images.svg.types.planta.svg()
          : Assets.images.svg.cards.cardGrass.svg();
    case 'electric':
      return property != null
          ? Assets.images.svg.properties.electric.svg()
          : type != null
              ? Assets.images.svg.types.electrico.svg()
          : Assets.images.svg.cards.cardElectric.svg();
    case 'ice':
      return property != null
          ? Assets.images.svg.properties.ice.svg()
          : type != null
              ? Assets.images.svg.types.hielo.svg()
          : Assets.images.svg.cards.cardIce.svg();
    case 'fighting':
      return property != null
          ? Assets.images.svg.properties.fighting.svg()
          : type != null
              ? Assets.images.svg.types.lucha.svg()
          : Assets.images.svg.cards.cardFighting.svg();
    case 'poison':
      return property != null
          ? Assets.images.svg.properties.poison.svg()
          : type != null
              ? Assets.images.svg.types.veneno.svg()
          : Assets.images.svg.cards.cardPoison.svg();
    case 'ground':
      return property != null
          ? Assets.images.svg.properties.ground.svg()
          : type != null
              ? Assets.images.svg.types.tierra.svg()
          : Assets.images.svg.cards.cardGround.svg();
    case 'flying':
      return property != null
          ? Assets.images.svg.properties.flying.svg()
          : type != null
              ? Assets.images.svg.types.volador.svg()
          : Assets.images.svg.cards.cardFlying.svg();
    case 'psychic':
      return property != null
          ? Assets.images.svg.properties.psychic.svg()
          : type != null
              ? Assets.images.svg.types.psQuico.svg()
          : Assets.images.svg.cards.cardPsychic.svg();
    case 'bug':
      return property != null
          ? Assets.images.svg.properties.bug.svg()
          : type != null
              ? Assets.images.svg.types.bicho.svg()
          : Assets.images.svg.cards.cardBug.svg();
    case 'rock':
      return property != null
          ? Assets.images.svg.properties.rock.svg()
          : type != null
              ? Assets.images.svg.types.roca.svg()
          : Assets.images.svg.cards.cardRock.svg();
    case 'ghost':
      return property != null
          ? Assets.images.svg.properties.ghost.svg()
          : type != null
              ? Assets.images.svg.types.fantasma.svg()
          : Assets.images.svg.cards.cardGhost.svg();
    case 'dragon':
      return property != null
          ? Assets.images.svg.properties.dragon.svg()
          : type != null
              ? Assets.images.svg.types.dragon.svg()
          : Assets.images.svg.cards.cardDragon.svg();
    case 'steel':
      return property != null
          ? Assets.images.svg.properties.steel.svg()
          : type != null
              ? Assets.images.svg.types.acero.svg()
          : Assets.images.svg.cards.cardSteel.svg();
    case 'dark':
      return property != null
          ? Assets.images.svg.properties.dark.svg()
          : type != null
              ? Assets.images.svg.types.siniestro.svg()
          : Assets.images.svg.cards.cardDark.svg();
    case 'fairy':
      return property != null
          ? Assets.images.svg.properties.fairy.svg()
          : type != null
              ? Assets.images.svg.types.hada.svg()
          : Assets.images.svg.cards.cardFairy.svg();
    case 'stellar':
      return property != null
          ? Assets.images.svg.properties.normal.svg()
          : type != null
              ? Assets.images.svg.types.normal.svg()
          : Assets.images.svg.cards.cardNormal.svg();
    case 'unknown':
    default:
      return property != null
          ? Assets.images.svg.properties.normal.svg()
          : type != null
              ? Assets.images.svg.types.normal.svg()
          : Assets.images.svg.cards.cardNormal.svg();
  }
}
