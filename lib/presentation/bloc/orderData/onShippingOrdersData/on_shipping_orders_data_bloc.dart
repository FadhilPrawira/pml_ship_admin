import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';

part 'on_shipping_orders_data_bloc.freezed.dart';
part 'on_shipping_orders_data_event.dart';
part 'on_shipping_orders_data_state.dart';

class OnShippingOrdersDataBloc
    extends Bloc<OnShippingOrdersDataEvent, OnShippingOrdersDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OnShippingOrdersDataBloc(this.orderRemoteDatasource)
      : super(const _Initial()) {
    on<_GetOnShippingOrdersData>((event, emit) async {
      emit(const OnShippingOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllOnShippingOrders();
      response.fold(
        (l) => emit(OnShippingOrdersDataState.error(l)),
        (r) => emit(OnShippingOrdersDataState.success(r)),
      );
    });
  }
}
