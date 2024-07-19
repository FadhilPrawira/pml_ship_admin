part of 'customer_detail_bloc.dart';

@freezed
class CustomerDetailState with _$CustomerDetailState {
  const factory CustomerDetailState.initial() = _Initial;
  const factory CustomerDetailState.loading() = _Loading;
  const factory CustomerDetailState.error(String message) = _Error;
  const factory CustomerDetailState.success(UserResponseModel profile) =
      _Success;
}
