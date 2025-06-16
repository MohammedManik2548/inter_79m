import 'package:equatable/equatable.dart';

abstract class SecondTestEvent extends Equatable {
  const SecondTestEvent();

  @override
  List<Object> get props => [];
}

class LoadSecondTestData extends SecondTestEvent {
  final bool isInitialLoad;
  final bool isRefresh;

  const LoadSecondTestData({
    this.isInitialLoad = true,
    this.isRefresh = false,
  });

  @override
  List<Object> get props => [isInitialLoad, isRefresh];
}