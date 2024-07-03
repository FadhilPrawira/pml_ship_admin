import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';

part 'on_process_orders_data_event.dart';
part 'on_process_orders_data_state.dart';
part 'on_process_orders_data_bloc.freezed.dart';

class OnProcessOrdersDataBloc
    extends Bloc<OnProcessOrdersDataEvent, OnProcessOrdersDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OnProcessOrdersDataBloc(this.orderRemoteDatasource)
      : super(const _Initial()) {
    on<_GetOnProcessOrdersData>((event, emit) async {
      emit(const OnProcessOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllOnProcessOrders();
      response.fold(
        (l) => emit(OnProcessOrdersDataState.error(l)),
        (r) => emit(OnProcessOrdersDataState.success(r)),
      );
    });
  }
}
