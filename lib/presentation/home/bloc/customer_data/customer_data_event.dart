part of 'customer_data_bloc.dart';

@freezed
class CustomerDataEvent with _$CustomerDataEvent {
  const factory CustomerDataEvent.started() = _Started;
  const factory CustomerDataEvent.getApprovedCustomerData() =
      _GetApprovedCustomerData;
  const factory CustomerDataEvent.getPendingCustomerData() =
      _GetPendingCustomerData;
  const factory CustomerDataEvent.getRejectedCustomerData() =
      _GetRejectedCustomerData;
}
