import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color tapBarActive = Color(0xFF424242);
  static const Color tapBarDefault = Color(0xFF0D47A1);
  static const Color buttonPrimary = Color(0xFF1E88E5);
  static const Color buttonPrimaryHover = Color(0xFF1976D2);
  static const Color buttonPrimaryPressed = Color(0xFF1565C0);
  static const Color buttonCancel = Color(0xFFEEEEEE);
  static const Color azulNormal = Color(0xFF173EA5);
  static Color azulSemiLight = Color(0xFF4565B7).withOpacity(0.25);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color textTitle = Color(0xFF333333);
  static const Color textContent = Color(0xFF4D4D4D);
  static const Color checkboxSelected = Color(0xFF0D47A1);
  static const Color textCard = Color(0xFF424242);
  static const Color cardNormal = Color(0xFFA8A878);
  static const Color cardFire = Color(0xFFF08030);
  static const Color cardWater = Color(0xFF6890F0);
  static const Color cardGrass = Color(0xFF78C850);
  static const Color cardElectric = Color(0xFFF8D030);
  static const Color cardIce = Color(0xFF98D8D8);
  static const Color cardFighting = Color(0xFFC03028);
  static const Color cardPoison = Color(0xFFA040A0);
  static const Color cardGround = Color(0xFFE0C068);
  static const Color cardFlying = Color(0xFFA890F0);
  static const Color cardPsychic = Color(0xFFF85888);
  static const Color cardBug = Color(0xFFA8B820);
  static const Color cardRock = Color(0xFFB8A038);
  static const Color cardGhost = Color(0xFF705898);
  static const Color cardDragon = Color(0xFF7038F8);
  static const Color cardSteel = Color(0xB8B8D0);
  static const Color cardDark = Color(0xFF705848);
  static const Color cardFairy = Color(0xFFEE99AC);
  static const Color cardStellar = Color(0xFF4C8F8F);
  static const Color cardUnknown = Color(0xFF68A090);
  static Color getColorForType(type) {
    switch (type) {
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
}
