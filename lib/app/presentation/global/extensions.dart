

extension StringExtension on String {
  String capitalize() {
    if (isEmpty || trim().isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension TipoStringListExtension on List<String> {
  List<String> toEnglishTypes() {
    const Map<String, String> traducciones = {
      "Acero": "steel",
      "Agua": "water",
      "Bicho": "bug",
      "Dragon": "dragon",
      "Electrico": "electric",
      "Fantasma": "ghost",
      "Fuego": "fire",
      "Hada": "fairy",
      "Hielo": "ice",
      "Lucha": "fighting",
      "Normal": "normal",
      "Planta": "grass",
      "Psquico": "psychic",
      "Roca": "rock",
      "Siniestro": "dark",
      "Tierra": "ground",
      "Veneno": "poison",
      "Volador": "flying",
    };

    return map((tipoEspanol) {
      return traducciones[tipoEspanol] ?? tipoEspanol;
    }).toList();
  }
}

class TypeTranslator {
  static const Map<String, String> _spanishToEnglish = {
    "Acero": "steel",
    "Agua": "water",
    "Bicho": "bug",
    "Dragon": "dragon",
    "Electrico": "electric",
    "Fantasma": "ghost",
    "Fuego": "fire",
    "Hada": "fairy",
    "Hielo": "ice",
    "Lucha": "fighting",
    "Normal": "normal",
    "Planta": "grass",
    "Psquico": "psychic",
    "Roca": "rock",
    "Siniestro": "dark",
    "Tierra": "ground",
    "Veneno": "poison",
    "Volador": "flying",
  };

  static const Map<String, String> _englishToSpanish = {
    "steel": "Acero",
    "water": "Agua",
    "bug": "Bicho",
    "dragon": "Dragon",
    "electric": "Electrico",
    "ghost": "Fantasma",
    "fire": "Fuego",
    "fairy": "Hada",
    "ice": "Hielo",
    "fighting": "Lucha",
    "normal": "Normal",
    "grass": "Planta",
    "psychic": "Psquico",
    "rock": "Roca",
    "dark": "Siniestro",
    "ground": "Tierra",
    "poison": "Veneno",
    "flying": "Volador",
  };

  static String toEnglish(String spanish) =>
      _spanishToEnglish[spanish] ?? spanish;

  static String toSpanish(String english) =>
      _englishToSpanish[english] ?? english;
}
