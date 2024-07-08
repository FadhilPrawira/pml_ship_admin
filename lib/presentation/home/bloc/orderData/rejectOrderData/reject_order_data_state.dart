part of 'reject_order_data_bloc.dart';

@freezed
class RejectOrderDataState with _$RejectOrderDataState {
  const factory RejectOrderDataState.initial() = _Initial;
  const factory RejectOrderDataState.loading() = _Loading;
  const factory RejectOrderDataState.error(String message) = _Error;
  const factory RejectOrderDataState.success(
      UpdateOrderStatusResponseModel updateOrderStatusResponseModel) = _Success;
}
