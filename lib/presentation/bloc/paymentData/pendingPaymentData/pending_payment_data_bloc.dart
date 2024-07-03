import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../data/models/response/get_all_payments_response_model.dart';

part 'pending_payment_data_event.dart';
part 'pending_payment_data_state.dart';
part 'pending_payment_data_bloc.freezed.dart';

class PendingPaymentDataBloc
    extends Bloc<PendingPaymentDataEvent, PendingPaymentDataState> {
  final PaymentRemoteDatasource datasource;
  PendingPaymentDataBloc(this.datasource) : super(const _Initial()) {
    on<_GetPendingPaymentData>((event, emit) async {
      emit(const PendingPaymentDataState.loading());
      final response = await datasource.getAllPendingPayments();
      response.fold(
        (l) => emit(PendingPaymentDataState.error(l)),
        (r) => emit(PendingPaymentDataState.success(r)),
      );
    });
  }
}
