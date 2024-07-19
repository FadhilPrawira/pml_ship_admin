part of 'verify_payment_data_bloc.dart';

@freezed
class VerifyPaymentDataEvent with _$VerifyPaymentDataEvent {
  const factory VerifyPaymentDataEvent.started() = _Started;
  const factory VerifyPaymentDataEvent.approvePayment(
      ApproveUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) = _ApprovePayment;
  const factory VerifyPaymentDataEvent.rejectPayment(
      RejectUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) = _RejectPayment;
}
