import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/domain/typedefs.dart';

void main() {
  group('Typedefs', () {
    test('Json should be Map<String, dynamic>', () {
      Json testJson = {'key': 'value', 'number': 42, 'boolean': true};

      expect(testJson, isA<Map<String, dynamic>>());
      expect(testJson['key'], 'value');
      expect(testJson['number'], 42);
      expect(testJson['boolean'], true);
    });

    test('Json should accept various data types', () {
      Json testJson = {
        'string': 'test',
        'int': 123,
        'double': 45.67,
        'bool': false,
        'list': [1, 2, 3],
        'map': {'nested': 'value'},
        'null': null,
      };

      expect(testJson['string'], isA<String>());
      expect(testJson['int'], isA<int>());
      expect(testJson['double'], isA<double>());
      expect(testJson['bool'], isA<bool>());
      expect(testJson['list'], isA<List>());
      expect(testJson['map'], isA<Map>());
      expect(testJson['null'], isNull);
    });
  });
}
