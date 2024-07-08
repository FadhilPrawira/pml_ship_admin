part of 'profile_and_detail_customer_bloc.dart';

@freezed
class ProfileAndDetailCustomerEvent with _$ProfileAndDetailCustomerEvent {
  const factory ProfileAndDetailCustomerEvent.started() = _Started;
  const factory ProfileAndDetailCustomerEvent.getFullUserData(int userId) =
      _GetFullUserData;
}
