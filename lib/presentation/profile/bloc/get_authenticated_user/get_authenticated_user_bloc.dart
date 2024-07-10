import 'package:bloc/bloc.dart';
import '../../../../data/datasources/auth_remote_datasource.dart';
import '../../../../data/models/response/user_response_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_authenticated_user_event.dart';
part 'get_authenticated_user_state.dart';
part 'get_authenticated_user_bloc.freezed.dart';

class GetAuthenticatedUserBloc
    extends Bloc<GetAuthenticatedUserEvent, GetAuthenticatedUserState> {
  final AuthRemoteDatasource datasource;

  GetAuthenticatedUserBloc(this.datasource) : super(const _Initial()) {
    on<_GetAuthenticatedUser>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getAuthenticatedUserDetail();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
