import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles.dart';
import '../../../../data/models/request/approve_user_or_order_or_conference_request_model.dart';
import '../../../../data/models/request/reject_user_or_order_or_conference_request_model.dart';
import '../../bloc/conferenceData/approveConference/approve_conference_bloc.dart';
import '../../bloc/conferenceData/detailConference/detail_conference_bloc.dart';
import '../../bloc/conferenceData/rejectConference/reject_conference_bloc.dart';
import '../../../../data/models/response/conference_response_model.dart';

class VerifyPaymentData extends StatefulWidget {
  final String transactionId;
  final Function refreshData;
  const VerifyPaymentData({
    super.key,
    required this.transactionId,
    required this.refreshData,
  });

  @override
  State<VerifyPaymentData> createState() => _VerifyPaymentDataState();
}

class _VerifyPaymentDataState extends State<VerifyPaymentData> {
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
          backgroundColor: backgroundColor1,
          title: const Text(
            'Verify Conference Data',
          ),
          titleTextStyle:
              primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
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
            conference.data.order.loading.date.toIso8601String()),
        buildInfoItem('Date of Discharge',
            conference.data.order.discharge.date.toIso8601String()),
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

  BlocListener<ApproveConferenceBloc, ApproveConferenceState>
      buildApproveButton(String companyName) {
    return BlocListener<ApproveConferenceBloc, ApproveConferenceState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Conference with $companyName approved successfully'),
                backgroundColor: Colors.green,
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
          context.read<ApproveConferenceBloc>().add(
                ApproveConferenceEvent.approveConference(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: verifyCheck,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Verify',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16.0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  BlocListener<RejectConferenceBloc, RejectConferenceState> buildRejectButton(
      String companyName) {
    return BlocListener<RejectConferenceBloc, RejectConferenceState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Conference with $companyName rejected successfully'),
                backgroundColor: Colors.green,
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
          context.read<RejectConferenceBloc>().add(
                RejectConferenceEvent.rejectConference(
                  dataRequest,
                  widget.transactionId,
                ),
              );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Reject',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16.0,
            color: primaryColor,
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
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
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
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
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
        style: primaryTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
