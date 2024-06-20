import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../core/styles.dart';
import '../../data/models/response/get_all_status_order_response_model.dart';
import '../bloc/orderData/OnShippingOrdersData/on_shipping_orders_data_bloc.dart';
import '../bloc/orderData/canceledOrdersData/canceled_orders_data_bloc.dart';
import '../bloc/orderData/completedOrdersData/completed_orders_data_bloc.dart';
import '../bloc/orderData/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import '../bloc/orderData/pendingOrdersData/pending_orders_data_bloc.dart';
import '../bloc/orderData/rejectedOrdersData/rejected_orders_data_bloc.dart';

class OrderDataPage extends StatefulWidget {
  const OrderDataPage({super.key});

  @override
  State<OrderDataPage> createState() => _OrderDataPageState();
}

class _OrderDataPageState extends State<OrderDataPage> {
  void getAllPendingOrders() {
    context.read<PendingOrdersDataBloc>().add(
          const PendingOrdersDataEvent.getAllPendingOrders(),
        );
  }

  void getAllPaymentPendingOrders() {
    context.read<PaymentPendingOrdersDataBloc>().add(
          const PaymentPendingOrdersDataEvent.getAllPaymentPendingOrders(),
        );
  }

  void getAllOnShippingOrders() {
    context.read<OnShippingOrdersDataBloc>().add(
          const OnShippingOrdersDataEvent.getAllOnShippingOrders(),
        );
  }

  void getAllCompletedOrders() {
    context.read<CompletedOrdersDataBloc>().add(
          const CompletedOrdersDataEvent.getAllCompletedOrders(),
        );
  }

  void getAllRejectedOrders() {
    context.read<RejectedOrdersDataBloc>().add(
          const RejectedOrdersDataEvent.getAllRejectedOrders(),
        );
  }

  void getAllCanceledOrders() {
    context.read<CanceledOrdersDataBloc>().add(
          const CanceledOrdersDataEvent.getAllCanceledOrders(),
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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
            buildOrderDataTab<PendingOrdersDataBloc, PendingOrdersDataState>(
              context.read<PendingOrdersDataBloc>(),
              getAllPendingOrders,
            ),
            buildOrderDataTab<PaymentPendingOrdersDataBloc,
                PaymentPendingOrdersDataState>(
              context.read<PaymentPendingOrdersDataBloc>(),
              getAllPaymentPendingOrders,
            ),
            buildOrderDataTab<OnShippingOrdersDataBloc,
                OnShippingOrdersDataState>(
              context.read<OnShippingOrdersDataBloc>(),
              getAllOnShippingOrders,
            ),
            buildOrderDataTab<CompletedOrdersDataBloc,
                CompletedOrdersDataState>(
              context.read<CompletedOrdersDataBloc>(),
              getAllCompletedOrders,
            ),
            buildOrderDataTab<RejectedOrdersDataBloc, RejectedOrdersDataState>(
              context.read<RejectedOrdersDataBloc>(),
              getAllRejectedOrders,
            ),
            buildOrderDataTab<CanceledOrdersDataBloc, CanceledOrdersDataState>(
              context.read<CanceledOrdersDataBloc>(),
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
            return const Center(child: Text('Error'));
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
            return buildOrderDataItem(
              response,
              fetchData,
            );
          },
        );
      },
    );
  }

  ListView buildOrderDataItem(
    GetAllStatusOrderResponseModel response,
    VoidCallback refreshData,
  ) {
    return ListView.builder(
      itemCount: response.data.length,
      itemBuilder: (context, index) {
        final orderData = response.data[index];
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
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
            children: [
              Text(
                orderData.createdAt.toIso8601String(),
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12.0,
                ),
              ),
              Text(
                '${orderData.shipperName} - ${orderData.consigneeName}',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18.0,
                ),
              ),
              Text(
                '${orderData.portOfLoadingName.toString()} → ${orderData.portOfDischargeName.toString()}',
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 170,
                    onPressed: () {
                      // To navigate to VerifyOrderDataPage
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRoutes.verifyCustomer,
                      //   arguments: userData.id,
                      // );
                    },
                    label: 'Order Detail',
                    fontSize: 12.0,
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
