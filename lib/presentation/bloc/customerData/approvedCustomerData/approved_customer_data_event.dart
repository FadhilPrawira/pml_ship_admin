part of 'approved_customer_data_bloc.dart';

@freezed
class ApprovedCustomerDataEvent with _$ApprovedCustomerDataEvent {
  const factory ApprovedCustomerDataEvent.started() = _Started;
  const factory ApprovedCustomerDataEvent.getApprovedCustomerData() =
      _GetApprovedCustomerData;
}
