import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/user_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_user_response_model.dart';

part 'pending_customer_data_bloc.freezed.dart';
part 'pending_customer_data_event.dart';
part 'pending_customer_data_state.dart';

class PendingCustomerDataBloc
    extends Bloc<PendingCustomerDataEvent, PendingCustomerDataState> {
  final UserRemoteDatasource userRemoteDatasource;
  PendingCustomerDataBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingCustomerData>((event, emit) async {
      emit(const PendingCustomerDataState.loading());
      final response = await userRemoteDatasource.getAllPendingUser();
      response.fold(
        (l) => emit(PendingCustomerDataState.error(l)),
        (r) => emit(PendingCustomerDataState.success(r)),
      );
    });
  }
}
