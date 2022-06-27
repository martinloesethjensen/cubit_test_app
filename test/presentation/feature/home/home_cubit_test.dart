import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_test_app/domain/usecases/counter/decrement_use_case.dart';
import 'package:cubit_test_app/domain/usecases/counter/increment_use_case.dart';
import 'package:cubit_test_app/presentation/feature/home/cubit/home_cubit.dart';
import 'package:cubit_test_app/presentation/feature/home/cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDecrementUseCase extends Mock implements DecrementUseCase {}

class MockIncrementUseCase extends Mock implements IncrementUseCase {}

void main() {
  late IncrementUseCase incrementUseCase;
  late DecrementUseCase decrementUseCase;

  setUp(() {
    incrementUseCase = MockIncrementUseCase();
    decrementUseCase = MockDecrementUseCase();
  });

  const input = 1;

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits initial state',
      build: () => HomeCubit(incrementUseCase, decrementUseCase),
      verify: (cubit) {
        expect(cubit.state.counter, 0);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should increment counter',
      seed: () => HomeState(counter: input),
      build: () {
        when(() => incrementUseCase.run(input)).thenReturn(input + 1);
        return HomeCubit(incrementUseCase, decrementUseCase);
      },
      act: (cubit) => cubit.increment(),
      expect: () => [
        HomeState(counter: input + 1),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should decrement counter',
      seed: () => HomeState(counter: input),
      build: () {
        when(() => decrementUseCase.run(input)).thenReturn(input - 1);
        return HomeCubit(incrementUseCase, decrementUseCase);
      },
      act: (cubit) => cubit.decrement(),
      expect: () => [
        HomeState(counter: input - 1),
      ],
    );
  });
}
