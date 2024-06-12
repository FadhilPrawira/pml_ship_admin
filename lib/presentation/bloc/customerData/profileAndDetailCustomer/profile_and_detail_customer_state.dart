part of 'profile_and_detail_customer_bloc.dart';

@freezed
class ProfileAndDetailCustomerState with _$ProfileAndDetailCustomerState {
  const factory ProfileAndDetailCustomerState.initial() = _Initial;
  const factory ProfileAndDetailCustomerState.loading() = _Loading;
  const factory ProfileAndDetailCustomerState.error(String message) = _Error;
  const factory ProfileAndDetailCustomerState.success(
      UserResponseModel profile) = _Success;
}
