part of 'pending_payment_data_bloc.dart';

@freezed
class PendingPaymentDataEvent with _$PendingPaymentDataEvent {
  const factory PendingPaymentDataEvent.started() = _Started;
  const factory PendingPaymentDataEvent.getPendingPaymentData() =
      _GetPendingPaymentData;
}
