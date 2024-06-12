part of 'pending_customer_data_bloc.dart';

@freezed
class PendingCustomerDataState with _$PendingCustomerDataState {
  const factory PendingCustomerDataState.initial() = _Initial;
  const factory PendingCustomerDataState.loading() = _Loading;
  const factory PendingCustomerDataState.error(String message) = _Error;
  const factory PendingCustomerDataState.success(
      GetAllStatusUserResponseModel getAllStatusUserResponseModel) = _Success;
}
