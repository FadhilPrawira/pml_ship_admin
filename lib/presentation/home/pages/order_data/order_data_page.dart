import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/order_data/order_data_bloc.dart';
import '../../widgets/order_data/build_order_data_item.dart';

class OrderDataPage extends StatefulWidget {
  const OrderDataPage({super.key});

  @override
  State<OrderDataPage> createState() => _OrderDataPageState();
}

class _OrderDataPageState extends State<OrderDataPage> {
  void getAllPendingOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllPendingOrders(),
        );
  }

  void getAllPaymentPendingOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllPaymentPendingOrders(),
        );
  }

  void getAllOnShippingOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllOnShippingOrders(),
        );
  }

  void getAllCompletedOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllCompletedOrders(),
        );
  }

  void getAllRejectedOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllRejectedOrders(),
        );
  }

  void getAllCanceledOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllCanceledOrders(),
        );
  }

  @override
  void initState() {
    super.initState();
    // Trigger the initial data load for the first tab.
    // Adjust this to load data for all tabs or a specific tab based on your app's needs.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPendingOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Data'),
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                getAllPendingOrders();
              } else if (index == 1) {
                getAllPaymentPendingOrders();
              } else if (index == 2) {
                getAllOnShippingOrders();
              } else if (index == 3) {
                getAllCompletedOrders();
              } else if (index == 4) {
                getAllRejectedOrders();
              } else {
                getAllCanceledOrders();
              }
            },
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: const [
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Payment Pending',
              ),
              Tab(
                text: 'On Shipping',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Rejected',
              ),
              Tab(
                text: 'Canceled',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllPendingOrders,
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllPaymentPendingOrders,
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllOnShippingOrders,
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllCompletedOrders,
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllRejectedOrders,
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
              getAllCanceledOrders,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderDataTab<BlocType extends BlocBase<StateType>, StateType>(
    BlocType bloc,
    VoidCallback fetchData,
  ) {
    return BlocBuilder<BlocType, StateType>(
      builder: (context, state) {
        return (state as dynamic).maybeWhen(
          orElse: () {
            return const Center(
              child: Text('No data available'),
            );
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
            return BuildOrderDataItem(
              response: response,
              refreshData: fetchData,
            );
          },
        );
      },
    );
  }

  // ListView buildOrderDataItem(
  //   GetAllStatusOrderResponseModel response,
  //   VoidCallback refreshData,
  // ) {
  // return ListView.builder(
  //   itemCount: response.data.length,
  //   itemBuilder: (context, index) {
  //     final orderData = response.data[index];
  //     return Container(
  //       margin: const EdgeInsets.symmetric(
  //         vertical: 10,
  //         horizontal: 12,
  //       ),
  //       padding: const EdgeInsets.symmetric(
  //         vertical: 10,
  //         horizontal: 10,
  //       ),
  //       decoration: BoxDecoration(
  //           border: Border.all(color: AppColors.black),
  //           borderRadius: BorderRadius.circular(5.0)),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 orderData.status == 'order_pending'
  //                     ? 'Created at: ${orderData.createdAt.toFormattedInternationalShortDateAndUTC7Time()}'
  //                     : orderData.status == 'payment_pending'
  //                         ? 'Approved at: ${orderData.negotiationOrOrderApprovedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
  //                         : orderData.status == 'on_shipping'
  //                             ? 'On shipping at: ${orderData.updatedAt.toFormattedInternationalShortDateAndUTC7Time()}'
  //                             : orderData.status == 'order_completed'
  //                                 ? 'Completed at: ${orderData.updatedAt.toFormattedInternationalShortDateAndUTC7Time()}'
  //                                 : orderData.status == 'order_rejected'
  //                                     ? 'Rejected at: ${orderData.orderRejectedAt?.toFormattedInternationalShortDateAndUTC7Time()}'
  //                                     : orderData.status == 'order_canceled'
  //                                         ? 'Canceled at: ${orderData.orderCanceledAt?.toFormattedInternationalShortDateAndUTC7Time()}'
  //                                         : 'Created at: ${orderData.createdAt.toFormattedInternationalShortDateAndUTC7Time()}',
  //                 style: primaryTextStyle.copyWith(
  //                   fontWeight: medium,
  //                   fontSize: 12.0,
  //                 ),
  //               ),
  //               Text(orderData.transactionId),
  //             ],
  //           ),
  //           Text(
  //             '${orderData.shipper.name} - ${orderData.consignee.name}',
  //             style: primaryTextStyle.copyWith(
  //               fontWeight: medium,
  //               fontSize: 18.0,
  //             ),
  //           ),
  //           Text(
  //             '${orderData.loading.port} → ${orderData.discharge.port}',
  //             style:
  //                 primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18.0),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Button.filled(
  //                 width: 170,
  //                 onPressed: () {
  //                   // To navigate to VerifyOrderDataPage
  //                   Navigator.pushNamed(
  //                     context,
  //                     AppRoutes.verifyOrder,
  //                     arguments: {
  //                       'transactionId': orderData.transactionId,
  //                       'refreshData': refreshData,
  //                     },
  //                   );
  //                 },
  //                 label: 'Order Detail',
  //                 fontSize: 12.0,
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // );
  // }
}
