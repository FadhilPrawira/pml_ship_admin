part of 'reject_order_data_bloc.dart';

@freezed
class RejectOrderDataEvent with _$RejectOrderDataEvent {
  const factory RejectOrderDataEvent.started() = _Started;
  const factory RejectOrderDataEvent.rejectOrder(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      String transactionId) = _RejectOrder;
}
