import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/models/response/get_all_status_user_response_model.dart';
import '../../bloc/customer_data/customer_data_bloc.dart';
import 'verify_customer_data.dart';

class CustomerDataPage extends StatefulWidget {
  const CustomerDataPage({super.key});

  @override
  State<CustomerDataPage> createState() => _CustomerDataPageState();
}

class _CustomerDataPageState extends State<CustomerDataPage> {
  void getPendingCustomerData() {
    context
        .read<CustomerDataBloc>()
        .add(const CustomerDataEvent.getPendingCustomerData());
  }

  void getApprovedCustomerData() {
    context
        .read<CustomerDataBloc>()
        .add(const CustomerDataEvent.getApprovedCustomerData());
  }

  void getRejectedCustomerData() {
    context
        .read<CustomerDataBloc>()
        .add(const CustomerDataEvent.getRejectedCustomerData());
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
              buildCustomerDataTab<CustomerDataBloc, CustomerDataState>(
                context.read<CustomerDataBloc>(),
                getPendingCustomerData,
              ),
              buildCustomerDataTab<CustomerDataBloc, CustomerDataState>(
                context.read<CustomerDataBloc>(),
                getApprovedCustomerData,
              ),
              buildCustomerDataTab<CustomerDataBloc, CustomerDataState>(
                context.read<CustomerDataBloc>(),
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
            return const Center(child: Text('No data available'));
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (response) {
            // if (response.data.isEmpty) {
            //   return const Center(child: Text('No Data Available'));
            // }
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
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                // Show the date based on the status. Display the createdAt date if the status is pending, approvedAt date if the status is approved, and rejectedAt date if the status is rejected. If the status is none of the above, display the createdAt date.
                userData.status == 'pending'
                    ? 'Created at : ${userData.createdAt.toIso8601String()}'
                    : userData.status == 'approved'
                        ? 'Approved at : ${userData.approvedAt!.toIso8601String()}'
                        : userData.status == 'rejected'
                            ? 'Rejected at : ${userData.rejectedAt!.toIso8601String()}'
                            : 'Created at : ${userData.createdAt.toIso8601String()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
              Text(
                userData.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              Text(
                userData.company.companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 150,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyCustomerDataPage(
                            userId: userData.user.id,
                            refreshData: refreshData,
                          ),
                        ),
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
