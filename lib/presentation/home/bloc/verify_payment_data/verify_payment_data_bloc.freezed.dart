// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_payment_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyPaymentDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        approvePayment,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        rejectPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult? Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApprovePayment value) approvePayment,
    required TResult Function(_RejectPayment value) rejectPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApprovePayment value)? approvePayment,
    TResult? Function(_RejectPayment value)? rejectPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApprovePayment value)? approvePayment,
    TResult Function(_RejectPayment value)? rejectPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPaymentDataEventCopyWith<$Res> {
  factory $VerifyPaymentDataEventCopyWith(VerifyPaymentDataEvent value,
          $Res Function(VerifyPaymentDataEvent) then) =
      _$VerifyPaymentDataEventCopyWithImpl<$Res, VerifyPaymentDataEvent>;
}

/// @nodoc
class _$VerifyPaymentDataEventCopyWithImpl<$Res,
        $Val extends VerifyPaymentDataEvent>
    implements $VerifyPaymentDataEventCopyWith<$Res> {
  _$VerifyPaymentDataEventCopyWithImpl(this._value, this._then);

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
    extends _$VerifyPaymentDataEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'VerifyPaymentDataEvent.started()';
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
            ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        approvePayment,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        rejectPayment,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult? Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
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
    required TResult Function(_ApprovePayment value) approvePayment,
    required TResult Function(_RejectPayment value) rejectPayment,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApprovePayment value)? approvePayment,
    TResult? Function(_RejectPayment value)? rejectPayment,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApprovePayment value)? approvePayment,
    TResult Function(_RejectPayment value)? rejectPayment,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VerifyPaymentDataEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ApprovePaymentImplCopyWith<$Res> {
  factory _$$ApprovePaymentImplCopyWith(_$ApprovePaymentImpl value,
          $Res Function(_$ApprovePaymentImpl) then) =
      __$$ApprovePaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ApproveUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId});
}

/// @nodoc
class __$$ApprovePaymentImplCopyWithImpl<$Res>
    extends _$VerifyPaymentDataEventCopyWithImpl<$Res, _$ApprovePaymentImpl>
    implements _$$ApprovePaymentImplCopyWith<$Res> {
  __$$ApprovePaymentImplCopyWithImpl(
      _$ApprovePaymentImpl _value, $Res Function(_$ApprovePaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestModel = null,
    Object? transactionId = null,
  }) {
    return _then(_$ApprovePaymentImpl(
      null == requestModel
          ? _value.requestModel
          : requestModel // ignore: cast_nullable_to_non_nullable
              as ApproveUserOrOrderOrConferenceRequestModel,
      null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApprovePaymentImpl implements _ApprovePayment {
  const _$ApprovePaymentImpl(this.requestModel, this.transactionId);

  @override
  final ApproveUserOrOrderOrConferenceRequestModel requestModel;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'VerifyPaymentDataEvent.approvePayment(requestModel: $requestModel, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovePaymentImpl &&
            (identical(other.requestModel, requestModel) ||
                other.requestModel == requestModel) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestModel, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovePaymentImplCopyWith<_$ApprovePaymentImpl> get copyWith =>
      __$$ApprovePaymentImplCopyWithImpl<_$ApprovePaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        approvePayment,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        rejectPayment,
  }) {
    return approvePayment(requestModel, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult? Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
  }) {
    return approvePayment?.call(requestModel, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
    required TResult orElse(),
  }) {
    if (approvePayment != null) {
      return approvePayment(requestModel, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApprovePayment value) approvePayment,
    required TResult Function(_RejectPayment value) rejectPayment,
  }) {
    return approvePayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApprovePayment value)? approvePayment,
    TResult? Function(_RejectPayment value)? rejectPayment,
  }) {
    return approvePayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApprovePayment value)? approvePayment,
    TResult Function(_RejectPayment value)? rejectPayment,
    required TResult orElse(),
  }) {
    if (approvePayment != null) {
      return approvePayment(this);
    }
    return orElse();
  }
}

abstract class _ApprovePayment implements VerifyPaymentDataEvent {
  const factory _ApprovePayment(
      final ApproveUserOrOrderOrConferenceRequestModel requestModel,
      final String transactionId) = _$ApprovePaymentImpl;

