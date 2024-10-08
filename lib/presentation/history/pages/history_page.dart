import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/bloc/order_data/order_data_bloc.dart';

import '../widgets/order_data_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> historyTabs = <Tab>[
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
  ];
  late TabController _tabController;

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

  void getRejectedOrders() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllRejectedOrders(),
        );
  }

  void getCanceledOrders() {
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
    _tabController = TabController(vsync: this, length: historyTabs.length);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        fetchDataForCurrentTab();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void fetchDataForCurrentTab() {
    // Dispatch an event to the Bloc based on the current tab index
    switch (_tabController.index) {
      case 0:
        getAllPendingOrders();
        break;
      case 1:
        getAllPaymentPendingOrders();
        break;
      case 2:
        getAllOnShippingOrders();
        break;
      case 3:
        getAllCompletedOrders();
        break;
      case 4:
        getRejectedOrders();
        break;
      case 5:
        getCanceledOrders();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: historyTabs,
            controller: _tabController,
          ),
          title: const Text('History'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
            buildOrderDataTab<OrderDataBloc, OrderDataState>(
              context.read<OrderDataBloc>(),
            ),
          ],
        ),
      ),
    );
  }
}

// BlocBuilder<PendingOrdersDataBloc, PendingOrdersDataState> buildOrderDataTab()
Widget buildOrderDataTab<BlocType extends BlocBase<StateType>, StateType>(
  BlocType bloc,
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
        success: (historyResponse) {
          if (historyResponse.data.isEmpty) {
            return const Center(child: Text('No Data Available'));
          }
          return OrderDataCard(response: historyResponse);
        },
      );
    },
  );
}
