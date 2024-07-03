import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/payment_remote_datasource.dart';
import '../../../../data/models/response/get_all_payments_response_model.dart';

part 'approved_payment_data_event.dart';
part 'approved_payment_data_state.dart';
part 'approved_payment_data_bloc.freezed.dart';

class ApprovedPaymentDataBloc
    extends Bloc<ApprovedPaymentDataEvent, ApprovedPaymentDataState> {
  final PaymentRemoteDatasource datasource;
  ApprovedPaymentDataBloc(this.datasource) : super(_Initial()) {
    on<_GetApprovedPaymentData>((event, emit) async {
      emit(const ApprovedPaymentDataState.loading());
      final response = await datasource.getAllApprovedPayments();
      response.fold(
        (l) => emit(ApprovedPaymentDataState.error(l)),
        (r) => emit(ApprovedPaymentDataState.success(r)),
      );
    });
  }
}
