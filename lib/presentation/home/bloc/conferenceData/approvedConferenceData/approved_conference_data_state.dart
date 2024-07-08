part of 'approved_conference_data_bloc.dart';

@freezed
class ApprovedConferenceDataState with _$ApprovedConferenceDataState {
  const factory ApprovedConferenceDataState.initial() = _Initial;
  const factory ApprovedConferenceDataState.loading() = _Loading;
  const factory ApprovedConferenceDataState.error(String message) = _Error;
  const factory ApprovedConferenceDataState.success(
      GetAllStatusConferenceResponseModel
          getAllStatusConferenceResponseModel) = _Success;
}
