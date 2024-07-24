import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../home/bloc/order_detail/order_detail_bloc.dart';

class OrderDetailPage extends StatefulWidget {
  final String transactionId;

  const OrderDetailPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<OrderDetailBloc>()
        .add(OrderDetailEvent.getDetailOrderData(widget.transactionId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Order'),
        ),
        body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (responseModel) {
                return ListView(
                  children: [
                    const SpaceHeight(20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSectionHeader('Order Detail'),
                          buildInfoItem('Transaction ID',
                              '${responseModel.data!.transactionId}'),
                          buildInfoItem('Route',
                              '${responseModel.data!.loading!.port} → ${responseModel.data!.discharge!.port}'),
                          buildInfoItem('Date of Loading',
                              '${responseModel.data!.loading!.date!.day}-${responseModel.data!.loading!.date!.month}-${responseModel.data!.loading!.date!.year}'),
                          buildInfoItem('Date of Discharge',
                              '${responseModel.data!.discharge!.date!.day}-${responseModel.data!.discharge!.date!.month}-${responseModel.data!.discharge!.date!.year}'),
                          buildSectionHeader('Shipper and Consignee Detail'),
                          buildInfoItem('Shipper Name',
                              '${responseModel.data!.shipper!.name}'),
                          buildInfoItem('Shipper Address',
                              '${responseModel.data!.shipper!.address}'),
                          buildInfoItem('Consignee Name',
                              '${responseModel.data!.consignee!.name}'),
                          buildInfoItem('Consignee Address',
                              '${responseModel.data!.consignee!.address}'),
                          buildSectionHeader('Cargo Info'),
                          buildInfoItem('Cargo Description',
                              '${responseModel.data!.cargo!.description}'),
                          buildInfoItem('Cargo Weight',
                              '${responseModel.data!.cargo!.weight}'),
                        ],
                      ),
                    ),
                  ],
                );
              },
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
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
}
