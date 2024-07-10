import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../../data/models/response/update_payment_status_response_model.dart';

part 'reject_payment_bloc.freezed.dart';
part 'reject_payment_event.dart';
part 'reject_payment_state.dart';

class RejectPaymentBloc extends Bloc<RejectPaymentEvent, RejectPaymentState> {
  final PaymentRemoteDatasource datasource;
  RejectPaymentBloc(this.datasource) : super(const _Initial()) {
    on<_RejectPayment>((event, emit) async {
      emit(const RejectPaymentState.loading());
      final response = await datasource.rejectPayment(
        event.requestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(RejectPaymentState.error(l)),
        (r) => emit(RejectPaymentState.success(r)),
      );
    });
  }
}
