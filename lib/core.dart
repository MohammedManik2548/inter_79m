
import 'package:freezed_annotation/freezed_annotation.dart';

const Freezed freezedBlocState = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: true,
  map: FreezedMapOptions.none,
);