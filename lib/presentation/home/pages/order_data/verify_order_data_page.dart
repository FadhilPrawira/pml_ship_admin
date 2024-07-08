import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/order_response_model.dart';
import '../../bloc/orderData/approveOrderData/approve_order_data_bloc.dart';
import '../../bloc/orderData/detailOrderData/detail_order_data_bloc.dart';
import '../../bloc/orderData/rejectOrderData/reject_order_data_bloc.dart';

class VerifyOrderDataPage extends StatefulWidget {
  final String transactionId;
  final Function refreshData;

  const VerifyOrderDataPage({
    super.key,
    required this.transactionId,
    required this.refreshData,
  });

  @override
  State<VerifyOrderDataPage> createState() => _VerifyOrderDataPageState();
}

class _VerifyOrderDataPageState extends State<VerifyOrderDataPage> {
  @override
  void initState() {
    context
        .read<DetailOrderDataBloc>()
        .add(DetailOrderDataEvent.getDetailOrderData(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor1,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Text(
              'Verify Order Data',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
          ),
        ),
        body: BlocConsumer<DetailOrderDataBloc, DetailOrderDataState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${e.message}'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              success: (user) {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(child: Text('Error')),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (user) => buildCustomerDataTab(user),
            );
          },
        ),
      ),
    );
  }

  ListView buildCustomerDataTab(OrderResponseModel order) {
    bool isPending = order.data.status == 'order_pending';

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        buildSectionHeader('Order Detail'),
        buildInfoItem('Transaction ID', order.data.transactionId),
        buildInfoItem('Route',
            '${order.data.loading.port} → ${order.data.discharge.port}'),
        buildInfoItem('Date of Loading',
            '${order.data.loading.date.day}-${order.data.loading.date.month}-${order.data.loading.date.year}'),
        buildInfoItem('Date of Discharge',
            '${order.data.discharge.date.day}-${order.data.discharge.date.month}-${order.data.discharge.date.year}'),
        // buildInfoItem(
        //     'Total Pembayaran', '${order.data.totalBill.currencyEYDFormatRp} '),
        // // Bukti Pembayaran
        // buildInfoItem(
        //     'Payment Proof (download here)', 'PAYMENT PROOF PDF'), //show image
        // Button approve reject pembayaran. auto reload jika dipencet
        buildSectionHeader('Shipper and Consignee Detail'),
        buildInfoItem('Shipper Name', order.data.shipper.name),
        buildInfoItem('Shipper Address', order.data.shipper.address),
        buildInfoItem('Consignee Name', order.data.consignee.name),
        buildInfoItem('Consignee Address', order.data.consignee.address),
        buildSectionHeader('Cargo Info'),
        buildInfoItem('Cargo Description', order.data.cargo.description),
        buildInfoItem('Cargo Weight', order.data.cargo.weight),
        // Button approve reject order. navigator pop jika dipencet
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Visibility(
            visible: isPending, // Show only if status is 'pending'

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRejectButton(order.data.transactionId),
                buildApproveButton(order.data.transactionId),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22.0),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(),
            ),
            child: Text(
              value,
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 12.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRejectButton(String transactionId) {
    return BlocListener<RejectOrderDataBloc, RejectOrderDataState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order $transactionId rejected successfully'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
            widget.refreshData();
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = RejectUserOrOrderOrConferenceRequestModel(
            rejectedAt: DateTime.now(),
          );

          context.read<RejectOrderDataBloc>().add(
                RejectOrderDataEvent.rejectOrder(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Reject',
          style: primaryTextStyle.copyWith(
              fontWeight: medium, fontSize: 16.0, color: primaryColor),
        ),
      ),
    );
  }

  Widget buildApproveButton(String transactionId) {
    return BlocListener<ApproveOrderDataBloc, ApproveOrderDataState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order $transactionId approved successfully'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
            widget.refreshData();
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = ApproveUserOrOrderOrConferenceRequestModel(
            approvedAt: DateTime.now(),
          );
          context.read<ApproveOrderDataBloc>().add(
                ApproveOrderDataEvent.approveOrder(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: verifyCheck,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Verify',
          style: primaryTextStyle.copyWith(
              fontWeight: medium, fontSize: 16.0, color: primaryColor),
        ),
      ),
    );
  }
}
