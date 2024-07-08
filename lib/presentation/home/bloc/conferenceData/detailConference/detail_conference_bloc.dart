import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/conference_remote_datasource.dart';
import '../../../../../data/models/response/conference_response_model.dart';

part 'detail_conference_bloc.freezed.dart';
part 'detail_conference_event.dart';
part 'detail_conference_state.dart';

class DetailConferenceBloc
    extends Bloc<DetailConferenceEvent, DetailConferenceState> {
  final ConferenceRemoteDatasource conferenceRemoteDatasource;
  DetailConferenceBloc(this.conferenceRemoteDatasource)
      : super(const _Initial()) {
    on<_GetFullConferenceData>((event, emit) async {
      emit(const DetailConferenceState.loading());
      final response = await conferenceRemoteDatasource
          .getFullConferenceData(event.transactionId);
      response.fold(
        (l) => emit(DetailConferenceState.error(l)),
        (r) => emit(DetailConferenceState.success(r)),
      );
    });
  }
}
