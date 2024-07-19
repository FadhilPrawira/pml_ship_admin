part of 'order_data_bloc.dart';

@freezed
class OrderDataState with _$OrderDataState {
  const factory OrderDataState.initial() = _Initial;
  const factory OrderDataState.loading() = _Loading;
  const factory OrderDataState.error(String message) = _Error;
  const factory OrderDataState.success(
      GetAllStatusOrderResponseModel getAllStatusOrderResponseModel) = _Success;
}
