part of 'reject_payment_bloc.dart';

@freezed
class RejectPaymentEvent with _$RejectPaymentEvent {
  const factory RejectPaymentEvent.started() = _Started;
  const factory RejectPaymentEvent.rejectPayment(
      RejectUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) = _RejectPayment;
}
