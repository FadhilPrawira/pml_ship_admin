import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_user_response_model.dart';

part 'approved_customer_data_bloc.freezed.dart';
part 'approved_customer_data_event.dart';
part 'approved_customer_data_state.dart';

class ApprovedCustomerDataBloc
    extends Bloc<ApprovedCustomerDataEvent, ApprovedCustomerDataState> {
  final UserRemoteDatasource userRemoteDatasource;
  ApprovedCustomerDataBloc(this.userRemoteDatasource)
      : super(const _Initial()) {
    on<_GetApprovedCustomerData>((event, emit) async {
      emit(const ApprovedCustomerDataState.loading());
      final response = await userRemoteDatasource.getAllApprovedUser();
      response.fold(
        (l) => emit(ApprovedCustomerDataState.error(l)),
        (r) => emit(ApprovedCustomerDataState.success(r)),
      );
    });
  }
}
