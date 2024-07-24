part of 'verify_order_data_bloc.dart';

@freezed
class VerifyOrderDataState with _$VerifyOrderDataState {
  const factory VerifyOrderDataState.initial() = _Initial;
  const factory VerifyOrderDataState.loading() = _Loading;
  const factory VerifyOrderDataState.error(String message) = _Error;
  const factory VerifyOrderDataState.successApprove(
          UpdateOrderStatusResponseModel updateOrderStatusResponseModel) =
      _SuccessApprove;
  const factory VerifyOrderDataState.successReject(
          UpdateOrderStatusResponseModel updateOrderStatusResponseModel) =
      _SuccessReject;
  const factory VerifyOrderDataState.success(
      UpdateOrderStatusResponseModel updateOrderStatusResponseModel) = _Success;
}
