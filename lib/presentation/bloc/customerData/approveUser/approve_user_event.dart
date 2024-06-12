part of 'approve_user_bloc.dart';

@freezed
class ApproveUserEvent with _$ApproveUserEvent {
  const factory ApproveUserEvent.started() = _Started;
  const factory ApproveUserEvent.approveUser(
      ApproveUserOrConferenceRequestModel approveUserOrConferenceRequestModel,
      int userId) = _ApproveUser;
}
