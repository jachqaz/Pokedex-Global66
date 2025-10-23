import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/theme/app_text_styles.dart';

void main() {
  group('AppTextStyles', () {
    test('should have correct Montserrat medium small style', () {
      final style = AppTextStyles.montserratMediumSm;
      expect(style.fontFamily, 'Montserrat');
      expect(style.fontWeight, FontWeight.w500);
      expect(style.fontSize, 14);
      expect(style.height, 1.0);
      expect(style.letterSpacing, 0);
    });

    test('should have correct Poppins regular 14 style', () {
      final style = AppTextStyles.poppinsRegular14;
      expect(style.fontFamily, 'Poppins');
      expect(style.fontWeight, FontWeight.w400);
      expect(style.fontSize, 14);
      expect(style.height, 1.5);
      expect(style.letterSpacing, 0);
    });

    test('should have correct Poppins semibold 20 style', () {
      final style = AppTextStyles.poppinsSemiBold20;
      expect(style.fontFamily, 'Poppins');
      expect(style.fontWeight, FontWeight.w600);
      expect(style.fontSize, 20);
      expect(style.height, 1.0);
      expect(style.letterSpacing, 0);
    });

    test('should have correct Poppins medium 12 uppercase style', () {
      final style = AppTextStyles.poppinsMedium12Uppercase;
      expect(style.fontFamily, 'Poppins');
      expect(style.fontWeight, FontWeight.w500);
      expect(style.fontSize, 12);
      expect(style.height, 1.0);
      expect(style.letterSpacing, 0.05);
    });

    test(
        'should have underline decoration for montserrat medium small underline',
        () {
      final style = AppTextStyles.montserratMediumSmUnderline;
      expect(style.decoration, TextDecoration.underline);
      expect(style.decorationStyle, TextDecorationStyle.solid);
    });
  });
}
