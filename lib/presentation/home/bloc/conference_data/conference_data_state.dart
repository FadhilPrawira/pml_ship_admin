part of 'conference_data_bloc.dart';

@freezed
class ConferenceDataState with _$ConferenceDataState {
  const factory ConferenceDataState.initial() = _Initial;
  const factory ConferenceDataState.loading() = _Loading;
  const factory ConferenceDataState.error(String message) = _Error;
  const factory ConferenceDataState.success(
      GetAllStatusConferenceResponseModel
          getAllStatusConferenceResponseModel) = _Success;
}
