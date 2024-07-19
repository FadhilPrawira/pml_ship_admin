import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/update_user_or_conference_status_response_model.dart';

part 'verify_customer_data_event.dart';
part 'verify_customer_data_state.dart';
part 'verify_customer_data_bloc.freezed.dart';

class VerifyCustomerDataBloc
    extends Bloc<VerifyCustomerDataEvent, VerifyCustomerDataState> {
  final UserRemoteDatasource userRemoteDatasource;
  VerifyCustomerDataBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_ApproveUser>((event, emit) async {
      emit(const VerifyCustomerDataState.loading());
      final response = await userRemoteDatasource.approveUser(
        event.approveUserOrOrderOrConferenceRequestModel,
        event.userId,
      );
      response.fold(
        (l) => emit(VerifyCustomerDataState.error(l)),
        (r) => emit(VerifyCustomerDataState.success(r)),
      );
    });
    on<_RejectUser>((event, emit) async {
      emit(const VerifyCustomerDataState.loading());
      final response = await userRemoteDatasource.rejectUser(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.userId,
      );
      response.fold(
        (l) => emit(VerifyCustomerDataState.error(l)),
        (r) => emit(VerifyCustomerDataState.success(r)),
      );
    });
  }
}
