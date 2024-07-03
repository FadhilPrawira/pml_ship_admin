part of 'on_process_orders_data_bloc.dart';

@freezed
class OnProcessOrdersDataEvent with _$OnProcessOrdersDataEvent {
  const factory OnProcessOrdersDataEvent.started() = _Started;
  const factory OnProcessOrdersDataEvent.getAllOnProcessOrders() =
      _GetOnProcessOrdersData;
}
