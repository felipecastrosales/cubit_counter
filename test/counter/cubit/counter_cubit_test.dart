import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_counter/counter/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('increment', () {
      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2, 3] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit
          ..increment()
          ..increment()
          ..increment(),
        expect: () => const <int>[1, 2, 3],
      );

      blocTest<CounterCubit, int>(
        'emits [16] when state is 15',
        build: CounterCubit.new,
        seed: () => 15,
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[16],
      );

      group('decrement', () {
        blocTest<CounterCubit, int>(
          'emits [-1] when state is 0',
          build: CounterCubit.new,
          act: (cubit) => cubit.decrement(),
          expect: () => const <int>[-1],
        );

        blocTest<CounterCubit, int>(
          'emits [-1, -2, -3] when state is 0',
          build: CounterCubit.new,
          act: (cubit) => cubit
            ..decrement()
            ..decrement()
            ..decrement(),
          expect: () => const <int>[-1, -2, -3],
        );

        blocTest<CounterCubit, int>(
          'emits [-16] when state is -15',
          build: CounterCubit.new,
          seed: () => -15,
          act: (cubit) => cubit.decrement(),
          expect: () => const <int>[-16],
        );
      });
    });
  });
}
