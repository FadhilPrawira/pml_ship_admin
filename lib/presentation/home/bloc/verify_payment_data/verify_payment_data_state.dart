part of 'verify_payment_data_bloc.dart';

@freezed
class VerifyPaymentDataState with _$VerifyPaymentDataState {
  const factory VerifyPaymentDataState.initial() = _Initial;
  const factory VerifyPaymentDataState.loading() = _Loading;
  const factory VerifyPaymentDataState.error(String message) = _Error;
  const factory VerifyPaymentDataState.success(
      UpdatePaymentStatusResponseModel responseModel) = _Success;
}
