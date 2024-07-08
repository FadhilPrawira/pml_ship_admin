import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../../data/models/response/update_user_or_conference_status_response_model.dart';

part 'reject_conference_bloc.freezed.dart';
part 'reject_conference_event.dart';
part 'reject_conference_state.dart';

class RejectConferenceBloc
    extends Bloc<RejectConferenceEvent, RejectConferenceState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  RejectConferenceBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_RejectConference>((event, emit) async {
      emit(const RejectConferenceState.loading());
      final response = await conferenceRemoteDatasource.rejectConference(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(RejectConferenceState.error(l)),
        (r) => emit(RejectConferenceState.success(r)),
      );
    });
  }
}
