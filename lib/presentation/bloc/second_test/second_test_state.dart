import 'package:equatable/equatable.dart';
import '../../../models/second_test_model.dart';

enum SecondTestStatus { initial, loading, success, failure, loadingMore }

class SecondTestState extends Equatable {
  final SecondTestStatus status;
  final List<SecondTestModel> items;
  final bool hasReachedMax;
  final String? errorMessage;

  const SecondTestState({
    this.status = SecondTestStatus.initial,
    this.items = const <SecondTestModel>[],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  List<SecondTestModel> get activeDisplayData {
    return items.where((item) => item.isActive).toList();
  }

  SecondTestState copyWith({
    SecondTestStatus? status,
    List<SecondTestModel>? items,
    bool? hasReachedMax,
    String? errorMessage,
    bool? clearErrorMessage,
  }) {
    return SecondTestState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: clearErrorMessage == true ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, items, hasReachedMax, errorMessage/*, currentFilter*/];
}