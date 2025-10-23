import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/config/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('should create light theme when isDarkmode is false', () {
      // arrange
      final appTheme = AppTheme(isDarkmode: false);

      // act
      final theme = appTheme.getTheme();

      // assert
      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, true);
    });

    test('should create dark theme when isDarkmode is true', () {
      // arrange
      final appTheme = AppTheme(isDarkmode: true);

      // act
      final theme = appTheme.getTheme();

      // assert
      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, true);
    });

    test('should have correct seed color', () {
      // arrange
      final appTheme = AppTheme(isDarkmode: false);

      // act
      final theme = appTheme.getTheme();

      // assert
      expect(theme.colorScheme.primary, isNotNull);
    });

    test('should have correct list tile theme', () {
      // arrange
      final appTheme = AppTheme(isDarkmode: false);

      // act
      final theme = appTheme.getTheme();

      // assert
      expect(
          theme.listTileTheme.iconColor, const Color.fromARGB(255, 7, 80, 59));
    });
  });
}
