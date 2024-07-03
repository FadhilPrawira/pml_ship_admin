part of 'approved_payment_data_bloc.dart';

@freezed
class ApprovedPaymentDataState with _$ApprovedPaymentDataState {
  const factory ApprovedPaymentDataState.initial() = _Initial;
  const factory ApprovedPaymentDataState.loading() = _Loading;
  const factory ApprovedPaymentDataState.error(String message) = _Error;
  const factory ApprovedPaymentDataState.success(
      GetAllPaymentsResponseModel responseModel) = _Success;
}
