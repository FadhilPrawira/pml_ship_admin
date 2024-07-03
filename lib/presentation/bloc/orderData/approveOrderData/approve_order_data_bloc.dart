import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/response/update_order_status_response_model.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';

part 'approve_order_data_bloc.freezed.dart';
part 'approve_order_data_event.dart';
part 'approve_order_data_state.dart';

class ApproveOrderDataBloc
    extends Bloc<ApproveOrderDataEvent, ApproveOrderDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  ApproveOrderDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_ApproveOrder>((event, emit) async {
      emit(const ApproveOrderDataState.loading());
      final response = await orderRemoteDatasource.approveOrder(
        event.approveUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(ApproveOrderDataState.error(l)),
        (r) => emit(ApproveOrderDataState.success(r)),
      );
    });
  }
}