  ApproveUserOrOrderOrConferenceRequestModel get requestModel;
  String get transactionId;
  @JsonKey(ignore: true)
  _$$ApprovePaymentImplCopyWith<_$ApprovePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectPaymentImplCopyWith<$Res> {
  factory _$$RejectPaymentImplCopyWith(
          _$RejectPaymentImpl value, $Res Function(_$RejectPaymentImpl) then) =
      __$$RejectPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RejectUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId});
}

/// @nodoc
class __$$RejectPaymentImplCopyWithImpl<$Res>
    extends _$VerifyPaymentDataEventCopyWithImpl<$Res, _$RejectPaymentImpl>
    implements _$$RejectPaymentImplCopyWith<$Res> {
  __$$RejectPaymentImplCopyWithImpl(
      _$RejectPaymentImpl _value, $Res Function(_$RejectPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestModel = null,
    Object? transactionId = null,
  }) {
    return _then(_$RejectPaymentImpl(
      null == requestModel
          ? _value.requestModel
          : requestModel // ignore: cast_nullable_to_non_nullable
              as RejectUserOrOrderOrConferenceRequestModel,
      null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectPaymentImpl implements _RejectPayment {
  const _$RejectPaymentImpl(this.requestModel, this.transactionId);

  @override
  final RejectUserOrOrderOrConferenceRequestModel requestModel;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'VerifyPaymentDataEvent.rejectPayment(requestModel: $requestModel, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectPaymentImpl &&
            (identical(other.requestModel, requestModel) ||
                other.requestModel == requestModel) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestModel, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectPaymentImplCopyWith<_$RejectPaymentImpl> get copyWith =>
      __$$RejectPaymentImplCopyWithImpl<_$RejectPaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        approvePayment,
    required TResult Function(
            RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)
        rejectPayment,
  }) {
    return rejectPayment(requestModel, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult? Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
  }) {
    return rejectPayment?.call(requestModel, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ApproveUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        approvePayment,
    TResult Function(RejectUserOrOrderOrConferenceRequestModel requestModel,
            String transactionId)?
        rejectPayment,
    required TResult orElse(),
  }) {
    if (rejectPayment != null) {
      return rejectPayment(requestModel, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ApprovePayment value) approvePayment,
    required TResult Function(_RejectPayment value) rejectPayment,
  }) {
    return rejectPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ApprovePayment value)? approvePayment,
    TResult? Function(_RejectPayment value)? rejectPayment,
  }) {
    return rejectPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ApprovePayment value)? approvePayment,
    TResult Function(_RejectPayment value)? rejectPayment,
    required TResult orElse(),
  }) {
    if (rejectPayment != null) {
      return rejectPayment(this);
    }
    return orElse();
  }
}

abstract class _RejectPayment implements VerifyPaymentDataEvent {
  const factory _RejectPayment(
      final RejectUserOrOrderOrConferenceRequestModel requestModel,
      final String transactionId) = _$RejectPaymentImpl;

