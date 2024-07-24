import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/update_payment_status_response_model.dart';

part 'verify_payment_data_event.dart';
part 'verify_payment_data_state.dart';
part 'verify_payment_data_bloc.freezed.dart';

class VerifyPaymentDataBloc
    extends Bloc<VerifyPaymentDataEvent, VerifyPaymentDataState> {
  final PaymentRemoteDatasource datasource;
  VerifyPaymentDataBloc(this.datasource) : super(const _Initial()) {
    on<_ApprovePayment>((event, emit) async {
      emit(const VerifyPaymentDataState.loading());
      final response = await datasource.approvePayment(
        event.requestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyPaymentDataState.error(l)),
        (r) => emit(VerifyPaymentDataState.successApprove(r)),
      );
    });
    on<_RejectPayment>((event, emit) async {
      emit(const VerifyPaymentDataState.loading());
      final response = await datasource.rejectPayment(
        event.requestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyPaymentDataState.error(l)),
        (r) => emit(VerifyPaymentDataState.successReject(r)),
      );
    });
  }
}
