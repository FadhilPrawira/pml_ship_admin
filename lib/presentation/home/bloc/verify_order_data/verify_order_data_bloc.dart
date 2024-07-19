import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/complete_order_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/update_order_status_response_model.dart';

part 'verify_order_data_bloc.freezed.dart';
part 'verify_order_data_event.dart';
part 'verify_order_data_state.dart';

class VerifyOrderDataBloc
    extends Bloc<VerifyOrderDataEvent, VerifyOrderDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  VerifyOrderDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_ApproveOrder>((event, emit) async {
      emit(const VerifyOrderDataState.loading());
      final response = await orderRemoteDatasource.approveOrder(
        event.approveUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyOrderDataState.error(l)),
        (r) => emit(VerifyOrderDataState.success(r)),
      );
    });
    on<_RejectOrder>((event, emit) async {
      emit(const VerifyOrderDataState.loading());
      final response = await orderRemoteDatasource.rejectOrder(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyOrderDataState.error(l)),
        (r) => emit(VerifyOrderDataState.success(r)),
      );
    });
    on<_SetOrderToCompleted>((event, emit) async {
      emit(const VerifyOrderDataState.loading());
      final response = await orderRemoteDatasource.setOrderToCompleted(
        event.completeOrderRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyOrderDataState.error(l)),
        (r) => emit(VerifyOrderDataState.success(r)),
      );
    });
  }
}
