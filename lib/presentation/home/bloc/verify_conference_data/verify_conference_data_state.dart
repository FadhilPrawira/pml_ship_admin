part of 'verify_conference_data_bloc.dart';

@freezed
class VerifyConferenceDataState with _$VerifyConferenceDataState {
  const factory VerifyConferenceDataState.initial() = _Initial;
  const factory VerifyConferenceDataState.loading() = _Loading;
  const factory VerifyConferenceDataState.error(String message) = _Error;
  const factory VerifyConferenceDataState.success(
      UpdateUserOrConferenceStatusResponseModel
          updateUserOrConferenceStatusResponseModel) = _Success;
}
