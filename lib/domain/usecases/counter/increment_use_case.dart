import 'package:cubit_test_app/domain/common/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncrementUseCase extends UseCase<int, int> {
  @override
  int run(int input) {
    return input + 1;
  }
}
