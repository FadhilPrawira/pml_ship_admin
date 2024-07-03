part of 'approve_order_data_bloc.dart';

@freezed
class ApproveOrderDataEvent with _$ApproveOrderDataEvent {
  const factory ApproveOrderDataEvent.started() = _Started;
  const factory ApproveOrderDataEvent.approveOrder(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      String transactionId) = _ApproveOrder;
}
