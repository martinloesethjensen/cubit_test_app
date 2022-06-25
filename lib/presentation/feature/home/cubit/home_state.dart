import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  factory HomeState({
    required int counter,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(counter: 0);
  }
}
