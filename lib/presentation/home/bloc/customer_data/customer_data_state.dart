part of 'customer_data_bloc.dart';

@freezed
class CustomerDataState with _$CustomerDataState {
  const factory CustomerDataState.initial() = _Initial;
  const factory CustomerDataState.loading() = _Loading;
  const factory CustomerDataState.error(String message) = _Error;
  const factory CustomerDataState.success(
      GetAllStatusUserResponseModel getAllStatusUserResponseModel) = _Success;
}
