import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/user_remote_datasource.dart';
import '../../../../data/models/response/user_response_model.dart';

part 'profile_and_detail_customer_bloc.freezed.dart';
part 'profile_and_detail_customer_event.dart';
part 'profile_and_detail_customer_state.dart';

class ProfileAndDetailCustomerBloc
    extends Bloc<ProfileAndDetailCustomerEvent, ProfileAndDetailCustomerState> {
  final UserRemoteDatasource userRemoteDatasource;
  ProfileAndDetailCustomerBloc(this.userRemoteDatasource)
      : super(const _Initial()) {
    on<_GetFullUserData>((event, emit) async {
      emit(const ProfileAndDetailCustomerState.loading());
      final response = await userRemoteDatasource.getFullUserData(event.userId);
      response.fold(
        (l) => emit(ProfileAndDetailCustomerState.error(l)),
        (r) => emit(ProfileAndDetailCustomerState.success(r)),
      );
    });
  }
}
