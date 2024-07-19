// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPendingPaymentData,
    required TResult Function() getApprovedPaymentData,
    required TResult Function() getRejectedPaymentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPendingPaymentData,
    TResult? Function()? getApprovedPaymentData,
    TResult? Function()? getRejectedPaymentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPendingPaymentData,
    TResult Function()? getApprovedPaymentData,
    TResult Function()? getRejectedPaymentData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetPendingPaymentData value)
        getPendingPaymentData,
    required TResult Function(_GetApprovedPaymentData value)
        getApprovedPaymentData,
    required TResult Function(_GetRejectedPaymentData value)
        getRejectedPaymentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult? Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult? Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataEventCopyWith<$Res> {
  factory $PaymentDataEventCopyWith(
          PaymentDataEvent value, $Res Function(PaymentDataEvent) then) =
      _$PaymentDataEventCopyWithImpl<$Res, PaymentDataEvent>;
}

/// @nodoc
class _$PaymentDataEventCopyWithImpl<$Res, $Val extends PaymentDataEvent>
    implements $PaymentDataEventCopyWith<$Res> {
  _$PaymentDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PaymentDataEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PaymentDataEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPendingPaymentData,
    required TResult Function() getApprovedPaymentData,
    required TResult Function() getRejectedPaymentData,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPendingPaymentData,
    TResult? Function()? getApprovedPaymentData,
    TResult? Function()? getRejectedPaymentData,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPendingPaymentData,
    TResult Function()? getApprovedPaymentData,
    TResult Function()? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetPendingPaymentData value)
        getPendingPaymentData,
    required TResult Function(_GetApprovedPaymentData value)
        getApprovedPaymentData,
    required TResult Function(_GetRejectedPaymentData value)
        getRejectedPaymentData,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult? Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult? Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PaymentDataEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetPendingPaymentDataImplCopyWith<$Res> {
  factory _$$GetPendingPaymentDataImplCopyWith(
          _$GetPendingPaymentDataImpl value,
          $Res Function(_$GetPendingPaymentDataImpl) then) =
      __$$GetPendingPaymentDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPendingPaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataEventCopyWithImpl<$Res, _$GetPendingPaymentDataImpl>
    implements _$$GetPendingPaymentDataImplCopyWith<$Res> {
  __$$GetPendingPaymentDataImplCopyWithImpl(_$GetPendingPaymentDataImpl _value,
      $Res Function(_$GetPendingPaymentDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPendingPaymentDataImpl implements _GetPendingPaymentData {
  const _$GetPendingPaymentDataImpl();

  @override
  String toString() {
    return 'PaymentDataEvent.getPendingPaymentData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPendingPaymentDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPendingPaymentData,
    required TResult Function() getApprovedPaymentData,
    required TResult Function() getRejectedPaymentData,
  }) {
    return getPendingPaymentData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPendingPaymentData,
    TResult? Function()? getApprovedPaymentData,
    TResult? Function()? getRejectedPaymentData,
  }) {
    return getPendingPaymentData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPendingPaymentData,
    TResult Function()? getApprovedPaymentData,
    TResult Function()? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getPendingPaymentData != null) {
      return getPendingPaymentData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetPendingPaymentData value)
        getPendingPaymentData,
    required TResult Function(_GetApprovedPaymentData value)
        getApprovedPaymentData,
    required TResult Function(_GetRejectedPaymentData value)
        getRejectedPaymentData,
  }) {
    return getPendingPaymentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult? Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult? Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
  }) {
    return getPendingPaymentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getPendingPaymentData != null) {
      return getPendingPaymentData(this);
    }
    return orElse();
  }
}

abstract class _GetPendingPaymentData implements PaymentDataEvent {
  const factory _GetPendingPaymentData() = _$GetPendingPaymentDataImpl;
}

/// @nodoc
abstract class _$$GetApprovedPaymentDataImplCopyWith<$Res> {
  factory _$$GetApprovedPaymentDataImplCopyWith(
          _$GetApprovedPaymentDataImpl value,
          $Res Function(_$GetApprovedPaymentDataImpl) then) =
      __$$GetApprovedPaymentDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetApprovedPaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataEventCopyWithImpl<$Res, _$GetApprovedPaymentDataImpl>
    implements _$$GetApprovedPaymentDataImplCopyWith<$Res> {
  __$$GetApprovedPaymentDataImplCopyWithImpl(
      _$GetApprovedPaymentDataImpl _value,
      $Res Function(_$GetApprovedPaymentDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetApprovedPaymentDataImpl implements _GetApprovedPaymentData {
  const _$GetApprovedPaymentDataImpl();

  @override
  String toString() {
    return 'PaymentDataEvent.getApprovedPaymentData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetApprovedPaymentDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPendingPaymentData,
    required TResult Function() getApprovedPaymentData,
    required TResult Function() getRejectedPaymentData,
  }) {
    return getApprovedPaymentData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPendingPaymentData,
    TResult? Function()? getApprovedPaymentData,
    TResult? Function()? getRejectedPaymentData,
  }) {
    return getApprovedPaymentData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPendingPaymentData,
    TResult Function()? getApprovedPaymentData,
    TResult Function()? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getApprovedPaymentData != null) {
      return getApprovedPaymentData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetPendingPaymentData value)
        getPendingPaymentData,
    required TResult Function(_GetApprovedPaymentData value)
        getApprovedPaymentData,
    required TResult Function(_GetRejectedPaymentData value)
        getRejectedPaymentData,
  }) {
    return getApprovedPaymentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult? Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult? Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
  }) {
    return getApprovedPaymentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getApprovedPaymentData != null) {
      return getApprovedPaymentData(this);
    }
    return orElse();
  }
}

