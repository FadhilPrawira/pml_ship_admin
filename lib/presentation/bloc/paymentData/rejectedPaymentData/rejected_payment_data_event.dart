part of 'rejected_payment_data_bloc.dart';

@freezed
class RejectedPaymentDataEvent with _$RejectedPaymentDataEvent {
  const factory RejectedPaymentDataEvent.started() = _Started;
  const factory RejectedPaymentDataEvent.getRejectedPaymentData() =
      _GetRejectedPaymentData;
}