  RejectUserOrOrderOrConferenceRequestModel get requestModel;
  String get transactionId;
  @JsonKey(ignore: true)
  _$$RejectPaymentImplCopyWith<_$RejectPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyPaymentDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPaymentDataStateCopyWith<$Res> {
  factory $VerifyPaymentDataStateCopyWith(VerifyPaymentDataState value,
          $Res Function(VerifyPaymentDataState) then) =
      _$VerifyPaymentDataStateCopyWithImpl<$Res, VerifyPaymentDataState>;
}

/// @nodoc
class _$VerifyPaymentDataStateCopyWithImpl<$Res,
        $Val extends VerifyPaymentDataState>
    implements $VerifyPaymentDataStateCopyWith<$Res> {
  _$VerifyPaymentDataStateCopyWithImpl(this._value, this._then);

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
    extends _$VerifyPaymentDataStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'VerifyPaymentDataState.initial()';
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
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
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
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VerifyPaymentDataState {
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
    extends _$VerifyPaymentDataStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'VerifyPaymentDataState.loading()';
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
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
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
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VerifyPaymentDataState {
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
    extends _$VerifyPaymentDataStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'VerifyPaymentDataState.error(message: $message)';
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
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
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
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VerifyPaymentDataState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessApproveImplCopyWith<$Res> {
  factory _$$SuccessApproveImplCopyWith(_$SuccessApproveImpl value,
          $Res Function(_$SuccessApproveImpl) then) =
      __$$SuccessApproveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdatePaymentStatusResponseModel responseModel});
}

/// @nodoc
class __$$SuccessApproveImplCopyWithImpl<$Res>
    extends _$VerifyPaymentDataStateCopyWithImpl<$Res, _$SuccessApproveImpl>
    implements _$$SuccessApproveImplCopyWith<$Res> {
  __$$SuccessApproveImplCopyWithImpl(
      _$SuccessApproveImpl _value, $Res Function(_$SuccessApproveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseModel = null,
  }) {
    return _then(_$SuccessApproveImpl(
      null == responseModel
          ? _value.responseModel
          : responseModel // ignore: cast_nullable_to_non_nullable
              as UpdatePaymentStatusResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessApproveImpl implements _SuccessApprove {
  const _$SuccessApproveImpl(this.responseModel);

  @override
  final UpdatePaymentStatusResponseModel responseModel;

  @override
  String toString() {
    return 'VerifyPaymentDataState.successApprove(responseModel: $responseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessApproveImpl &&
            (identical(other.responseModel, responseModel) ||
                other.responseModel == responseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessApproveImplCopyWith<_$SuccessApproveImpl> get copyWith =>
      __$$SuccessApproveImplCopyWithImpl<_$SuccessApproveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) {
    return successApprove(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) {
    return successApprove?.call(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
    required TResult orElse(),
  }) {
    if (successApprove != null) {
      return successApprove(responseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) {
    return successApprove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) {
    return successApprove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) {
    if (successApprove != null) {
      return successApprove(this);
    }
    return orElse();
  }
}

abstract class _SuccessApprove implements VerifyPaymentDataState {
  const factory _SuccessApprove(
          final UpdatePaymentStatusResponseModel responseModel) =
      _$SuccessApproveImpl;

  UpdatePaymentStatusResponseModel get responseModel;
  @JsonKey(ignore: true)
  _$$SuccessApproveImplCopyWith<_$SuccessApproveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessRejectImplCopyWith<$Res> {
  factory _$$SuccessRejectImplCopyWith(
          _$SuccessRejectImpl value, $Res Function(_$SuccessRejectImpl) then) =
      __$$SuccessRejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdatePaymentStatusResponseModel responseModel});
}

/// @nodoc
class __$$SuccessRejectImplCopyWithImpl<$Res>
    extends _$VerifyPaymentDataStateCopyWithImpl<$Res, _$SuccessRejectImpl>
    implements _$$SuccessRejectImplCopyWith<$Res> {
  __$$SuccessRejectImplCopyWithImpl(
      _$SuccessRejectImpl _value, $Res Function(_$SuccessRejectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseModel = null,
  }) {
    return _then(_$SuccessRejectImpl(
      null == responseModel
          ? _value.responseModel
          : responseModel // ignore: cast_nullable_to_non_nullable
              as UpdatePaymentStatusResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessRejectImpl implements _SuccessReject {
  const _$SuccessRejectImpl(this.responseModel);

  @override
  final UpdatePaymentStatusResponseModel responseModel;

  @override
  String toString() {
    return 'VerifyPaymentDataState.successReject(responseModel: $responseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessRejectImpl &&
            (identical(other.responseModel, responseModel) ||
                other.responseModel == responseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessRejectImplCopyWith<_$SuccessRejectImpl> get copyWith =>
      __$$SuccessRejectImplCopyWithImpl<_$SuccessRejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successApprove,
    required TResult Function(UpdatePaymentStatusResponseModel responseModel)
        successReject,
  }) {
    return successReject(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult? Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
  }) {
    return successReject?.call(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successApprove,
    TResult Function(UpdatePaymentStatusResponseModel responseModel)?
        successReject,
    required TResult orElse(),
  }) {
    if (successReject != null) {
      return successReject(responseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_SuccessApprove value) successApprove,
    required TResult Function(_SuccessReject value) successReject,
  }) {
    return successReject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_SuccessApprove value)? successApprove,
    TResult? Function(_SuccessReject value)? successReject,
  }) {
    return successReject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_SuccessApprove value)? successApprove,
    TResult Function(_SuccessReject value)? successReject,
    required TResult orElse(),
  }) {
    if (successReject != null) {
      return successReject(this);
    }
    return orElse();
  }
}

abstract class _SuccessReject implements VerifyPaymentDataState {
  const factory _SuccessReject(
          final UpdatePaymentStatusResponseModel responseModel) =
      _$SuccessRejectImpl;

  UpdatePaymentStatusResponseModel get responseModel;
  @JsonKey(ignore: true)
  _$$SuccessRejectImplCopyWith<_$SuccessRejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
