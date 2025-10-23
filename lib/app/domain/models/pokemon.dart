class Pokemon {
  final String id;
  final String number;
  final String name;
  final String type;
  final String description;
  final String height;
  final String weight;
  final String category;
  final String ability;
  final List<String> types;
  final List<String> weaknesses;
  final double maleRatio;

  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.type,
    required this.description,
    required this.height,
    required this.weight,
    required this.category,
    required this.ability,
    required this.types,
    required this.weaknesses,
    required this.maleRatio,
  });

  // Constructor alternativo para compatibilidad con código existente
  Pokemon.fromBasic({
    required this.id,
    required this.number,
    required this.name,
    required this.type,
    required this.description,
    required this.height,
    required this.weight,
    required this.category,
  })  : ability = '',
        types = [type],
        weaknesses = _getDefaultWeaknesses(type),
        maleRatio = 0.5;

  // Método para obtener debilidades por defecto basadas en el tipo
  static List<String> _getDefaultWeaknesses(String type) {
    switch (type.toLowerCase()) {
      case 'planta':
      case 'veneno':
        return ['Fuego', 'Volador', 'Hielo', 'Psíquico'];
      case 'fuego':
        return ['Agua', 'Tierra', 'Roca'];
      case 'agua':
        return ['Planta', 'Eléctrico'];
      case 'eléctrico':
        return ['Tierra'];
      case 'volador':
        return ['Eléctrico', 'Hielo', 'Roca'];
      default:
        return ['Lucha'];
    }
  }

  // Método para convertir a mapa (útil para persistencia)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'type': type,
      'description': description,
      'height': height,
      'weight': weight,
      'category': category,
      'ability': ability,
      'types': types,
      'weaknesses': weaknesses,
      'maleRatio': maleRatio,
    };
  }

  // Método para crear desde mapa
  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] ?? '',
      number: map['number'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      category: map['category'] ?? '',
      ability: map['ability'] ?? '',
      types: List<String>.from(map['types'] ?? []),
      weaknesses: List<String>.from(map['weaknesses'] ?? []),
      maleRatio: (map['maleRatio'] ?? 0.5).toDouble(),
    );
  }

  // Copiar con modificaciones
  Pokemon copyWith({
    String? id,
    String? number,
    String? name,
    String? type,
    String? description,
    String? height,
    String? weight,
    String? category,
    String? ability,
    List<String>? types,
    List<String>? weaknesses,
    double? maleRatio,
  }) {
    return Pokemon(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      category: category ?? this.category,
      ability: ability ?? this.ability,
      types: types ?? this.types,
      weaknesses: weaknesses ?? this.weaknesses,
      maleRatio: maleRatio ?? this.maleRatio,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, number: $number, type: $type}';
  }
}

// Lista de ejemplo actualizada con todas las propiedades
final List<Pokemon> samplePokemons = [
  Pokemon(
    id: '1',
    number: '001',
    name: 'Bulbasaur',
    type: 'Planta/Veneno',
    description:
        'Tienes uma semilha de planta en la espalda desde que nada. La semilha carece lentamente.',
    height: '0.7 m',
    weight: '6.9 kg',
    category: 'Semilla',
    ability: 'Espesura',
    types: ['Planta', 'Veneno'],
    weaknesses: ['Fuego', 'Volador', 'Hielo', 'Psíquico'],
    maleRatio: 0.875,
  ),
  Pokemon(
    id: '2',
    number: '002',
    name: 'Ivysaur',
    type: 'Planta/Veneno',
    description:
        'Cuando el bulbo de su espalda crece, parece no poder ponerse de pie sobre sus patas traseras.',
    height: '1.0 m',
    weight: '13.0 kg',
    category: 'Semilla',
    ability: 'Espesura',
    types: ['Planta', 'Veneno'],
    weaknesses: ['Fuego', 'Volador', 'Hielo', 'Psíquico'],
    maleRatio: 0.875,
  ),
  Pokemon(
    id: '3',
    number: '003',
    name: 'Venusaur',
    type: 'Planta/Veneno',
    description:
        'La planta florece cuando absorbe energía solar. Ésta le obliga a buscar la luz del sol.',
    height: '2.0 m',
    weight: '100.0 kg',
    category: 'Semilla',
    ability: 'Espesura',
    types: ['Planta', 'Veneno'],
    weaknesses: ['Fuego', 'Volador', 'Hielo', 'Psíquico'],
    maleRatio: 0.875,
  ),
  Pokemon(
    id: '4',
    number: '004',
    name: 'Charmander',
    type: 'Fuego',
    description:
        'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.',
    height: '0.6 m',
    weight: '8.5 kg',
    category: 'Lagartija',
    ability: 'Mar Llamas',
    types: ['Fuego'],
    weaknesses: ['Agua', 'Tierra', 'Roca'],
    maleRatio: 0.875,
  ),
  Pokemon(
    id: '5',
    number: '005',
    name: 'Charmeleon',
    type: 'Fuego',
    description:
        'Cuando balancea su ardiente cola, eleva la temperatura a niveles muy altos.',
    height: '1.1 m',
    weight: '19.0 kg',
    category: 'Llama',
    ability: 'Mar Llamas',
    types: ['Fuego'],
    weaknesses: ['Agua', 'Tierra', 'Roca'],
    maleRatio: 0.875,
  ),
];