abstract class _GetApprovedPaymentData implements PaymentDataEvent {
  const factory _GetApprovedPaymentData() = _$GetApprovedPaymentDataImpl;
}

/// @nodoc
abstract class _$$GetRejectedPaymentDataImplCopyWith<$Res> {
  factory _$$GetRejectedPaymentDataImplCopyWith(
          _$GetRejectedPaymentDataImpl value,
          $Res Function(_$GetRejectedPaymentDataImpl) then) =
      __$$GetRejectedPaymentDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRejectedPaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataEventCopyWithImpl<$Res, _$GetRejectedPaymentDataImpl>
    implements _$$GetRejectedPaymentDataImplCopyWith<$Res> {
  __$$GetRejectedPaymentDataImplCopyWithImpl(
      _$GetRejectedPaymentDataImpl _value,
      $Res Function(_$GetRejectedPaymentDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRejectedPaymentDataImpl implements _GetRejectedPaymentData {
  const _$GetRejectedPaymentDataImpl();

  @override
  String toString() {
    return 'PaymentDataEvent.getRejectedPaymentData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRejectedPaymentDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPendingPaymentData,
    required TResult Function() getApprovedPaymentData,
    required TResult Function() getRejectedPaymentData,
  }) {
    return getRejectedPaymentData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPendingPaymentData,
    TResult? Function()? getApprovedPaymentData,
    TResult? Function()? getRejectedPaymentData,
  }) {
    return getRejectedPaymentData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPendingPaymentData,
    TResult Function()? getApprovedPaymentData,
    TResult Function()? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getRejectedPaymentData != null) {
      return getRejectedPaymentData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetPendingPaymentData value)
        getPendingPaymentData,
    required TResult Function(_GetApprovedPaymentData value)
        getApprovedPaymentData,
    required TResult Function(_GetRejectedPaymentData value)
        getRejectedPaymentData,
  }) {
    return getRejectedPaymentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult? Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult? Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
  }) {
    return getRejectedPaymentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetPendingPaymentData value)? getPendingPaymentData,
    TResult Function(_GetApprovedPaymentData value)? getApprovedPaymentData,
    TResult Function(_GetRejectedPaymentData value)? getRejectedPaymentData,
    required TResult orElse(),
  }) {
    if (getRejectedPaymentData != null) {
      return getRejectedPaymentData(this);
    }
    return orElse();
  }
}

abstract class _GetRejectedPaymentData implements PaymentDataEvent {
  const factory _GetRejectedPaymentData() = _$GetRejectedPaymentDataImpl;
}

/// @nodoc
mixin _$PaymentDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetAllPaymentsResponseModel responseModel)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetAllPaymentsResponseModel responseModel)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetAllPaymentsResponseModel responseModel)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataStateCopyWith<$Res> {
  factory $PaymentDataStateCopyWith(
          PaymentDataState value, $Res Function(PaymentDataState) then) =
      _$PaymentDataStateCopyWithImpl<$Res, PaymentDataState>;
}

/// @nodoc
class _$PaymentDataStateCopyWithImpl<$Res, $Val extends PaymentDataState>
    implements $PaymentDataStateCopyWith<$Res> {
  _$PaymentDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentDataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentDataState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetAllPaymentsResponseModel responseModel)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetAllPaymentsResponseModel responseModel)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetAllPaymentsResponseModel responseModel)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentDataState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PaymentDataStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PaymentDataState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetAllPaymentsResponseModel responseModel)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetAllPaymentsResponseModel responseModel)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetAllPaymentsResponseModel responseModel)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PaymentDataState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PaymentDataStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PaymentDataState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetAllPaymentsResponseModel responseModel)
        success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetAllPaymentsResponseModel responseModel)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetAllPaymentsResponseModel responseModel)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PaymentDataState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetAllPaymentsResponseModel responseModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PaymentDataStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseModel = null,
  }) {
    return _then(_$SuccessImpl(
      null == responseModel
          ? _value.responseModel
          : responseModel // ignore: cast_nullable_to_non_nullable
              as GetAllPaymentsResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.responseModel);

  @override
  final GetAllPaymentsResponseModel responseModel;

  @override
  String toString() {
    return 'PaymentDataState.success(responseModel: $responseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.responseModel, responseModel) ||
                other.responseModel == responseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetAllPaymentsResponseModel responseModel)
        success,
  }) {
    return success(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetAllPaymentsResponseModel responseModel)? success,
  }) {
    return success?.call(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetAllPaymentsResponseModel responseModel)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(responseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PaymentDataState {
  const factory _Success(final GetAllPaymentsResponseModel responseModel) =
      _$SuccessImpl;

  GetAllPaymentsResponseModel get responseModel;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
