part of 'approve_user_bloc.dart';

@freezed
class ApproveUserEvent with _$ApproveUserEvent {
  const factory ApproveUserEvent.started() = _Started;
  const factory ApproveUserEvent.approveUser(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      int userId) = _ApproveUser;
}
