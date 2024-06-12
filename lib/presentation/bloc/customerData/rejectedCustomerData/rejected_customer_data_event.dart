part of 'rejected_customer_data_bloc.dart';

@freezed
class RejectedCustomerDataEvent with _$RejectedCustomerDataEvent {
  const factory RejectedCustomerDataEvent.started() = _Started;
  const factory RejectedCustomerDataEvent.getRejectedCustomerData() =
      _GetRejectedCustomerData;
}
