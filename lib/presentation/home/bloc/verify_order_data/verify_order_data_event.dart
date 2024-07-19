part of 'verify_order_data_bloc.dart';

@freezed
class VerifyOrderDataEvent with _$VerifyOrderDataEvent {
  const factory VerifyOrderDataEvent.started() = _Started;
  const factory VerifyOrderDataEvent.approveOrder(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      String transactionId) = _ApproveOrder;
  const factory VerifyOrderDataEvent.rejectOrder(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      String transactionId) = _RejectOrder;
  const factory VerifyOrderDataEvent.setOrderToCompleted(
      CompleteOrderRequestModel completeOrderRequestModel,
      String transactionId) = _SetOrderToCompleted;
}
