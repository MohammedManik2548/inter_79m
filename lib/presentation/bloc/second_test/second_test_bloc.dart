import 'dart:async';
import 'dart:math';
import 'package:code_test/presentation/bloc/second_test/second_test_event.dart';
import 'package:code_test/presentation/bloc/second_test/second_test_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_test/models/second_test_model.dart';
import 'package:equatable/equatable.dart';

const _itemsPerPage = 30;
const _totalMockItems = 1000000;

class SecondTestBloc extends Bloc<SecondTestEvent, SecondTestState> {
  SecondTestBloc() : super(const SecondTestState()) {
    on<LoadSecondTestData>(_onLoadSecondTestData, transformer: _throttleDroppable(_throttleDuration));
  }

  static const _throttleDuration = Duration(milliseconds: 300);

  static EventTransformer<E> _throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return events.timeout(duration).asyncExpand(mapper);
    };
  }

  Future<List<SecondTestModel>> _fetchMockData(int startIndex, int limit) async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(400) + 200)); // Simulate varied delay

    if (startIndex >= _totalMockItems) {
      return [];
    }

    final List<SecondTestModel> items = [];
    final endIndex = min(startIndex + limit, _totalMockItems);

    for (int i = startIndex; i < endIndex; i++) {
      items.add(
        SecondTestModel(
          id: 'item_${i}_${DateTime.now().microsecondsSinceEpoch}', // Unique ID
          name: 'Entry ${i + 1}',
          level: (i % 20) + 1,
          isActive: Random().nextDouble() > 0.05,
        ),
      );
    }
    return items;
  }

  Future<void> _onLoadSecondTestData(
      LoadSecondTestData event,
      Emitter<SecondTestState> emit,
      ) async {
    if (state.hasReachedMax && !event.isRefresh) return;

    try {
      if (event.isInitialLoad || event.isRefresh) {
        emit(state.copyWith(status: SecondTestStatus.loading, items: event.isRefresh ? [] : null, hasReachedMax: false));
        final items = await _fetchMockData(0, _itemsPerPage);
        return emit(state.copyWith(
          status: SecondTestStatus.success,
          items: items,
          hasReachedMax: items.length < _itemsPerPage || items.length >= _totalMockItems,
          clearErrorMessage: true,
        ));
      }

      /// Loading more items
      if (state.status == SecondTestStatus.loadingMore) return;

      emit(state.copyWith(status: SecondTestStatus.loadingMore));
      final newItems = await _fetchMockData(state.items.length, _itemsPerPage);

      if (newItems.isEmpty) {
        emit(state.copyWith(status: SecondTestStatus.success, hasReachedMax: true));
      } else {
        emit(state.copyWith(
          status: SecondTestStatus.success,
          items: List.of(state.items)..addAll(newItems),
          hasReachedMax: newItems.length < _itemsPerPage || (state.items.length + newItems.length) >= _totalMockItems,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: SecondTestStatus.failure, errorMessage: e.toString()));
    }
  }
}
