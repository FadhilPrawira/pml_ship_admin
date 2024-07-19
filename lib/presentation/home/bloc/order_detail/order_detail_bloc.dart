import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/response/order_detail_response_model.dart';

part 'order_detail_bloc.freezed.dart';
part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderDetailBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetDetailOrderData>((event, emit) async {
      emit(const OrderDetailState.loading());
      final response =
          await orderRemoteDatasource.getFullOrderData(event.transactionId);
      response.fold(
        (l) => emit(OrderDetailState.error(l)),
        (r) => emit(OrderDetailState.success(r)),
      );
    });
  }
}
