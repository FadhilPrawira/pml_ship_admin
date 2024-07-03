part of 'pending_payment_data_bloc.dart';

@freezed
class PendingPaymentDataState with _$PendingPaymentDataState {
  const factory PendingPaymentDataState.initial() = _Initial;
  const factory PendingPaymentDataState.loading() = _Loading;
  const factory PendingPaymentDataState.error(String message) = _Error;
  const factory PendingPaymentDataState.success(
      GetAllPaymentsResponseModel responseModel) = _Success;
}
