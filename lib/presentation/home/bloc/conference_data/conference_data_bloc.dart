import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_conference_response_model.dart';

part 'conference_data_event.dart';
part 'conference_data_state.dart';
part 'conference_data_bloc.freezed.dart';

class ConferenceDataBloc
    extends Bloc<ConferenceDataEvent, ConferenceDataState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  ConferenceDataBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_GetApprovedConferenceData>((event, emit) async {
      emit(const ConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllApprovedConference();
      response.fold(
        (l) => emit(ConferenceDataState.error(l)),
        (r) => emit(ConferenceDataState.success(r)),
      );
    });
    on<_GetPendingConferenceData>((event, emit) async {
      emit(const ConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllPendingConference();
      response.fold(
        (l) => emit(ConferenceDataState.error(l)),
        (r) => emit(ConferenceDataState.success(r)),
      );
    });
    on<_GetRejectedCustomerData>((event, emit) async {
      emit(const ConferenceDataState.loading());
      final response =
          await conferenceRemoteDatasource.getAllRejectedConference();
      response.fold(
        (l) => emit(ConferenceDataState.error(l)),
        (r) => emit(ConferenceDataState.success(r)),
      );
    });
  }
}
