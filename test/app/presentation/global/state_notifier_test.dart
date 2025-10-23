import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/presentation/global/state_notifier.dart';

class TestState {
  final int value;

  const TestState(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestState &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class TestStateNotifier extends StateNotifier<TestState> {
  TestStateNotifier(TestState state) : super(state);

  void updateValue(int newValue) {
    state = TestState(newValue);
  }

  void onlyUpdateValue(int newValue) {
    onlyUpdate(TestState(newValue));
  }
}

void main() {
  group('StateNotifier', () {
    late TestStateNotifier notifier;
    const initialState = TestState(0);

    setUp(() {
      notifier = TestStateNotifier(initialState);
    });

    tearDown(() {
      notifier.dispose();
    });

    test('should initialize with provided state', () {
      expect(notifier.state, initialState);
      expect(notifier.oldState, initialState);
      expect(notifier.mounted, true);
    });

    test('should update state and notify listeners', () {
      bool listenerCalled = false;
      notifier.addListener(() {
        listenerCalled = true;
      });

      const newState = TestState(1);
      notifier.state = newState;

      expect(notifier.state, newState);
      expect(notifier.oldState, initialState);
      expect(listenerCalled, true);
    });

    test('should not notify listeners when state is the same', () {
      bool listenerCalled = false;
      notifier.addListener(() {
        listenerCalled = true;
      });

      notifier.state = initialState;

      expect(listenerCalled, false);
    });

    test(
        'should update state without notifying listeners when using onlyUpdate',
        () {
      bool listenerCalled = false;
      notifier.addListener(() {
        listenerCalled = true;
      });

      notifier.onlyUpdateValue(2);

      expect(notifier.state.value, 2);
      expect(notifier.oldState, initialState);
      expect(listenerCalled, false);
    });

    test('should set mounted to false when disposed', () {
      notifier.dispose();
      expect(notifier.mounted, false);
    });

    test('should track old state correctly after multiple updates', () {
      const firstUpdate = TestState(1);
      const secondUpdate = TestState(2);

      notifier.state = firstUpdate;
      expect(notifier.oldState, initialState);

      notifier.state = secondUpdate;
      expect(notifier.oldState, firstUpdate);
      expect(notifier.state, secondUpdate);
    });
  });
}
