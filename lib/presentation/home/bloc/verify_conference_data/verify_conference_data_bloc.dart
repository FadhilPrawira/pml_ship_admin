import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/update_user_or_conference_status_response_model.dart';

part 'verify_conference_data_bloc.freezed.dart';
part 'verify_conference_data_event.dart';
part 'verify_conference_data_state.dart';

class VerifyConferenceDataBloc
    extends Bloc<VerifyConferenceDataEvent, VerifyConferenceDataState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  VerifyConferenceDataBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_ApproveConference>((event, emit) async {
      emit(const VerifyConferenceDataState.loading());
      final response = await conferenceRemoteDatasource.approveConference(
        event.approveUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyConferenceDataState.error(l)),
        (r) => emit(VerifyConferenceDataState.success(r)),
      );
    });

    on<_RejectConference>((event, emit) async {
      emit(const VerifyConferenceDataState.loading());
      final response = await conferenceRemoteDatasource.rejectConference(
        event.rejectUserOrOrderOrConferenceRequestModel,
        event.transactionId,
      );
      response.fold(
        (l) => emit(VerifyConferenceDataState.error(l)),
        (r) => emit(VerifyConferenceDataState.success(r)),
      );
    });
  }
}
