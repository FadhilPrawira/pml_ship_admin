part of 'rejected_conference_data_bloc.dart';

@freezed
class RejectedConferenceDataEvent with _$RejectedConferenceDataEvent {
  const factory RejectedConferenceDataEvent.started() = _Started;
  const factory RejectedConferenceDataEvent.getRejectedCustomerData() =
      _GetRejectedCustomerData;
}
