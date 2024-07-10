import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/order_remote_datasource.dart';
import '../../../../../data/models/response/order_detail_response_model.dart';

part 'detail_order_data_bloc.freezed.dart';
part 'detail_order_data_event.dart';
part 'detail_order_data_state.dart';

class DetailOrderDataBloc
    extends Bloc<DetailOrderDataEvent, DetailOrderDataState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  DetailOrderDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetDetailOrderData>((event, emit) async {
      emit(const DetailOrderDataState.loading());
      final response =
          await orderRemoteDatasource.getFullOrderData(event.transactionId);
      response.fold(
        (l) => emit(DetailOrderDataState.error(l)),
        (r) => emit(DetailOrderDataState.success(r)),
      );
    });
  }
}
