part of 'pending_conference_data_bloc.dart';

@freezed
class PendingConferenceDataEvent with _$PendingConferenceDataEvent {
  const factory PendingConferenceDataEvent.started() = _Started;
  const factory PendingConferenceDataEvent.getAllPendingConference() =
      _GetPendingConferenceData;
}
