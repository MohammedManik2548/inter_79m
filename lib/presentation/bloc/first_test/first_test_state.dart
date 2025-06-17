part of 'first_test_bloc.dart';

@freezedBlocState
class FirstTestState with _$FirstTestState {
  const FirstTestState._();

  const factory FirstTestState({
    @Default(false) bool isLoading,
    @Default(null) List<FirstTestModel>? data,
  }) = _FirstTestState;

  static const FirstTestState init = FirstTestState();
}
