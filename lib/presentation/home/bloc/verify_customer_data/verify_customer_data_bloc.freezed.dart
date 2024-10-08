// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_customer_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyCustomerDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)
        approveUser,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)
        rejectUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult? Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApproveUser value) approveUser,
    required TResult Function(_RejectUser value) rejectUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApproveUser value)? approveUser,
    TResult? Function(_RejectUser value)? rejectUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApproveUser value)? approveUser,
    TResult Function(_RejectUser value)? rejectUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCustomerDataEventCopyWith<$Res> {
  factory $VerifyCustomerDataEventCopyWith(VerifyCustomerDataEvent value,
          $Res Function(VerifyCustomerDataEvent) then) =
      _$VerifyCustomerDataEventCopyWithImpl<$Res, VerifyCustomerDataEvent>;
}

/// @nodoc
class _$VerifyCustomerDataEventCopyWithImpl<$Res,
        $Val extends VerifyCustomerDataEvent>
    implements $VerifyCustomerDataEventCopyWith<$Res> {
  _$VerifyCustomerDataEventCopyWithImpl(this._value, this._then);

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
    extends _$VerifyCustomerDataEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'VerifyCustomerDataEvent.started()';
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
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)
        approveUser,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)
        rejectUser,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult? Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
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
    required TResult Function(_ApproveUser value) approveUser,
    required TResult Function(_RejectUser value) rejectUser,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApproveUser value)? approveUser,
    TResult? Function(_RejectUser value)? rejectUser,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApproveUser value)? approveUser,
    TResult Function(_RejectUser value)? rejectUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VerifyCustomerDataEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ApproveUserImplCopyWith<$Res> {
  factory _$$ApproveUserImplCopyWith(
          _$ApproveUserImpl value, $Res Function(_$ApproveUserImpl) then) =
      __$$ApproveUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      int userId});
}

/// @nodoc
class __$$ApproveUserImplCopyWithImpl<$Res>
    extends _$VerifyCustomerDataEventCopyWithImpl<$Res, _$ApproveUserImpl>
    implements _$$ApproveUserImplCopyWith<$Res> {
  __$$ApproveUserImplCopyWithImpl(
      _$ApproveUserImpl _value, $Res Function(_$ApproveUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approveUserOrOrderOrConferenceRequestModel = null,
    Object? userId = null,
  }) {
    return _then(_$ApproveUserImpl(
      null == approveUserOrOrderOrConferenceRequestModel
          ? _value.approveUserOrOrderOrConferenceRequestModel
          : approveUserOrOrderOrConferenceRequestModel // ignore: cast_nullable_to_non_nullable
              as ApproveUserOrOrderOrConferenceRequestModel,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApproveUserImpl implements _ApproveUser {
  const _$ApproveUserImpl(
      this.approveUserOrOrderOrConferenceRequestModel, this.userId);

  @override
  final ApproveUserOrOrderOrConferenceRequestModel
      approveUserOrOrderOrConferenceRequestModel;
  @override
  final int userId;

  @override
  String toString() {
    return 'VerifyCustomerDataEvent.approveUser(approveUserOrOrderOrConferenceRequestModel: $approveUserOrOrderOrConferenceRequestModel, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveUserImpl &&
            (identical(other.approveUserOrOrderOrConferenceRequestModel,
                    approveUserOrOrderOrConferenceRequestModel) ||
                other.approveUserOrOrderOrConferenceRequestModel ==
                    approveUserOrOrderOrConferenceRequestModel) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, approveUserOrOrderOrConferenceRequestModel, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveUserImplCopyWith<_$ApproveUserImpl> get copyWith =>
      __$$ApproveUserImplCopyWithImpl<_$ApproveUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)
        approveUser,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)
        rejectUser,
  }) {
    return approveUser(approveUserOrOrderOrConferenceRequestModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult? Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
  }) {
    return approveUser?.call(
        approveUserOrOrderOrConferenceRequestModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
    required TResult orElse(),
  }) {
    if (approveUser != null) {
      return approveUser(approveUserOrOrderOrConferenceRequestModel, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApproveUser value) approveUser,
    required TResult Function(_RejectUser value) rejectUser,
  }) {
    return approveUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApproveUser value)? approveUser,
    TResult? Function(_RejectUser value)? rejectUser,
  }) {
    return approveUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApproveUser value)? approveUser,
    TResult Function(_RejectUser value)? rejectUser,
    required TResult orElse(),
  }) {
    if (approveUser != null) {
      return approveUser(this);
    }
    return orElse();
  }
}

abstract class _ApproveUser implements VerifyCustomerDataEvent {
  const factory _ApproveUser(
      final ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      final int userId) = _$ApproveUserImpl;

  ApproveUserOrOrderOrConferenceRequestModel
      get approveUserOrOrderOrConferenceRequestModel;
  int get userId;
  @JsonKey(ignore: true)
  _$$ApproveUserImplCopyWith<_$ApproveUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectUserImplCopyWith<$Res> {
  factory _$$RejectUserImplCopyWith(
          _$RejectUserImpl value, $Res Function(_$RejectUserImpl) then) =
      __$$RejectUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      int userId});
}

