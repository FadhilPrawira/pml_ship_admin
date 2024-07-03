part of 'approve_payment_bloc.dart';

@freezed
class ApprovePaymentEvent with _$ApprovePaymentEvent {
  const factory ApprovePaymentEvent.started() = _Started;
  const factory ApprovePaymentEvent.approvePayment(
      ApproveUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) = _ApprovePayment;
}
