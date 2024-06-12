part of 'reject_conference_bloc.dart';

@freezed
class RejectConferenceEvent with _$RejectConferenceEvent {
  const factory RejectConferenceEvent.started() = _Started;
  const factory RejectConferenceEvent.rejectConference(
      RejectUserOrConferenceRequestModel rejectUserOrConferenceRequestModel,
      String transactionId) = _RejectConference;
}
