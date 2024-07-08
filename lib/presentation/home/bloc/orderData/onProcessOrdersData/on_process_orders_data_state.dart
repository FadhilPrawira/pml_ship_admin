part of 'on_process_orders_data_bloc.dart';

@freezed
class OnProcessOrdersDataState with _$OnProcessOrdersDataState {
  const factory OnProcessOrdersDataState.initial() = _Initial;
  const factory OnProcessOrdersDataState.loading() = _Loading;
  const factory OnProcessOrdersDataState.error(String message) = _Error;
  const factory OnProcessOrdersDataState.success(
      GetAllStatusOrderResponseModel getAllStatusOrderResponseModel) = _Success;
}
