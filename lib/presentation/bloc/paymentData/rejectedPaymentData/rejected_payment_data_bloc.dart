import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship_admin/data/datasources/payment_remote_datasource.dart';

import '../../../../data/models/response/get_all_payments_response_model.dart';

part 'rejected_payment_data_event.dart';
part 'rejected_payment_data_state.dart';
part 'rejected_payment_data_bloc.freezed.dart';

class RejectedPaymentDataBloc
    extends Bloc<RejectedPaymentDataEvent, RejectedPaymentDataState> {
  final PaymentRemoteDatasource datasource;
  RejectedPaymentDataBloc(this.datasource) : super(const _Initial()) {
    on<_GetRejectedPaymentData>((event, emit) async {
      emit(const RejectedPaymentDataState.loading());
      final response = await datasource.getAllRejectedPayments();
      response.fold(
        (l) => emit(RejectedPaymentDataState.error(l)),
        (r) => emit(RejectedPaymentDataState.success(r)),
      );
    });
  }
}
