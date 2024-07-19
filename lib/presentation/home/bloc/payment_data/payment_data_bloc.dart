import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../data/models/response/get_all_payments_response_model.dart';

part 'payment_data_event.dart';
part 'payment_data_state.dart';
part 'payment_data_bloc.freezed.dart';

class PaymentDataBloc extends Bloc<PaymentDataEvent, PaymentDataState> {
  final PaymentRemoteDatasource datasource;
  PaymentDataBloc(this.datasource) : super(const _Initial()) {
    on<_GetPendingPaymentData>((event, emit) async {
      emit(const PaymentDataState.loading());
      final response = await datasource.getAllPendingPayments();
      response.fold(
        (l) => emit(PaymentDataState.error(l)),
        (r) => emit(PaymentDataState.success(r)),
      );
    });
    on<_GetApprovedPaymentData>((event, emit) async {
      emit(const PaymentDataState.loading());
      final response = await datasource.getAllApprovedPayments();
      response.fold(
        (l) => emit(PaymentDataState.error(l)),
        (r) => emit(PaymentDataState.success(r)),
      );
    });
    on<_GetRejectedPaymentData>((event, emit) async {
      emit(const PaymentDataState.loading());
      final response = await datasource.getAllRejectedPayments();
      response.fold(
        (l) => emit(PaymentDataState.error(l)),
        (r) => emit(PaymentDataState.success(r)),
      );
    });
  }
}
