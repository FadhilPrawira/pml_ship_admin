import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../../data/models/response/update_user_or_conference_status_response_model.dart';

part 'approve_conference_bloc.freezed.dart';
part 'approve_conference_event.dart';
part 'approve_conference_state.dart';

class ApproveConferenceBloc
    extends Bloc<ApproveConferenceEvent, ApproveConferenceState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  ApproveConferenceBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_ApproveConference>((event, emit) async {
      emit(const ApproveConferenceState.loading());
      final response = await conferenceRemoteDatasource.approveConference(
        event.approveUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(ApproveConferenceState.error(l)),
        (r) => emit(ApproveConferenceState.success(r)),
      );
    });
  }
}
