part of 'pending_customer_data_bloc.dart';

@freezed
class PendingCustomerDataEvent with _$PendingCustomerDataEvent {
  const factory PendingCustomerDataEvent.started() = _Started;
  const factory PendingCustomerDataEvent.getPendingCustomerData() =
      _GetPendingCustomerData;
}
