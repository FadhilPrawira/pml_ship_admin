import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/user_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_conference_request_model.dart';
import '../../../../data/models/response/update_user_or_conference_status_response_model.dart';

part 'approve_user_bloc.freezed.dart';
part 'approve_user_event.dart';
part 'approve_user_state.dart';

class ApproveUserBloc extends Bloc<ApproveUserEvent, ApproveUserState> {
  final UserRemoteDatasource userRemoteDatasource;
  ApproveUserBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<_ApproveUser>((event, emit) async {
      emit(const ApproveUserState.loading());
      final response = await userRemoteDatasource.approveUser(
        event.approveUserOrConferenceRequestModel,
        event.userId,
      );
      response.fold(
        (l) => emit(ApproveUserState.error(l)),
        (r) => emit(ApproveUserState.success(r)),
      );
    });
  }
}
