import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/styles.dart';
import '../../../../data/models/response/get_all_status_conference_response_model.dart';
import '../../bloc/conferenceData/approvedConferenceData/approved_conference_data_bloc.dart';
import '../../bloc/conferenceData/pendingConferenceData/pending_conference_data_bloc.dart';
import '../../bloc/conferenceData/rejectedConferenceData/rejected_conference_data_bloc.dart';

class ConferenceDataPage extends StatefulWidget {
  const ConferenceDataPage({super.key});

  @override
  State<ConferenceDataPage> createState() => _ConferenceDataPageState();
}

class _ConferenceDataPageState extends State<ConferenceDataPage> {
  void getAllPendingConference() {
    context
        .read<PendingConferenceDataBloc>()
        .add(const PendingConferenceDataEvent.getAllPendingConference());
  }

  void getAllApprovedConference() {
    context
        .read<ApprovedConferenceDataBloc>()
        .add(const ApprovedConferenceDataEvent.getAllApprovedConference());
  }

  void getAllRejectedConference() {
    context
        .read<RejectedConferenceDataBloc>()
        .add(const RejectedConferenceDataEvent.getRejectedCustomerData());
  }

  @override
  void initState() {
    super.initState();
    // Trigger the initial data load for the first tab.
    // Adjust this to load data for all tabs or a specific tab based on your app's needs.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPendingConference();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              onTap: (index) {
                if (index == 0) {
                  log('Tab index: $index');
                  getAllPendingConference();
                } else if (index == 1) {
                  log('Tab index: $index');
                  getAllApprovedConference();
                } else if (index == 2) {
                  log('Tab index: $index');
                  getAllRejectedConference();
                }
              },
              tabs: const [
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
              buildConferenceDataTab<PendingConferenceDataBloc,
                  PendingConferenceDataState>(
                context.read<PendingConferenceDataBloc>(),
                getAllPendingConference,
              ),
              buildConferenceDataTab<ApprovedConferenceDataBloc,
                  ApprovedConferenceDataState>(
                context.read<ApprovedConferenceDataBloc>(),
                getAllApprovedConference,
              ),
              buildConferenceDataTab<RejectedConferenceDataBloc,
                  RejectedConferenceDataState>(
                context.read<RejectedConferenceDataBloc>(),
                getAllRejectedConference,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget
      buildConferenceDataTab<BlocType extends BlocBase<StateType>, StateType>(
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
            if (response.data.isEmpty) {
              return const Center(child: Text('No Data Available'));
            }
            return buildConferenceDataItem(
              response,
              fetchData,
            );
          },
        );
      },
    );
  }

  ListView buildConferenceDataItem(
    GetAllStatusConferenceResponseModel response,
    VoidCallback refreshData,
  ) {
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
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                conferenceData.createdAt.toIso8601String(),
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 12.0),
              ),
              Text(
                conferenceData.conference.companyName,
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.filled(
                    width: 180,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verifyConference,
                        arguments: {
                          'transactionId': conferenceData.transactionId,
                          'refreshData': refreshData,
                        },
                      );
                    },
                    label: 'Conference Detail',
                    fontSize: 12,
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
