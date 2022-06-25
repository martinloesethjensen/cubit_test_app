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

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits initial state',
      build: () => HomeCubit(incrementUseCase, decrementUseCase),
      verify: (cubit) {
        expect(cubit.state.counter, 0);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should increment counter to 11',
      seed: () => HomeState(counter: 10),
      build: () {
        const input = 10;
        when(() => incrementUseCase.run(input)).thenReturn(11);
        return HomeCubit(incrementUseCase, decrementUseCase);
      },
      act: (cubit) => cubit.increment(),
      expect: () => [
        HomeState(counter: 11),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should decrement counter to 42',
      seed: () => HomeState(counter: 43),
      build: () {
        const input = 43;
        when(() => decrementUseCase.run(input)).thenReturn(42);
        return HomeCubit(incrementUseCase, decrementUseCase);
      },
      act: (cubit) => cubit.decrement(),
      expect: () => [
        HomeState(counter: 42),
      ],
    );
  });
}
