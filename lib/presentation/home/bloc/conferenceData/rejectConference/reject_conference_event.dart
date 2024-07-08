part of 'reject_conference_bloc.dart';

@freezed
class RejectConferenceEvent with _$RejectConferenceEvent {
  const factory RejectConferenceEvent.started() = _Started;
  const factory RejectConferenceEvent.rejectConference(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      String transactionId) = _RejectConference;
}
