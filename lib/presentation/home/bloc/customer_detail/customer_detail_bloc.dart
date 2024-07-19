import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_remote_datasource.dart';
import '../../../../data/models/response/user_response_model.dart';

part 'customer_detail_bloc.freezed.dart';
part 'customer_detail_event.dart';
part 'customer_detail_state.dart';

class CustomerDetailBloc
    extends Bloc<CustomerDetailEvent, CustomerDetailState> {
  final UserRemoteDatasource userRemoteDatasource;
  CustomerDetailBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_GetFullUserData>((event, emit) async {
      emit(const CustomerDetailState.loading());
      final response = await userRemoteDatasource.getFullUserData(event.userId);
      response.fold(
        (l) => emit(CustomerDetailState.error(l)),
        (r) => emit(CustomerDetailState.success(r)),
      );
    });
  }
}
