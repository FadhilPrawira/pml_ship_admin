import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_conference_response_model.dart';

part 'approved_conference_data_bloc.freezed.dart';
part 'approved_conference_data_event.dart';
part 'approved_conference_data_state.dart';

class ApprovedConferenceDataBloc
    extends Bloc<ApprovedConferenceDataEvent, ApprovedConferenceDataState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  ApprovedConferenceDataBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_GetApprovedConferenceData>((event, emit) async {
      emit(const ApprovedConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllApprovedConference();
      response.fold(
        (l) => emit(ApprovedConferenceDataState.error(l)),
        (r) => emit(ApprovedConferenceDataState.success(r)),
      );
    });
  }
}
