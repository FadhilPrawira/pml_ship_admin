part of 'approve_conference_bloc.dart';

@freezed
class ApproveConferenceEvent with _$ApproveConferenceEvent {
  const factory ApproveConferenceEvent.started() = _Started;
  const factory ApproveConferenceEvent.approveConference(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      String transactionId) = _ApproveConference;
}
