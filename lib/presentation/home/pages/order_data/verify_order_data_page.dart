import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship_admin/data/models/request/complete_order_request_model.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/order_detail_response_model.dart';

import '../../bloc/order_data/order_data_bloc.dart';
import '../../bloc/order_detail/order_detail_bloc.dart';

import '../../bloc/verify_order_data/verify_order_data_bloc.dart';
import '../document/document_list_page.dart';

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
        .read<OrderDetailBloc>()
        .add(OrderDetailEvent.getDetailOrderData(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.all(30.0),
            child: const Text(
              'Verify Order Data',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
        body: BlocConsumer<OrderDetailBloc, OrderDetailState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${e.message}'),
                    backgroundColor: AppColors.red,
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

  ListView buildCustomerDataTab(OrderDetailResponseModel order) {
    bool isPending = order.data!.status == 'order_pending';
    // bool isPaymentPending = order.data!.status == 'payment_pending';
    bool isOnShipping = order.data!.status == 'on_shipping';

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        buildSectionHeader('Order Detail'),
        buildInfoItem('Transaction ID', '${order.data!.transactionId}'),
        buildInfoItem('Route',
            '${order.data!.loading!.port} → ${order.data!.discharge!.port}'),
        buildInfoItem('Date of Loading',
            '${order.data!.loading!.date!.day}-${order.data!.loading!.date!.month}-${order.data!.loading!.date!.year}'),
        buildInfoItem('Date of Discharge',
            '${order.data!.discharge!.date!.day}-${order.data!.discharge!.date!.month}-${order.data!.discharge!.date!.year}'),
        // buildInfoItem(
        //     'Total Pembayaran', '${order.data.totalBill.currencyEYDFormatRp} '),
        // // Bukti Pembayaran
        // buildInfoItem(
        //     'Payment Proof (download here)', 'PAYMENT PROOF PDF'), //show image
        // Button approve reject pembayaran. auto reload jika dipencet
        buildSectionHeader('Shipper and Consignee Detail'),
        buildInfoItem('Shipper Name', '${order.data!.shipper!.name}'),
        buildInfoItem('Shipper Address', '${order.data!.shipper!.address}'),
        buildInfoItem('Consignee Name', '${order.data!.consignee!.name}'),
        buildInfoItem('Consignee Address', '${order.data!.consignee!.address}'),
        buildSectionHeader('Cargo Info'),
        buildInfoItem('Cargo Description', '${order.data!.cargo!.description}'),
        buildInfoItem('Cargo Weight', '${order.data!.cargo!.weight}'),
        // Button approve reject order. navigator pop jika dipencet
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Visibility(
            visible: isPending, // Show only if status is 'pending'
            child: Column(
              children: [
                const Text(
                  'Apakah tercapai kesepakatan dalam negosiasi? Negosiasi harus dilaksanakan sebelum menyetujui order.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRejectButton('${order.data!.transactionId}'),
                    buildApproveButton('${order.data!.transactionId}'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isOnShipping,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                Button.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocumentListPage(
                          transactionId: order.data!.transactionId!,
                        ),
                      ),
                    );
                  },
                  label: 'Upload Document',
                ),
                const SpaceHeight(20),
                BlocListener<VerifyOrderDataBloc, VerifyOrderDataState>(
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
                      success: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order completed successfully'),
                            backgroundColor: AppColors.green,
                          ),
                        );
                        Navigator.pop(context);
                        context.read<OrderDataBloc>().add(
                              const OrderDataEvent.getAllOnShippingOrders(),
                            );
                      },
                    );
                  },
                  child: Button.filled(
                    onPressed: () {
                      final dataRequest = CompleteOrderRequestModel(
                        completedAt: DateTime.now(),
                      );
                      context.read<VerifyOrderDataBloc>().add(
                            VerifyOrderDataEvent.setOrderToCompleted(
                              dataRequest,
                              widget.transactionId,
                            ),
                          );
                    },
                    label: 'Set to completed',
                  ),
                ),
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
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22.0,
        ),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
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
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRejectButton(String transactionId) {
    return BlocListener<VerifyOrderDataBloc, VerifyOrderDataState>(
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
              SnackBar(
                content: Text('Order $transactionId rejected successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
            context.read<OrderDataBloc>().add(
                  const OrderDataEvent.getAllPendingOrders(),
                );
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = RejectUserOrOrderOrConferenceRequestModel(
            rejectedAt: DateTime.now(),
          );

          context.read<VerifyOrderDataBloc>().add(
                VerifyOrderDataEvent.rejectOrder(
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

  Widget buildApproveButton(String transactionId) {
    return BlocListener<VerifyOrderDataBloc, VerifyOrderDataState>(
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
              SnackBar(
                content: Text('Order $transactionId approved successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
            context.read<OrderDataBloc>().add(
                  const OrderDataEvent.getAllPendingOrders(),
                );
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = ApproveUserOrOrderOrConferenceRequestModel(
            approvedAt: DateTime.now(),
          );
          context.read<VerifyOrderDataBloc>().add(
                VerifyOrderDataEvent.approveOrder(
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
}
