import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/response/update_user_or_conference_status_response_model.dart';

import '../../../../data/datasources/user_remote_datasource.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';

part 'reject_user_bloc.freezed.dart';
part 'reject_user_event.dart';
part 'reject_user_state.dart';

class RejectUserBloc extends Bloc<RejectUserEvent, RejectUserState> {
  final UserRemoteDatasource userRemoteDatasource;
  RejectUserBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_RejectUser>((event, emit) async {
      emit(const RejectUserState.loading());
      final response = await userRemoteDatasource.rejectUser(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.userId,
      );
      response.fold(
        (l) => emit(RejectUserState.error(l)),
        (r) => emit(RejectUserState.success(r)),
      );
    });
  }
}
