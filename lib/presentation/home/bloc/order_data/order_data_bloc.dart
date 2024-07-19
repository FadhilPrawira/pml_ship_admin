import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';

part 'order_data_bloc.freezed.dart';
part 'order_data_event.dart';
part 'order_data_state.dart';

class OrderDataBloc extends Bloc<OrderDataEvent, OrderDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingOrderData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllPendingOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetPaymentPendingOrderData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllPaymentPendingOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetOnProcessOrdersData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllOnProcessOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetOnShippingOrdersData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllOnShippingOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetCompletedOrdersData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllCompletedOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetCanceledOrdersData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllCanceledOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
    on<_GetRejectedOrderData>((event, emit) async {
      emit(const OrderDataState.loading());
      final response = await orderRemoteDatasource.getAllRejectedOrders();
      response.fold(
        (l) => emit(OrderDataState.error(l)),
        (r) => emit(OrderDataState.success(r)),
      );
    });
  }
}
