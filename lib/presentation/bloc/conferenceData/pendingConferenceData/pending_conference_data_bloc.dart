import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/conference_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_conference_response_model.dart';

part 'pending_conference_data_bloc.freezed.dart';
part 'pending_conference_data_event.dart';
part 'pending_conference_data_state.dart';

class PendingConferenceDataBloc
    extends Bloc<PendingConferenceDataEvent, PendingConferenceDataState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  PendingConferenceDataBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_GetPendingConferenceData>((event, emit) async {
      emit(const PendingConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllPendingConference();
      response.fold(
        (l) => emit(PendingConferenceDataState.error(l)),
        (r) => emit(PendingConferenceDataState.success(r)),
      );
    });
  }
}
