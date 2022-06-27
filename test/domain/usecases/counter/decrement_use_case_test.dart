import 'package:cubit_test_app/domain/usecases/counter/decrement_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDecrementUseCase extends Mock implements DecrementUseCase {}

void main() {
  late DecrementUseCase decrementUseCase;

  setUp(() {
    decrementUseCase = MockDecrementUseCase();
  });

  const input = 1;

  group('DecrementUseCase', () {
    test('should decrement counter when successful', () {
      when(() => decrementUseCase.run(input)).thenReturn(input - 1);

      final result = decrementUseCase.run(input);

      expect(result, equals(input - 1));
    });
  });
}
