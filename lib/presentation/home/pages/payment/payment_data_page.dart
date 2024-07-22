import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../data/models/response/get_all_payments_response_model.dart';
import '../../bloc/payment_data/payment_data_bloc.dart';
import 'verify_payment_data_page.dart';

class PaymentDataPage extends StatefulWidget {
  const PaymentDataPage({super.key});

  @override
  State<PaymentDataPage> createState() => _PaymentDataPageState();
}

class _PaymentDataPageState extends State<PaymentDataPage> {
  void getAllPendingPayment() {
    context
        .read<PaymentDataBloc>()
        .add(const PaymentDataEvent.getPendingPaymentData());
  }

  void getAllApprovedPayment() {
    context
        .read<PaymentDataBloc>()
        .add(const PaymentDataEvent.getApprovedPaymentData());
  }

  void getAllRejectedPayment() {
    context
        .read<PaymentDataBloc>()
        .add(const PaymentDataEvent.getRejectedPaymentData());
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
              buildPaymentDataTab<PaymentDataBloc, PaymentDataState>(
                context.read<PaymentDataBloc>(),
                getAllPendingPayment,
              ),
              buildPaymentDataTab<PaymentDataBloc, PaymentDataState>(
                context.read<PaymentDataBloc>(),
                getAllApprovedPayment,
              ),
              buildPaymentDataTab<PaymentDataBloc, PaymentDataState>(
                context.read<PaymentDataBloc>(),
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
      itemCount: response.data!.length,
      itemBuilder: (context, index) {
        final paymentData = response.data![index];
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
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                paymentData.createdAt!
                    .toFormattedIndonesianShortDateAndUTC7Time(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 12.0),
              ),
              Text(
                paymentData.orderTransactionId!,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 180,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyPaymentDataPage(
                            transactionId: paymentData.orderTransactionId!,
                          ),
                        ),
                      );
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
