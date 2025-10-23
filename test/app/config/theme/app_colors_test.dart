import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/theme/app_colors.dart';

void main() {
  group('AppColors', () {
    test('should return correct color for normal type', () {
      final color = AppColors.getColorForType('normal');
      expect(color, AppColors.cardNormal);
    });

    test('should return correct color for fire type', () {
      final color = AppColors.getColorForType('fire');
      expect(color, AppColors.cardFire);
    });

    test('should return correct color for water type', () {
      final color = AppColors.getColorForType('water');
      expect(color, AppColors.cardWater);
    });

    test('should return correct color for grass type', () {
      final color = AppColors.getColorForType('grass');
      expect(color, AppColors.cardGrass);
    });

    test('should return correct color for electric type', () {
      final color = AppColors.getColorForType('electric');
      expect(color, AppColors.cardElectric);
    });

    test('should return unknown color for invalid type', () {
      final color = AppColors.getColorForType('invalid');
      expect(color, AppColors.cardUnknown);
    });

    test('should return unknown color for null type', () {
      final color = AppColors.getColorForType(null);
      expect(color, AppColors.cardUnknown);
    });

    test('should have correct primary colors defined', () {
      expect(AppColors.primaryBlue, const Color(0xFF1E88E5));
      expect(AppColors.white, const Color(0xFFFFFFFF));
      expect(AppColors.black, const Color(0xFF000000));
    });
  });
}
