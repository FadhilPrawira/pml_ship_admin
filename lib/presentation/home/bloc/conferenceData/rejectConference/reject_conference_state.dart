part of 'reject_conference_bloc.dart';

@freezed
class RejectConferenceState with _$RejectConferenceState {
  const factory RejectConferenceState.initial() = _Initial;
  const factory RejectConferenceState.loading() = _Loading;
  const factory RejectConferenceState.error(String message) = _Error;
  const factory RejectConferenceState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
