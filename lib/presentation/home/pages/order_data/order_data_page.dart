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
}
