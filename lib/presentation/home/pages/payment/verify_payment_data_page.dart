import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship_admin/core/core.dart';

import '../../../../data/datasources/download_file.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/order_detail_response_model.dart';
import '../../bloc/order_detail/order_detail_bloc.dart';
import '../../bloc/payment_data/payment_data_bloc.dart';
import '../../bloc/verify_payment_data/verify_payment_data_bloc.dart';

class VerifyPaymentDataPage extends StatefulWidget {
  final String transactionId;

  const VerifyPaymentDataPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<VerifyPaymentDataPage> createState() => _VerifyPaymentDataPageState();
}

class _VerifyPaymentDataPageState extends State<VerifyPaymentDataPage> {
  @override
  void initState() {
    context
        .read<OrderDetailBloc>()
        .add(OrderDetailEvent.getDetailOrderData(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Verify Payment Data',
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(child: Text('Error')),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (orderData) => buildOrderDetailDataTab(orderData));
          },
        ),
      ),
    );
  }

  ListView buildOrderDetailDataTab(OrderDetailResponseModel orderData) {
    bool isPending =
        orderData.data!.payment!.payments!.first.paymentStatus == 'pending';
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        buildSectionHeader('Payment Info'),
        buildInfoItem('Transaction ID', '${orderData.data!.transactionId}'),
        buildInfoItem('Payment Proof',
            '${orderData.data!.payment!.payments!.first.paymentProofDocument}'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Button.filled(
            onPressed: () {
              final String urlname =
                  '${Variables.documentURL}${orderData.data!.payment!.payments!.first.paymentProofDocument}';
              log(urlname);
              FileStorage.downloadAndSaveFile(urlname);
            },
            label: 'Download Bukti Pembayaran',
          ),
        ),
        buildSectionHeader('Order Info'),
        buildInfoItem('Shipper', '${orderData.data!.shipper!.name}'),
        buildInfoItem('Consignee', '${orderData.data!.consignee!.name}'),
        buildInfoItem('Route',
            '${orderData.data!.loading!.port} to ${orderData.data!.discharge!.port}'),
        buildInfoItem('Date of Loading',
            orderData.data!.loading!.date!.toFormattedIndonesianShortDate()),
        buildInfoItem('Date of Discharge',
            orderData.data!.discharge!.date!.toFormattedIndonesianShortDate()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Visibility(
            visible: isPending,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRejectButton(),
                buildApproveButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BlocListener<VerifyPaymentDataBloc, VerifyPaymentDataState>
      buildApproveButton() {
    return BlocListener<VerifyPaymentDataBloc, VerifyPaymentDataState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: AppColors.red,
              ),
            );
          },
          successApprove: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('payment approved successfully'),
                backgroundColor: AppColors.green,
              ),
            );

            Navigator.pop(context);
            context
                .read<PaymentDataBloc>()
                .add(const PaymentDataEvent.getPendingPaymentData());
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = ApproveUserOrOrderOrConferenceRequestModel(
            approvedAt: DateTime.now(),
          );
          context.read<VerifyPaymentDataBloc>().add(
                VerifyPaymentDataEvent.approvePayment(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  BlocListener<VerifyPaymentDataBloc, VerifyPaymentDataState>
      buildRejectButton() {
    return BlocListener<VerifyPaymentDataBloc, VerifyPaymentDataState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: AppColors.red,
              ),
            );
          },
          successReject: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment rejected successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = RejectUserOrOrderOrConferenceRequestModel(
            rejectedAt: DateTime.now(),
          );
          context.read<VerifyPaymentDataBloc>().add(
                VerifyPaymentDataEvent.rejectPayment(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text(
          'Reject',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
