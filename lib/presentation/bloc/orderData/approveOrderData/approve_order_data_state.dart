part of 'approve_order_data_bloc.dart';

@freezed
class ApproveOrderDataState with _$ApproveOrderDataState {
  const factory ApproveOrderDataState.initial() = _Initial;
  const factory ApproveOrderDataState.loading() = _Loading;
  const factory ApproveOrderDataState.error(String message) = _Error;
  const factory ApproveOrderDataState.success(
      UpdateOrderStatusResponseModel updateOrderStatusResponseModel) = _Success;
}
