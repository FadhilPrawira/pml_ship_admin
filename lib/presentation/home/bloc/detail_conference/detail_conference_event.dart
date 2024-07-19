part of 'detail_conference_bloc.dart';

@freezed
class DetailConferenceEvent with _$DetailConferenceEvent {
  const factory DetailConferenceEvent.started() = _Started;
  const factory DetailConferenceEvent.getFullConferenceData(
      String transactionId) = _GetFullConferenceData;
}
