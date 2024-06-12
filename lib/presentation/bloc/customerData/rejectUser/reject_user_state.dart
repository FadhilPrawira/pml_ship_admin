part of 'reject_user_bloc.dart';

@freezed
class RejectUserState with _$RejectUserState {
  const factory RejectUserState.initial() = _Initial;
  const factory RejectUserState.loading() = _Loading;
  const factory RejectUserState.error(String message) = _Error;
  const factory RejectUserState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
