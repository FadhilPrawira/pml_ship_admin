import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';

part 'completed_orders_data_bloc.freezed.dart';
part 'completed_orders_data_event.dart';
part 'completed_orders_data_state.dart';

class CompletedOrdersDataBloc
    extends Bloc<CompletedOrdersDataEvent, CompletedOrdersDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  CompletedOrdersDataBloc(this.orderRemoteDatasource)
      : super(const _Initial()) {
    on<_GetCompletedOrdersData>((event, emit) async {
      emit(const CompletedOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllCompletedOrders();
      response.fold(
        (l) => emit(CompletedOrdersDataState.error(l)),
        (r) => emit(CompletedOrdersDataState.success(r)),
      );
    });
  }
}
