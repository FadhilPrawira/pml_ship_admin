part of 'reject_payment_bloc.dart';

@freezed
class RejectPaymentState with _$RejectPaymentState {
  const factory RejectPaymentState.initial() = _Initial;
  const factory RejectPaymentState.loading() = _Loading;
  const factory RejectPaymentState.error(String message) = _Error;
  const factory RejectPaymentState.success(
      UpdatePaymentStatusResponseModel responseModel) = _Success;
}
