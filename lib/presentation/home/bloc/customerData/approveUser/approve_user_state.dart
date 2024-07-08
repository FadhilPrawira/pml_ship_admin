part of 'approve_user_bloc.dart';

@freezed
class ApproveUserState with _$ApproveUserState {
  const factory ApproveUserState.initial() = _Initial;
  const factory ApproveUserState.loading() = _Loading;
  const factory ApproveUserState.error(String message) = _Error;
  const factory ApproveUserState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
