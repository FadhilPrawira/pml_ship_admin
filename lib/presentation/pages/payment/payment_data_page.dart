import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship_admin/presentation/bloc/paymentData/pendingPaymentData/pending_payment_data_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../data/models/response/get_all_payments_response_model.dart';
import '../../bloc/paymentData/approvedPaymentData/approved_payment_data_bloc.dart';
import '../../bloc/paymentData/rejectedPaymentData/rejected_payment_data_bloc.dart';

class PaymentDataPage extends StatefulWidget {
  const PaymentDataPage({super.key});

  @override
  State<PaymentDataPage> createState() => _PaymentDataPageState();
}

class _PaymentDataPageState extends State<PaymentDataPage> {
  void getAllPendingPayment() {
    context
        .read<PendingPaymentDataBloc>()
        .add(const PendingPaymentDataEvent.getPendingPaymentData());
  }

  void getAllApprovedPayment() {
    context
        .read<ApprovedPaymentDataBloc>()
        .add(const ApprovedPaymentDataEvent.getApprovedPaymentData());
  }

  void getAllRejectedPayment() {
    context
        .read<RejectedPaymentDataBloc>()
        .add(const RejectedPaymentDataEvent.getRejectedPaymentData());
  }

  @override
  void initState() {
    super.initState();
    // Trigger the initial data load for the first tab.
    // Adjust this to load data for all tabs or a specific tab based on your app's needs.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPendingPayment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              onTap: (index) {
                if (index == 0) {
                  log('Tab index: $index');
                  getAllPendingPayment();
                } else if (index == 1) {
                  log('Tab index: $index');
                  getAllApprovedPayment();
                } else if (index == 2) {
                  log('Tab index: $index');
                  getAllRejectedPayment();
                }
              },
              tabs: const [
                Tab(
                  text: 'On Process',
                ),
                Tab(
                  text: 'Finished',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ],
            ),
            title: const Text('Payment Data'),
          ),
          body: TabBarView(
            children: <Widget>[
              buildPaymentDataTab<PendingPaymentDataBloc,
                  PendingPaymentDataState>(
                context.read<PendingPaymentDataBloc>(),
                getAllPendingPayment,
              ),
              buildPaymentDataTab<ApprovedPaymentDataBloc,
                  ApprovedPaymentDataState>(
                context.read<ApprovedPaymentDataBloc>(),
                getAllApprovedPayment,
              ),
              buildPaymentDataTab<RejectedPaymentDataBloc,
                  RejectedPaymentDataState>(
                context.read<RejectedPaymentDataBloc>(),
                getAllRejectedPayment,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentDataTab<BlocType extends BlocBase<StateType>, StateType>(
    BlocType bloc,
    VoidCallback fetchData,
  ) {
    return BlocBuilder<BlocType, StateType>(
      builder: (context, state) {
        return (state as dynamic).maybeWhen(
          orElse: () {
            return const Center(child: Text('No data available'));
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (response) {
            if (response.data.isEmpty) {
              return const Center(child: Text('No Data Available'));
            }
            return buildPaymentDataItem(
              response,
              fetchData,
            );
          },
        );
      },
    );
  }

  ListView buildPaymentDataItem(
    GetAllPaymentsResponseModel response,
    VoidCallback refreshData,
  ) {
    return ListView.builder(
      itemCount: response.data.length,
      itemBuilder: (context, index) {
        final paymentData = response.data[index];
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                paymentData.createdAt.toIso8601String(),
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 12.0),
              ),
              // Text(
              //   paymentData.Payment.companyName,
              //   style: primaryTextStyle.copyWith(
              //       fontWeight: medium, fontSize: 18.0),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 180,
                    onPressed: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRoutes.verifyPayment,
                      //   arguments: {
                      //     'transactionId': PaymentData.transactionId,
                      //     'refreshData': refreshData,
                      //   },
                      // );
                    },
                    label: 'Payment Detail',
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
