import 'package:cubit_test_app/domain/usecases/counter/decrement_use_case.dart';
import 'package:cubit_test_app/domain/usecases/counter/increment_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._incrementUseCase,
    this._decrementUseCase,
  ) : super(HomeState.initial());

  final IncrementUseCase _incrementUseCase;
  final DecrementUseCase _decrementUseCase;

  int get _counter => state.counter;

  void increment() {
    emit(
      state.copyWith(
        counter: _incrementUseCase.run(_counter),
      ),
    );
  }

  void decrement() {
    emit(
      state.copyWith(
        counter: _decrementUseCase.run(_counter),
      ),
    );
  }
}
