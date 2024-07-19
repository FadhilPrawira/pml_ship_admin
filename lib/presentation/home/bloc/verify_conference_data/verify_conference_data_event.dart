part of 'verify_conference_data_bloc.dart';

@freezed
class VerifyConferenceDataEvent with _$VerifyConferenceDataEvent {
  const factory VerifyConferenceDataEvent.started() = _Started;
  const factory VerifyConferenceDataEvent.approveConference(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      String transactionId) = _ApproveConference;
  const factory VerifyConferenceDataEvent.rejectConference(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      String transactionId) = _RejectConference;
}
