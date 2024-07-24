import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/response/conference_response_model.dart';
import '../../bloc/conference_data/conference_data_bloc.dart';
import '../../bloc/detail_conference/detail_conference_bloc.dart';
import '../../bloc/verify_conference_data/verify_conference_data_bloc.dart';

class VerifyConferenceData extends StatefulWidget {
  final String transactionId;

  const VerifyConferenceData({
    super.key,
    required this.transactionId,
  });

  @override
  State<VerifyConferenceData> createState() => _VerifyConferenceDataState();
}

class _VerifyConferenceDataState extends State<VerifyConferenceData> {
  @override
  void initState() {
    context
        .read<DetailConferenceBloc>()
        .add(DetailConferenceEvent.getFullConferenceData(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Verify Conference Data',
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        body: BlocBuilder<DetailConferenceBloc, DetailConferenceState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(child: Text('Error')),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (conference) => buildConferenceDataTab(conference));
          },
        ),
      ),
    );
  }

  ListView buildConferenceDataTab(ConferenceResponseModel conference) {
    bool isPending = conference.data.status == 'pending';
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        buildSectionHeader('Conference Info'),
        buildInfoItem('Transaction ID', conference.data.transactionId),
        buildInfoItem('Conference method', conference.data.conference.type),
        buildInfoItem('Company Name', conference.data.conference.companyName),
        buildSectionHeader('Order Info'),
        buildInfoItem('Shipper', conference.data.order.shipper.name),
        buildInfoItem('Consignee', conference.data.order.consignee.name),
        buildInfoItem('Route',
            '${conference.data.order.loading.port} to ${conference.data.order.discharge.port}'),
        buildInfoItem('Date of Loading',
            conference.data.order.loading.date.toFormattedIndonesianLongDate()),
        buildInfoItem(
            'Date of Discharge',
            conference.data.order.discharge.date
                .toFormattedIndonesianLongDate()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Visibility(
            visible: isPending,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRejectButton(conference.data.conference.companyName),
                buildApproveButton(conference.data.conference.companyName),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BlocListener<VerifyConferenceDataBloc, VerifyConferenceDataState>
      buildApproveButton(String companyName) {
    return BlocListener<VerifyConferenceDataBloc, VerifyConferenceDataState>(
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
          successApprove: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Conference with $companyName approved successfully'),
                backgroundColor: AppColors.green,
              ),
            );

            Navigator.pop(context);
            context.read<ConferenceDataBloc>().add(
                  const ConferenceDataEvent.getAllPendingConference(),
                );
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = ApproveUserOrOrderOrConferenceRequestModel(
            approvedAt: DateTime.now(),
          );
          context.read<VerifyConferenceDataBloc>().add(
                VerifyConferenceDataEvent.approveConference(
                  dataRequest,
                  widget.transactionId,
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

  BlocListener<VerifyConferenceDataBloc, VerifyConferenceDataState>
      buildRejectButton(String companyName) {
    return BlocListener<VerifyConferenceDataBloc, VerifyConferenceDataState>(
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
          successReject: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Conference with $companyName rejected successfully'),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pop(context);
            context.read<ConferenceDataBloc>().add(
                  const ConferenceDataEvent.getAllPendingConference(),
                );
          },
        );
      },
      child: TextButton(
        onPressed: () {
          final dataRequest = RejectUserOrOrderOrConferenceRequestModel(
            rejectedAt: DateTime.now(),
          );
          context.read<VerifyConferenceDataBloc>().add(
                VerifyConferenceDataEvent.rejectConference(
                  dataRequest,
                  widget.transactionId,
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

  Widget buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
