import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/user_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_user_response_model.dart';

part 'rejected_customer_data_bloc.freezed.dart';
part 'rejected_customer_data_event.dart';
part 'rejected_customer_data_state.dart';

class RejectedCustomerDataBloc
    extends Bloc<RejectedCustomerDataEvent, RejectedCustomerDataState> {
  final UserRemoteDatasource userRemoteDatasource;
  RejectedCustomerDataBloc(this.userRemoteDatasource)
      : super(const _Initial()) {
    on<_GetRejectedCustomerData>((event, emit) async {
      emit(const RejectedCustomerDataState.loading());
      final response = await userRemoteDatasource.getAllRejectedUser();
      response.fold(
        (l) => emit(RejectedCustomerDataState.error(l)),
        (r) => emit(RejectedCustomerDataState.success(r)),
      );
    });
  }
}
