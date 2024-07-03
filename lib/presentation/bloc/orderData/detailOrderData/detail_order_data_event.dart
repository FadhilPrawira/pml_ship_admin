part of 'detail_order_data_bloc.dart';

@freezed
class DetailOrderDataEvent with _$DetailOrderDataEvent {
  const factory DetailOrderDataEvent.started() = _Started;
  const factory DetailOrderDataEvent.getDetailOrderData(String transactionId) =
      _GetDetailOrderData;
}
