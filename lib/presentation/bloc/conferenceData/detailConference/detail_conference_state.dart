part of 'detail_conference_bloc.dart';

@freezed
class DetailConferenceState with _$DetailConferenceState {
  const factory DetailConferenceState.initial() = _Initial;
  const factory DetailConferenceState.loading() = _Loading;
  const factory DetailConferenceState.error(String message) = _Error;
  const factory DetailConferenceState.success(
      ConferenceResponseModel conference) = _Success;
}
