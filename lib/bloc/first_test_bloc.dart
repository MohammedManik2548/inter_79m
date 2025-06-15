import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:code_test/core.dart';
import 'package:code_test/models/first_test_model.dart';
import 'package:injectable/injectable.dart';

part 'first_test_bloc.freezed.dart';

part 'first_test_state.dart';

@injectable
abstract class FirstTestBloc extends StateStreamableSource<FirstTestState> {
  @factoryMethod
  factory FirstTestBloc() = _FirstTestBlocImpl;
}

class _FirstTestBlocImpl extends Cubit<FirstTestState> implements FirstTestBloc {
  _FirstTestBlocImpl() : super(FirstTestState.init) {
    _init();
  }

  void _init() {
    emit(state.copyWith(isLoading: true));
    final data = <FirstTestModel>[];
    for (var i = 0; i < 1000 * 1000; i++) {
      data.add(
        FirstTestModel(
          name: faker.person.name(),
          level: faker.randomGenerator.integer(10, min: 1),
          isActive: faker.randomGenerator.boolean(),
        ),
      );
    }

    emit(state.copyWith(isLoading: false, data: data));
  }
}
