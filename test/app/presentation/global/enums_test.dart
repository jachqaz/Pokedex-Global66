import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/global/enums.dart';

void main() {
  group('TipoPokemon', () {
    test('should have all expected pokemon types', () {
      final expectedTypes = [
        TipoPokemon.Acero,
        TipoPokemon.Agua,
        TipoPokemon.Bicho,
        TipoPokemon.Dragon,
        TipoPokemon.Electrico,
        TipoPokemon.Fantasma,
        TipoPokemon.Fuego,
        TipoPokemon.Hada,
        TipoPokemon.Hielo,
        TipoPokemon.Lucha,
        TipoPokemon.Normal,
        TipoPokemon.Planta,
        TipoPokemon.Psquico,
        TipoPokemon.Roca,
        TipoPokemon.Siniestro,
        TipoPokemon.Tierra,
        TipoPokemon.Veneno,
        TipoPokemon.Volador,
      ];

      expect(TipoPokemon.values.length, expectedTypes.length);

      for (final type in expectedTypes) {
        expect(TipoPokemon.values, contains(type));
      }
    });

    test('should have correct string representation', () {
      expect(TipoPokemon.Fuego.name, 'Fuego');
      expect(TipoPokemon.Agua.name, 'Agua');
      expect(TipoPokemon.Planta.name, 'Planta');
      expect(TipoPokemon.Electrico.name, 'Electrico');
    });

    test('should be able to iterate through all values', () {
      int count = 0;
      for (final type in TipoPokemon.values) {
        expect(type, isA<TipoPokemon>());
        count++;
      }
      expect(count, TipoPokemon.values.length);
    });

    test('should have unique values', () {
      final typeNames = TipoPokemon.values.map((type) => type.name).toSet();
      expect(typeNames.length, TipoPokemon.values.length);
    });
  });
}
