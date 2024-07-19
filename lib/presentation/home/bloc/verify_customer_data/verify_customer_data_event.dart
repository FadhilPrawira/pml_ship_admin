part of 'verify_customer_data_bloc.dart';

@freezed
class VerifyCustomerDataEvent with _$VerifyCustomerDataEvent {
  const factory VerifyCustomerDataEvent.started() = _Started;
  const factory VerifyCustomerDataEvent.approveUser(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      int userId) = _ApproveUser;
  const factory VerifyCustomerDataEvent.rejectUser(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      int userId) = _RejectUser;
}
