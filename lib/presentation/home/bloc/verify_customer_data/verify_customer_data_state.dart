part of 'verify_customer_data_bloc.dart';

@freezed
class VerifyCustomerDataState with _$VerifyCustomerDataState {
  const factory VerifyCustomerDataState.initial() = _Initial;
  const factory VerifyCustomerDataState.loading() = _Loading;
  const factory VerifyCustomerDataState.error(String message) = _Error;
  const factory VerifyCustomerDataState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
