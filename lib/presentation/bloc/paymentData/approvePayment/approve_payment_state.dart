part of 'approve_payment_bloc.dart';

@freezed
class ApprovePaymentState with _$ApprovePaymentState {
  const factory ApprovePaymentState.initial() = _Initial;
  const factory ApprovePaymentState.loading() = _Loading;
  const factory ApprovePaymentState.error(String message) = _Error;
  const factory ApprovePaymentState.success(
      UpdatePaymentStatusResponseModel responseModel) = _Success;
}
