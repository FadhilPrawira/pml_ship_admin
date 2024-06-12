import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../core/constants/routes.dart';
import '../../bloc/conferenceData/approvedConferenceData/approved_conference_data_bloc.dart';
import '../../bloc/conferenceData/pendingConferenceData/pending_conference_data_bloc.dart';
import '../../bloc/conferenceData/rejectedConferenceData/rejected_conference_data_bloc.dart';

class ConferenceDataPage extends StatefulWidget {
  const ConferenceDataPage({super.key});

  @override
  State<ConferenceDataPage> createState() => _ConferenceDataPageState();
}

class _ConferenceDataPageState extends State<ConferenceDataPage> {
  @override
  void initState() {
    context
        .read<PendingConferenceDataBloc>()
        .add(const PendingConferenceDataEvent.getAllPendingConference());
    context
        .read<ApprovedConferenceDataBloc>()
        .add(const ApprovedConferenceDataEvent.getAllApprovedConference());
    context
        .read<RejectedConferenceDataBloc>()
        .add(const RejectedConferenceDataEvent.getRejectedCustomerData());
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
          title: const Text('Conference Data'),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocBuilder<PendingConferenceDataBloc, PendingConferenceDataState>(
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
                        final conferenceData = response.data[index];
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
                              Text(conferenceData.createdAt.toString(),
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 12.0)),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        conferenceData.companyName,
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: medium, fontSize: 18.0),
                                      ),
                                      // Text(
                                      //   conferenceData.companyName,
                                      //   style: primaryTextStyle.copyWith(
                                      //       fontWeight: bold, fontSize: 18.0),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button.filled(
                                    width: 180,
                                    onPressed: () {
                                      // To navigate to VerifyConferenceDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyConference,
                                        arguments: conferenceData.transactionId,
                                      );
                                    },
                                    label: 'Conference Detail',
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
            BlocBuilder<ApprovedConferenceDataBloc,
                ApprovedConferenceDataState>(
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
                        final conferenceData = response.data[index];
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
                                  conferenceData.conferenceApprovedAt != null
                                      ? conferenceData.conferenceApprovedAt!
                                          .toString()
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
                                        conferenceData.companyName,
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
                                    width: 180,
                                    onPressed: () {
                                      // To navigate to VerifyConferenceDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyConference,
                                        arguments: conferenceData.transactionId,
                                      );
                                    },
                                    label: 'Conference Detail',
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
            BlocBuilder<RejectedConferenceDataBloc,
                RejectedConferenceDataState>(
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
                        final conferenceData = response.data[index];
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
                                  conferenceData.conferenceRejectedAt != null
                                      ? conferenceData.conferenceRejectedAt!
                                          .toString()
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
                                        conferenceData.companyName,
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
                                    width: 180,
                                    onPressed: () {
                                      // To navigate to VerifyConferenceDataPage
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.verifyConference,
                                        arguments: conferenceData.transactionId,
                                      );
                                    },
                                    label: 'Conference Detail',
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
