import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles.dart';
import '../../../data/models/request/approve_user_or_conference_request_model.dart';
import '../../../data/models/request/reject_user_or_conference_request_model.dart';
import '../../bloc/conferenceData/approveConference/approve_conference_bloc.dart';
import '../../bloc/conferenceData/detailConference/detail_conference_bloc.dart';
import '../../bloc/conferenceData/rejectConference/reject_conference_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Text(
            'Verify Conference Data',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      ),
      body: BlocBuilder<DetailConferenceBloc, DetailConferenceState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: Text('Error'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            success: (conference) {
              return ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Text(
                      'Conference Info',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction ID',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.transactionId,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conference method',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.conferenceType,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conference Location',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.location,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conference Time',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  '${conference.data.conferenceDate.toIso8601String()} ${conference.data.conferenceTime}',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company Name',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.companyName,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Text(
                      'Order Info',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipper',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.shipperName,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Consignee',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.consigneeName,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Route',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  '${conference.data.portOfLoadingName} to ${conference.data.portOfDischargeName}',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Company Address
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Loading',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.dateOfLoading
                                      .toIso8601String(),
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Discharge',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 16.0,
                                ),
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
                                  conference.data.dateOfDischarge
                                      .toIso8601String(),
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocListener<RejectConferenceBloc,
                            RejectConferenceState>(
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
                                    content: Text(
                                        'Conference with ${conference.data.companyName} rejected successfully'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: TextButton(
                            onPressed: () {
                              final dataRequest =
                                  RejectUserOrConferenceRequestModel(
                                rejectedDate: DateTime.now(),
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
                        ),
                        BlocListener<ApproveConferenceBloc,
                            ApproveConferenceState>(
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
                                    content: Text(
                                        'Conference with ${conference.data.companyName} approved successfully'),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pop(context);
                              },
                            );
                          },
                          child: TextButton(
                            onPressed: () {
                              final dataRequest =
                                  ApproveUserOrConferenceRequestModel(
                                approvedDate: DateTime.now(),
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
                                  color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
