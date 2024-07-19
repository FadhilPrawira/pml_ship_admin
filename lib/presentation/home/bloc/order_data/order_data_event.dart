part of 'order_data_bloc.dart';

@freezed
class OrderDataEvent with _$OrderDataEvent {
  const factory OrderDataEvent.started() = _Started;
  const factory OrderDataEvent.getAllPendingOrders() = _GetPendingOrderData;
  const factory OrderDataEvent.getAllPaymentPendingOrders() =
      _GetPaymentPendingOrderData;
  const factory OrderDataEvent.getAllOnProcessOrders() =
      _GetOnProcessOrdersData;
  const factory OrderDataEvent.getAllOnShippingOrders() =
      _GetOnShippingOrdersData;
  const factory OrderDataEvent.getAllCompletedOrders() =
      _GetCompletedOrdersData;
  const factory OrderDataEvent.getAllCanceledOrders() = _GetCanceledOrdersData;
  const factory OrderDataEvent.getAllRejectedOrders() = _GetRejectedOrderData;
}
