import 'package:cubit_test_app/domain/usecases/counter/increment_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIncrementUseCase extends Mock implements IncrementUseCase {}

void main() {
  late IncrementUseCase incrementUseCase;

  setUp(() {
    incrementUseCase = MockIncrementUseCase();
  });

  const input = 1;

  group('IncrementUseCase', () {
    test('should increment counter when successful', () {
      when(() => incrementUseCase.run(input)).thenReturn(input + 1);

      final result = incrementUseCase.run(input);

      expect(result, equals(input + 1));
    });
  });
}
