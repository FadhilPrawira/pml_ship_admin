part of 'approved_conference_data_bloc.dart';

@freezed
class ApprovedConferenceDataEvent with _$ApprovedConferenceDataEvent {
  const factory ApprovedConferenceDataEvent.started() = _Started;
  const factory ApprovedConferenceDataEvent.getAllApprovedConference() =
      _GetApprovedConferenceData;
}
