import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/routes.dart';
import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/models/response/get_all_status_user_response_model.dart';
import '../../bloc/customerData/approvedCustomerData/approved_customer_data_bloc.dart';
import '../../bloc/customerData/pendingCustomerData/pending_customer_data_bloc.dart';
import '../../bloc/customerData/rejectedCustomerData/rejected_customer_data_bloc.dart';

class CustomerDataPage extends StatefulWidget {
  const CustomerDataPage({super.key});

  @override
  State<CustomerDataPage> createState() => _CustomerDataPageState();
}

class _CustomerDataPageState extends State<CustomerDataPage> {
  void getPendingCustomerData() {
    context
        .read<PendingCustomerDataBloc>()
        .add(const PendingCustomerDataEvent.getPendingCustomerData());
  }

  void getApprovedCustomerData() {
    context
        .read<ApprovedCustomerDataBloc>()
        .add(const ApprovedCustomerDataEvent.getApprovedCustomerData());
  }

  void getRejectedCustomerData() {
    context
        .read<RejectedCustomerDataBloc>()
        .add(const RejectedCustomerDataEvent.getRejectedCustomerData());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPendingCustomerData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Customer Data'),
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              onTap: (index) {
                if (index == 0) {
                  getPendingCustomerData();
                } else if (index == 1) {
                  getApprovedCustomerData();
                } else if (index == 2) {
                  getRejectedCustomerData();
                }
              },
              tabs: const [
                Tab(text: 'On Process'),
                Tab(text: 'Finished'),
                Tab(text: 'Rejected'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildCustomerDataTab<PendingCustomerDataBloc,
                  PendingCustomerDataState>(
                context.read<PendingCustomerDataBloc>(),
                getPendingCustomerData,
              ),
              buildCustomerDataTab<ApprovedCustomerDataBloc,
                  ApprovedCustomerDataState>(
                context.read<ApprovedCustomerDataBloc>(),
                getApprovedCustomerData,
              ),
              buildCustomerDataTab<RejectedCustomerDataBloc,
                  RejectedCustomerDataState>(
                context.read<RejectedCustomerDataBloc>(),
                getRejectedCustomerData,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomerDataTab<BlocType extends BlocBase<StateType>, StateType>(
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
            return buildCustomerDataItem(
              response,
              fetchData,
            );
          },
        );
      },
    );
  }

  ListView buildCustomerDataItem(
    GetAllStatusUserResponseModel response,
    VoidCallback refreshData,
  ) {
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                userData.createdAt.toFormattedIndonesianLongDateAndUTC7Time(),
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12.0,
                ),
              ),
              Text(
                userData.name,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18.0,
                ),
              ),
              Text(
                userData.companyName,
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 150,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verifyCustomer,
                        arguments: {
                          'userId': userData.id,
                          'refreshData': refreshData,
                        },
                      );
                    },
                    label: 'Customer Detail',
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
