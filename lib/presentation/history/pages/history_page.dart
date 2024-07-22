import 'package:flutter/material.dart';

import '../widgets/finished_history_card.dart';
import '../widgets/on_process_history_card.dart';
import '../widgets/rejected_history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(
                text: 'Waiting',
              ),
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
          title: const Text('History'),
        ),
        body: TabBarView(
          children: <Widget>[
            // Waiting TAB
            ListView(
              children: const <Widget>[
                // Add multiple instances of OnProcessHistoryCard() here
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                // Add more OnProcessHistoryCard() widgets as needed
              ],
            ),

// ======================

            ListView(
              children: const <Widget>[
                // Add multiple instances of OnProcessHistoryCard() here
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                OnProcessHistoryCard(),
                // Add more OnProcessHistoryCard() widgets as needed
              ],
            ),
            ListView(
              children: const <Widget>[
                // Add multiple instances of FinishedHistoryCard() here
                FinishedHistoryCard(),
                FinishedHistoryCard(),
                FinishedHistoryCard(),
                FinishedHistoryCard(),
                FinishedHistoryCard(),
                // Add more FinishedHistoryCard() widgets as needed
              ],
            ),
            ListView(
              children: const <Widget>[
                // Add multiple instances of RejectedHistoryCard() here
                RejectedHistoryCard(),
                RejectedHistoryCard(),
                RejectedHistoryCard(),
                RejectedHistoryCard(),
                RejectedHistoryCard(),
                // Add more RejectedHistoryCard() widgets as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
