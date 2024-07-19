import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_user_response_model.dart';

part 'customer_data_bloc.freezed.dart';
part 'customer_data_event.dart';
part 'customer_data_state.dart';

class CustomerDataBloc extends Bloc<CustomerDataEvent, CustomerDataState> {
  final UserRemoteDatasource userRemoteDatasource;
  CustomerDataBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingCustomerData>((event, emit) async {
      emit(const CustomerDataState.loading());
      final response = await userRemoteDatasource.getAllPendingUser();
      response.fold(
        (l) => emit(CustomerDataState.error(l)),
        (r) => emit(CustomerDataState.success(r)),
      );
    });
    on<_GetApprovedCustomerData>((event, emit) async {
      emit(const CustomerDataState.loading());
      final response = await userRemoteDatasource.getAllApprovedUser();
      response.fold(
        (l) => emit(CustomerDataState.error(l)),
        (r) => emit(CustomerDataState.success(r)),
      );
    });
    on<_GetRejectedCustomerData>((event, emit) async {
      emit(const CustomerDataState.loading());
      final response = await userRemoteDatasource.getAllRejectedUser();
      response.fold(
        (l) => emit(CustomerDataState.error(l)),
        (r) => emit(CustomerDataState.success(r)),
      );
    });
  }
}
