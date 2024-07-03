part of 'approved_payment_data_bloc.dart';

@freezed
class ApprovedPaymentDataEvent with _$ApprovedPaymentDataEvent {
  const factory ApprovedPaymentDataEvent.started() = _Started;
  const factory ApprovedPaymentDataEvent.getApprovedPaymentData() =
      _GetApprovedPaymentData;
}
