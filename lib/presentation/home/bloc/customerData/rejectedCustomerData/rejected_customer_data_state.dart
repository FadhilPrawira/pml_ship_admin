part of 'rejected_customer_data_bloc.dart';

@freezed
class RejectedCustomerDataState with _$RejectedCustomerDataState {
  const factory RejectedCustomerDataState.initial() = _Initial;
  const factory RejectedCustomerDataState.loading() = _Loading;
  const factory RejectedCustomerDataState.error(String message) = _Error;
  const factory RejectedCustomerDataState.success(
      GetAllStatusUserResponseModel getAllStatusUserResponseModel) = _Success;
}
