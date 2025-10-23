import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/data/local/localStorageService.dart';

import '../../../mocks.mocks.dart';

void main() {
  late LocalStorageService localStorageService;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
  });

  group('LocalStorageService', () {
    test('should return string value when key exists', () {
      // arrange
      const tKey = 'test_key';
      const tValue = 'test_value';
      when(mockSharedPreferences.getString(tKey)).thenReturn(tValue);

      // act
      final result = localStorageService.getString(tKey);

      // assert
      expect(result, tValue);
      verify(mockSharedPreferences.getString(tKey));
    });

    test('should return default value when key does not exist', () {
      // arrange
      const tKey = 'test_key';
      const tDefaultValue = 'default';
      when(mockSharedPreferences.getString(tKey)).thenReturn(null);

      // act
      final result =
          localStorageService.getString(tKey, defaultValue: tDefaultValue);

      // assert
      expect(result, tDefaultValue);
      verify(mockSharedPreferences.getString(tKey));
    });

    test('should set string value successfully', () async {
      // arrange
      const tKey = 'test_key';
      const tValue = 'test_value';
      when(mockSharedPreferences.setString(tKey, tValue))
          .thenAnswer((_) async => true);

      // act
      final result = await localStorageService.setString(tKey, tValue);

      // assert
      expect(result, true);
      verify(mockSharedPreferences.setString(tKey, tValue));
    });

    test('should return empty list when getObjectList key does not exist', () {
      // arrange
      const tKey = 'test_key';
      when(mockSharedPreferences.getString(tKey)).thenReturn(null);

      // act
      final result = localStorageService.getObjectList(tKey);

      // assert
      expect(result, []);
      verify(mockSharedPreferences.getString(tKey));
    });
  });
}
