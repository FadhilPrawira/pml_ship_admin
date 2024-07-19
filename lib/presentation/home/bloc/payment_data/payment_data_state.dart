part of 'payment_data_bloc.dart';

@freezed
class PaymentDataState with _$PaymentDataState {
  const factory PaymentDataState.initial() = _Initial;
  const factory PaymentDataState.loading() = _Loading;
  const factory PaymentDataState.error(String message) = _Error;
  const factory PaymentDataState.success(
      GetAllPaymentsResponseModel responseModel) = _Success;
}
