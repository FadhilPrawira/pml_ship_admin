import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_conference_response_model.dart';

part 'rejected_conference_data_bloc.freezed.dart';
part 'rejected_conference_data_event.dart';
part 'rejected_conference_data_state.dart';

class RejectedConferenceDataBloc
    extends Bloc<RejectedConferenceDataEvent, RejectedConferenceDataState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  RejectedConferenceDataBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_GetRejectedCustomerData>((event, emit) async {
      emit(const RejectedConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllRejectedConference();
      response.fold(
        (l) => emit(RejectedConferenceDataState.error(l)),
        (r) => emit(RejectedConferenceDataState.success(r)),
      );
    });
  }
}
