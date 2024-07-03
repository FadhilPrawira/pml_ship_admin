import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/update_payment_status_response_model.dart';

part 'approve_payment_event.dart';
part 'approve_payment_state.dart';
part 'approve_payment_bloc.freezed.dart';

class ApprovePaymentBloc
    extends Bloc<ApprovePaymentEvent, ApprovePaymentState> {
  final PaymentRemoteDatasource datasource;
  ApprovePaymentBloc(this.datasource) : super(const _Initial()) {
    on<_ApprovePayment>((event, emit) async {
      emit(const ApprovePaymentState.loading());
      final response = await datasource.approvePayment(
        event.requestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(ApprovePaymentState.error(l)),
        (r) => emit(ApprovePaymentState.success(r)),
      );
    });
  }
}
