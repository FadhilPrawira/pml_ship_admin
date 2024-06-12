part of 'reject_user_bloc.dart';

@freezed
class RejectUserEvent with _$RejectUserEvent {
  const factory RejectUserEvent.started() = _Started;
  const factory RejectUserEvent.rejectUser(
      RejectUserOrConferenceRequestModel rejectUserOrConferenceRequestModel,
      int userId) = _RejectUser;
}
