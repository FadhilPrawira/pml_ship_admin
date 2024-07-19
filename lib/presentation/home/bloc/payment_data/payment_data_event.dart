part of 'payment_data_bloc.dart';

@freezed
class PaymentDataEvent with _$PaymentDataEvent {
  const factory PaymentDataEvent.started() = _Started;
  const factory PaymentDataEvent.getPendingPaymentData() =
      _GetPendingPaymentData;
  const factory PaymentDataEvent.getApprovedPaymentData() =
      _GetApprovedPaymentData;
  const factory PaymentDataEvent.getRejectedPaymentData() =
      _GetRejectedPaymentData;
}
