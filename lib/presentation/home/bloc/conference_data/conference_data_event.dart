part of 'conference_data_bloc.dart';

@freezed
class ConferenceDataEvent with _$ConferenceDataEvent {
  const factory ConferenceDataEvent.started() = _Started;
  const factory ConferenceDataEvent.getAllApprovedConference() =
      _GetApprovedConferenceData;
  const factory ConferenceDataEvent.getAllPendingConference() =
      _GetPendingConferenceData;
  const factory ConferenceDataEvent.getRejectedCustomerData() =
      _GetRejectedCustomerData;
}
