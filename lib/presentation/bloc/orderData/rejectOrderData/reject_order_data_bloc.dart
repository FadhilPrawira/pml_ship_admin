import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/response/update_order_status_response_model.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';

part 'reject_order_data_event.dart';
part 'reject_order_data_state.dart';
part 'reject_order_data_bloc.freezed.dart';

class RejectOrderDataBloc
    extends Bloc<RejectOrderDataEvent, RejectOrderDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  RejectOrderDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_RejectOrder>((event, emit) async {
      emit(const RejectOrderDataState.loading());
      final response = await orderRemoteDatasource.rejectOrder(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(RejectOrderDataState.error(l)),
        (r) => emit(RejectOrderDataState.success(r)),
      );
    });
  }
}
