import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/routes.dart';
import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../bloc/customerData/approvedCustomerData/approved_customer_data_bloc.dart';
import '../../bloc/customerData/pendingCustomerData/pending_customer_data_bloc.dart';
import '../../bloc/customerData/rejectedCustomerData/rejected_customer_data_bloc.dart';

class CustomerDataPage extends StatefulWidget {
  const CustomerDataPage({super.key});

  @override
  State<CustomerDataPage> createState() => _CustomerDataPageState();
}

class _CustomerDataPageState extends State<CustomerDataPage> {
  @override
  void initState() {
    context
        .read<PendingCustomerDataBloc>()
        .add(const PendingCustomerDataEvent.getPendingCustomerData());
    context
        .read<ApprovedCustomerDataBloc>()
        .add(const ApprovedCustomerDataEvent.getApprovedCustomerData());
    context
        .read<RejectedCustomerDataBloc>()
        .add(const RejectedCustomerDataEvent.getRejectedCustomerData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(
            tabs: [
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
          title: const Text('Customer Data'),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocBuilder<PendingCustomerDataBloc, PendingCustomerDataState>(
              builder: (context, state) {
                return state.maybeWhen(
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
                    return ListView.builder(
                      itemCount: response.data.length,
                      itemBuilder: (context, index) {
                        final userData = response.data[index];
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
                            mainAxisSize:
                                MainAxisSize.min, // Set mainAxisSize to min
                            children: [
                              Text(
                                  userData.createdAt
                                      .toFormattedIndonesianLongDateAndUTC7Time(),
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 12.0)),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.name,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 18.0),
                                      ),
                                      Text(
                                        userData.companyName,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button.filled(
                                    width: 170,
                                    onPressed: () {
                                      // To navigate to VerifyCustomerDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyCustomer,
                                        arguments: userData.id,
                                      );
                                    },
                                    label: 'Customer Detail',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<ApprovedCustomerDataBloc, ApprovedCustomerDataState>(
              builder: (context, state) {
                return state.maybeWhen(
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
                    return ListView.builder(
                      itemCount: response.data.length,
                      itemBuilder: (context, index) {
                        final userData = response.data[index];
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
                            mainAxisSize:
                                MainAxisSize.min, // Set mainAxisSize to min
                            children: [
                              Text(
                                  userData.approvedDate != null
                                      ? userData.approvedDate!
                                          .toFormattedIndonesianLongDateAndUTC7Time()
                                      : 'N/A',
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 12.0)),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.name,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 18.0),
                                      ),
                                      Text(
                                        userData.companyName,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button.filled(
                                    width: 170,
                                    onPressed: () {
                                      // To navigate to VerifyCustomerDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyCustomer,
                                        arguments: userData.id,
                                      );
                                    },
                                    label: 'Customer Detail',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            BlocBuilder<RejectedCustomerDataBloc, RejectedCustomerDataState>(
              builder: (context, state) {
                return state.maybeWhen(
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
                    return ListView.builder(
                      itemCount: response.data.length,
                      itemBuilder: (context, index) {
                        final userData = response.data[index];
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
                            mainAxisSize:
                                MainAxisSize.min, // Set mainAxisSize to min
                            children: [
                              Text(
                                  userData.rejectedDate != null
                                      ? userData.rejectedDate!
                                          .toFormattedIndonesianLongDateAndUTC7Time()
                                      : 'N/A',
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 12.0)),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.name,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 18.0),
                                      ),
                                      Text(
                                        userData.companyName,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button.filled(
                                    width: 170,
                                    onPressed: () {
                                      // To navigate to VerifyCustomerDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyCustomer,
                                        arguments: userData.id,
                                      );
                                    },
                                    label: 'Customer Detail',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
