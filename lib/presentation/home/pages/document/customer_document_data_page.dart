import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/order_data/order_data_bloc.dart';
import '../../widgets/document_data_card/on_process_document_data_card.dart';

class CustomerDocumentDataPage extends StatefulWidget {
  const CustomerDocumentDataPage({super.key});

  @override
  State<CustomerDocumentDataPage> createState() =>
      _CustomerDocumentDataPageState();
}

class _CustomerDocumentDataPageState extends State<CustomerDocumentDataPage> {
  @override
  void initState() {
    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllOnProcessOrders(),
        );

    context.read<OrderDataBloc>().add(
          const OrderDataEvent.getAllCompletedOrders(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Order On Process',
                ),
                Tab(
                  text: 'Order Finished',
                ),
              ],
            ),
            title: const Text('Customer Document Data'),
          ),
          body: TabBarView(
            children: <Widget>[
              // OnProcessTab
              Column(
                children: <Widget>[
                  // const SearchBarWidget(
                  //     customHintText: 'Search by ID Order/Type of Document',
                  //     customPadding: 10.0),
                  Expanded(
                    child: BlocBuilder<OrderDataBloc, OrderDataState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Center(
                                child: Text('No data available'));
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          success: (response) {
                            return OnProcessDocumentDataCard(
                                responseModel: response);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              // ReceivedTab
              Column(
                children: <Widget>[
                  // SearchBarWidget(
                  //     customHintText: 'Search by ID Order/Type of Document',
                  //     customPadding: 10.0),
                  Expanded(
                    child: BlocBuilder<OrderDataBloc, OrderDataState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Center(
                                child: Text('No data available'));
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          success: (response) {
                            return OnProcessDocumentDataCard(
                                responseModel: response);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
