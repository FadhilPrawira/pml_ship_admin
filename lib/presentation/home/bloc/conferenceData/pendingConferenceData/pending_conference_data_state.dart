part of 'pending_conference_data_bloc.dart';

@freezed
class PendingConferenceDataState with _$PendingConferenceDataState {
  const factory PendingConferenceDataState.initial() = _Initial;
  const factory PendingConferenceDataState.loading() = _Loading;
  const factory PendingConferenceDataState.error(String message) = _Error;
  const factory PendingConferenceDataState.success(
      GetAllStatusConferenceResponseModel
          getAllStatusConferenceResponseModel) = _Success;
}
