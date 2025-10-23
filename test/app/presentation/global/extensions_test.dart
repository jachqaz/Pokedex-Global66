import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/global/extensions.dart';

void main() {
  group('StringExtension', () {
    test('should capitalize first letter of string', () {
      expect('hello'.capitalize(), 'Hello');
      expect('HELLO'.capitalize(), 'HELLO');
      expect('hELLO'.capitalize(), 'HELLO');
    });

    test('should return empty string when input is empty', () {
      expect(''.capitalize(), '');
    });

    test('should return same string when input is only whitespace', () {
      expect('   '.capitalize(), '   ');
    });

    test('should handle single character', () {
      expect('a'.capitalize(), 'A');
      expect('A'.capitalize(), 'A');
    });
  });

  group('TipoStringListExtension', () {
    test('should translate Spanish types to English', () {
      final spanishTypes = ['Fuego', 'Agua', 'Planta'];
      final englishTypes = spanishTypes.toEnglishTypes();

      expect(englishTypes, ['fire', 'water', 'grass']);
    });

    test('should return original type if translation not found', () {
      final spanishTypes = ['UnknownType'];
      final englishTypes = spanishTypes.toEnglishTypes();

      expect(englishTypes, ['UnknownType']);
    });

    test('should handle empty list', () {
      final spanishTypes = <String>[];
      final englishTypes = spanishTypes.toEnglishTypes();

      expect(englishTypes, <String>[]);
    });
  });

  group('TypeTranslator', () {
    test('should translate Spanish to English correctly', () {
      expect(TypeTranslator.toEnglish('Fuego'), 'fire');
      expect(TypeTranslator.toEnglish('Agua'), 'water');
      expect(TypeTranslator.toEnglish('Planta'), 'grass');
      expect(TypeTranslator.toEnglish('Electrico'), 'electric');
    });

    test('should translate English to Spanish correctly', () {
      expect(TypeTranslator.toSpanish('fire'), 'Fuego');
      expect(TypeTranslator.toSpanish('water'), 'Agua');
      expect(TypeTranslator.toSpanish('grass'), 'Planta');
      expect(TypeTranslator.toSpanish('electric'), 'Electrico');
    });

    test('should return original value if translation not found', () {
      expect(TypeTranslator.toEnglish('UnknownType'), 'UnknownType');
      expect(TypeTranslator.toSpanish('unknown'), 'unknown');
    });
  });
}
