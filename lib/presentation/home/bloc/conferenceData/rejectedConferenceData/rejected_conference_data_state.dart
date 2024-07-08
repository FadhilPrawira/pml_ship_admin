part of 'rejected_conference_data_bloc.dart';

@freezed
class RejectedConferenceDataState with _$RejectedConferenceDataState {
  const factory RejectedConferenceDataState.initial() = _Initial;
  const factory RejectedConferenceDataState.loading() = _Loading;
  const factory RejectedConferenceDataState.error(String message) = _Error;
  const factory RejectedConferenceDataState.success(
      GetAllStatusConferenceResponseModel
          getAllStatusConferenceResponseModel) = _Success;
}
