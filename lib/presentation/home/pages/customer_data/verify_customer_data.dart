import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship_admin/data/datasources/download_file.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/user_response_model.dart';

import '../../bloc/customer_detail/customer_detail_bloc.dart';
import '../../bloc/verify_customer_data/verify_customer_data_bloc.dart';

class VerifyCustomerDataPage extends StatefulWidget {
  final int userId;
  final Function refreshData;

  const VerifyCustomerDataPage({
    super.key,
    required this.userId,
    required this.refreshData,
  });

  @override
  State<VerifyCustomerDataPage> createState() => _VerifyCustomerDataPageState();
}

class _VerifyCustomerDataPageState extends State<VerifyCustomerDataPage> {
  @override
  void initState() {
    context
        .read<CustomerDetailBloc>()
        .add(CustomerDetailEvent.getFullUserData(widget.userId));
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
              'Verify Customer Data',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
        body: BlocConsumer<CustomerDetailBloc, CustomerDetailState>(
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

  ListView buildCustomerDataTab(UserResponseModel user) {
    bool isPending = user.data!.status == 'pending';

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        buildSectionHeader('PIC Info'),
        buildInfoItem('PIC Name', '${user.data!.user!.name}'),
        buildInfoItem('PIC Phone', '${user.data!.user!.phone}'),
        buildInfoItem('PIC Email', '${user.data!.user!.email}'),
        buildSectionHeader('Company Info'),
        buildInfoItem('Company Name', '${user.data!.company!.companyName}'),
        buildInfoItem('Company NPWP', '${user.data!.company!.companyNpwp}'),
        buildInfoItem(
            'Company Address', '${user.data!.company!.companyAddress}'),
        buildInfoItem('Company Phone', '${user.data!.company!.companyPhone}'),
        buildInfoItem('Company Email', '${user.data!.company!.companyEmail}'),
        buildInfoItem('Akta Perusahaan', '${user.data!.company!.companyAkta}'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Button.filled(
            onPressed: () {
              final String urlname =
                  '${Variables.documentURL}${user.data!.company!.companyAkta}';
              log(urlname);
              FileStorage.downloadAndSaveFile(urlname);
            },
            label: 'Download Akta Perusahaan',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Visibility(
            visible: isPending, // Show only if status is 'pending'

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRejectButton('${user.data!.company!.companyName}'),
                buildApproveButton('${user.data!.company!.companyName}'),
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
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
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

  Widget buildRejectButton(String companyName) {
    return BlocListener<VerifyCustomerDataBloc, VerifyCustomerDataState>(
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
              SnackBar(
                content: Text('User $companyName rejected successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
            widget.refreshData();
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = RejectUserOrOrderOrConferenceRequestModel(
            rejectedAt: DateTime.now(),
          );
          context.read<VerifyCustomerDataBloc>().add(
                VerifyCustomerDataEvent.rejectUser(
                  dataRequest,
                  widget.userId,
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

  Widget buildApproveButton(String companyName) {
    return BlocListener<VerifyCustomerDataBloc, VerifyCustomerDataState>(
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
              SnackBar(
                content: Text('User $companyName approved successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
            widget.refreshData();
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = ApproveUserOrOrderOrConferenceRequestModel(
            approvedAt: DateTime.now(),
          );
          context.read<VerifyCustomerDataBloc>().add(
                VerifyCustomerDataEvent.approveUser(
                  dataRequest,
                  widget.userId,
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
