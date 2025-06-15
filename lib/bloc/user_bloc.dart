import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_test/core.dart';
import 'package:code_test/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_bloc.freezed.dart';

part 'user_state.dart';

@injectable
abstract class UserBloc extends StateStreamableSource<UserState> {
  @factoryMethod
  factory UserBloc() = _UserBlocImpl;

  void tryToLevelUp();
}

class _UserBlocImpl extends Cubit<UserState> implements UserBloc {
  _UserBlocImpl() : super(UserState.init);

  @override
  void tryToLevelUp() {
    var currentLevel = state.user.level;
    if (faker.randomGenerator.boolean()) {
      currentLevel = min(currentLevel + 1, 10);
    } else {
      currentLevel = max(currentLevel - 1, 1);
    }
    emit(state.copyWith(user: state.user.copyWith(level: currentLevel)));
  }
}
