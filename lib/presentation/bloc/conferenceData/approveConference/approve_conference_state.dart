part of 'approve_conference_bloc.dart';

@freezed
class ApproveConferenceState with _$ApproveConferenceState {
  const factory ApproveConferenceState.initial() = _Initial;
  const factory ApproveConferenceState.loading() = _Loading;
  const factory ApproveConferenceState.error(String message) = _Error;
  const factory ApproveConferenceState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
