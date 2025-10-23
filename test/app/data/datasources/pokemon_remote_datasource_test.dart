import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/data/datasources/pokemon_remote_datasource.dart';

import '../../../mocks.mocks.dart';

void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = PokemonRemoteDataSourceImpl(mockDio);
  });

  group('PokemonRemoteDataSourceImpl', () {
    final tPokemonJson = {
      'id': 1,
      'name': 'bulbasaur',
      'height': 7,
      'weight': 69,
      'types': [
        {
          'slot': 1,
          'type': {'name': 'grass', 'url': 'https://pokeapi.co/api/v2/type/12/'}
        }
      ],
      'sprites': {
        'front_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
      },
      'abilities': [],
      'moves': [],
      'stats': [],
    };

    final tSpeciesJson = {
      'flavor_text_entries': [
        {
          'flavor_text': 'A strange seed was planted on its back at birth.',
          'language': {'name': 'en'}
        }
      ]
    };

    final tTypeJson = {
      'damage_relations': {
        'double_damage_from': [
          {'name': 'fire', 'url': 'https://pokeapi.co/api/v2/type/10/'}
        ]
      }
    };

    test('should return pokemon count when call is successful', () async {
      // arrange
      when(mockDio.get('https://pokeapi.co/api/v2/pokemon'))
          .thenAnswer((_) async => Response(
                data: {'count': 1302},
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      // act
      final result = await dataSource.getPokemonCount();

      // assert
      expect(result, 1302);
      verify(mockDio.get('https://pokeapi.co/api/v2/pokemon'));
    });

    test('should throw exception when getPokemonCount fails', () async {
      // arrange
      when(mockDio.get('https://pokeapi.co/api/v2/pokemon'))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // act & assert
      expect(() => dataSource.getPokemonCount(), throwsException);
    });
  });
}
