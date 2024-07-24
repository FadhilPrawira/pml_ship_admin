part of 'verify_payment_data_bloc.dart';

@freezed
class VerifyPaymentDataState with _$VerifyPaymentDataState {
  const factory VerifyPaymentDataState.initial() = _Initial;
  const factory VerifyPaymentDataState.loading() = _Loading;
  const factory VerifyPaymentDataState.error(String message) = _Error;
  const factory VerifyPaymentDataState.successApprove(
      UpdatePaymentStatusResponseModel responseModel) = _SuccessApprove;
  const factory VerifyPaymentDataState.successReject(
      UpdatePaymentStatusResponseModel responseModel) = _SuccessReject;
}