/// @nodoc
class __$$RejectUserImplCopyWithImpl<$Res>
    extends _$VerifyCustomerDataEventCopyWithImpl<$Res, _$RejectUserImpl>
    implements _$$RejectUserImplCopyWith<$Res> {
  __$$RejectUserImplCopyWithImpl(
      _$RejectUserImpl _value, $Res Function(_$RejectUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rejectUserOrOrderOrConferenceRequestModel = null,
    Object? userId = null,
  }) {
    return _then(_$RejectUserImpl(
      null == rejectUserOrOrderOrConferenceRequestModel
          ? _value.rejectUserOrOrderOrConferenceRequestModel
          : rejectUserOrOrderOrConferenceRequestModel // ignore: cast_nullable_to_non_nullable
              as RejectUserOrOrderOrConferenceRequestModel,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RejectUserImpl implements _RejectUser {
  const _$RejectUserImpl(
      this.rejectUserOrOrderOrConferenceRequestModel, this.userId);

  @override
  final RejectUserOrOrderOrConferenceRequestModel
      rejectUserOrOrderOrConferenceRequestModel;
  @override
  final int userId;

  @override
  String toString() {
    return 'VerifyCustomerDataEvent.rejectUser(rejectUserOrOrderOrConferenceRequestModel: $rejectUserOrOrderOrConferenceRequestModel, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectUserImpl &&
            (identical(other.rejectUserOrOrderOrConferenceRequestModel,
                    rejectUserOrOrderOrConferenceRequestModel) ||
                other.rejectUserOrOrderOrConferenceRequestModel ==
                    rejectUserOrOrderOrConferenceRequestModel) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rejectUserOrOrderOrConferenceRequestModel, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectUserImplCopyWith<_$RejectUserImpl> get copyWith =>
      __$$RejectUserImplCopyWithImpl<_$RejectUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)
        approveUser,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)
        rejectUser,
  }) {
    return rejectUser(rejectUserOrOrderOrConferenceRequestModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult? Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
  }) {
    return rejectUser?.call(rejectUserOrOrderOrConferenceRequestModel, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel
                approveUserOrOrderOrConferenceRequestModel,
            int userId)?
        approveUser,
    TResult Function(
            RejectUserOrOrderOrConferenceRequestModel
                rejectUserOrOrderOrConferenceRequestModel,
            int userId)?
        rejectUser,
    required TResult orElse(),
  }) {
    if (rejectUser != null) {
      return rejectUser(rejectUserOrOrderOrConferenceRequestModel, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApproveUser value) approveUser,
    required TResult Function(_RejectUser value) rejectUser,
  }) {
    return rejectUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApproveUser value)? approveUser,
    TResult? Function(_RejectUser value)? rejectUser,
  }) {
    return rejectUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApproveUser value)? approveUser,
    TResult Function(_RejectUser value)? rejectUser,
    required TResult orElse(),
  }) {
    if (rejectUser != null) {
      return rejectUser(this);
    }
    return orElse();
  }
}

abstract class _RejectUser implements VerifyCustomerDataEvent {
  const factory _RejectUser(
      final RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      final int userId) = _$RejectUserImpl;

  RejectUserOrOrderOrConferenceRequestModel
      get rejectUserOrOrderOrConferenceRequestModel;
  int get userId;
  @JsonKey(ignore: true)
  _$$RejectUserImplCopyWith<_$RejectUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyCustomerDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
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
abstract class $VerifyCustomerDataStateCopyWith<$Res> {
  factory $VerifyCustomerDataStateCopyWith(VerifyCustomerDataState value,
          $Res Function(VerifyCustomerDataState) then) =
      _$VerifyCustomerDataStateCopyWithImpl<$Res, VerifyCustomerDataState>;
}

/// @nodoc
class _$VerifyCustomerDataStateCopyWithImpl<$Res,
        $Val extends VerifyCustomerDataState>
    implements $VerifyCustomerDataStateCopyWith<$Res> {
  _$VerifyCustomerDataStateCopyWithImpl(this._value, this._then);

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
    extends _$VerifyCustomerDataStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'VerifyCustomerDataState.initial()';
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
    required TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)
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
    TResult? Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
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

abstract class _Initial implements VerifyCustomerDataState {
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
    extends _$VerifyCustomerDataStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'VerifyCustomerDataState.loading()';
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
    required TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)
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
    TResult? Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
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

abstract class _Loading implements VerifyCustomerDataState {
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
    extends _$VerifyCustomerDataStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'VerifyCustomerDataState.error(message: $message)';
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
    required TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)
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
    TResult? Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
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

abstract class _Error implements VerifyCustomerDataState {
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
  $Res call(
      {UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$VerifyCustomerDataStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserOrConferenceStatusResponseModel = null,
  }) {
    return _then(_$SuccessImpl(
      null == updateUserOrConferenceStatusResponseModel
          ? _value.updateUserOrConferenceStatusResponseModel
          : updateUserOrConferenceStatusResponseModel // ignore: cast_nullable_to_non_nullable
              as UpdateUserOrConferenceStatusResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.updateUserOrConferenceStatusResponseModel);

  @override
  final UpdateUserOrConferenceStatusResponseModel
      updateUserOrConferenceStatusResponseModel;

  @override
  String toString() {
    return 'VerifyCustomerDataState.success(updateUserOrConferenceStatusResponseModel: $updateUserOrConferenceStatusResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.updateUserOrConferenceStatusResponseModel,
                    updateUserOrConferenceStatusResponseModel) ||
                other.updateUserOrConferenceStatusResponseModel ==
                    updateUserOrConferenceStatusResponseModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, updateUserOrConferenceStatusResponseModel);

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
    required TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)
        success,
  }) {
    return success(updateUserOrConferenceStatusResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
  }) {
    return success?.call(updateUserOrConferenceStatusResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(
            UpdateUserOrConferenceStatusResponseModel
                updateUserOrConferenceStatusResponseModel)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(updateUserOrConferenceStatusResponseModel);
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

abstract class _Success implements VerifyCustomerDataState {
  const factory _Success(
      final UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _$SuccessImpl;

  UpdateUserOrConferenceStatusResponseModel
      get updateUserOrConferenceStatusResponseModel;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
