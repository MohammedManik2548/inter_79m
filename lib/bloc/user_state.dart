part of 'user_bloc.dart';

@freezedBlocState
class UserState with _$UserState {
  const UserState._();

  const factory UserState({
    required User user,
  }) = _UserState;

  static const UserState init = UserState(user: User(level: 1));
}
