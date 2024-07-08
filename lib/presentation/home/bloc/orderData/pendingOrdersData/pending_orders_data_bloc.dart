import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/order_remote_datasource.dart';
import '../../../../../data/models/response/get_all_status_order_response_model.dart';

part 'pending_orders_data_bloc.freezed.dart';
part 'pending_orders_data_event.dart';
part 'pending_orders_data_state.dart';

class PendingOrdersDataBloc
    extends Bloc<PendingOrdersDataEvent, PendingOrdersDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  PendingOrdersDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingOrderData>((event, emit) async {
      emit(const PendingOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllPendingOrders();
      response.fold(
        (l) => emit(PendingOrdersDataState.error(l)),
        (r) => emit(PendingOrdersDataState.success(r)),
      );
    });

// TODO: Implement multiple events (pending, payment pending, on shipping, completed, rejected, canceled)
    //   // on<_GetPendingOrderData>((event, emit) async {
    //   // emit(const PendingOrdersDataState.loading());
    //   // final response = await orderRemoteDatasource.getAllPendingOrders();
    //   // response.fold(
    //   //   (l) => emit(PendingOrdersDataState.error(l)),
    //   //   (r) => emit(PendingOrdersDataState.success(r)),
    //   // );
    // });
  }
}
