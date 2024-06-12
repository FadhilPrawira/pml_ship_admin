part of 'approved_customer_data_bloc.dart';

@freezed
class ApprovedCustomerDataState with _$ApprovedCustomerDataState {
  const factory ApprovedCustomerDataState.initial() = _Initial;
  const factory ApprovedCustomerDataState.loading() = _Loading;
  const factory ApprovedCustomerDataState.error(String message) = _Error;
  const factory ApprovedCustomerDataState.success(
      GetAllStatusUserResponseModel getAllStatusUserResponseModel) = _Success;
}
