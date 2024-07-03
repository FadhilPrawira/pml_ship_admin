part of 'rejected_payment_data_bloc.dart';

@freezed
class RejectedPaymentDataState with _$RejectedPaymentDataState {
  const factory RejectedPaymentDataState.initial() = _Initial;
  const factory RejectedPaymentDataState.loading() = _Loading;
  const factory RejectedPaymentDataState.error(String message) = _Error;
  const factory RejectedPaymentDataState.success(
      GetAllPaymentsResponseModel responseModel) = _Success;
}
