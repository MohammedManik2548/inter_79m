// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirstTestState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<FirstTestModel>? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirstTestStateCopyWith<FirstTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstTestStateCopyWith<$Res> {
  factory $FirstTestStateCopyWith(
          FirstTestState value, $Res Function(FirstTestState) then) =
      _$FirstTestStateCopyWithImpl<$Res, FirstTestState>;
  @useResult
  $Res call({bool isLoading, List<FirstTestModel>? data});
}

/// @nodoc
class _$FirstTestStateCopyWithImpl<$Res, $Val extends FirstTestState>
    implements $FirstTestStateCopyWith<$Res> {
  _$FirstTestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FirstTestModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstTestStateImplCopyWith<$Res>
    implements $FirstTestStateCopyWith<$Res> {
  factory _$$FirstTestStateImplCopyWith(_$FirstTestStateImpl value,
          $Res Function(_$FirstTestStateImpl) then) =
      __$$FirstTestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<FirstTestModel>? data});
}

/// @nodoc
class __$$FirstTestStateImplCopyWithImpl<$Res>
    extends _$FirstTestStateCopyWithImpl<$Res, _$FirstTestStateImpl>
    implements _$$FirstTestStateImplCopyWith<$Res> {
  __$$FirstTestStateImplCopyWithImpl(
      _$FirstTestStateImpl _value, $Res Function(_$FirstTestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
  }) {
    return _then(_$FirstTestStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FirstTestModel>?,
    ));
  }
}

/// @nodoc

class _$FirstTestStateImpl extends _FirstTestState {
  const _$FirstTestStateImpl(
      {this.isLoading = false, final List<FirstTestModel>? data = null})
      : _data = data,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<FirstTestModel>? _data;
  @override
  @JsonKey()
  List<FirstTestModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FirstTestState(isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstTestStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstTestStateImplCopyWith<_$FirstTestStateImpl> get copyWith =>
      __$$FirstTestStateImplCopyWithImpl<_$FirstTestStateImpl>(
          this, _$identity);
}

abstract class _FirstTestState extends FirstTestState {
  const factory _FirstTestState(
      {final bool isLoading,
      final List<FirstTestModel>? data}) = _$FirstTestStateImpl;
  const _FirstTestState._() : super._();

  @override
  bool get isLoading;
  @override
  List<FirstTestModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FirstTestStateImplCopyWith<_$FirstTestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
