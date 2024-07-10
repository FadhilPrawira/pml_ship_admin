part of 'detail_order_data_bloc.dart';

@freezed
class DetailOrderDataState with _$DetailOrderDataState {
  const factory DetailOrderDataState.initial() = _Initial;
  const factory DetailOrderDataState.loading() = _Loading;
  const factory DetailOrderDataState.error(String message) = _Error;
  const factory DetailOrderDataState.success(
      OrderDetailResponseModel orderDetail) = _Success;
}
