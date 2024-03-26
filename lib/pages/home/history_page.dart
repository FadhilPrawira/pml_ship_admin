import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pml_ship_admin/theme.dart';
import 'package:pml_ship_admin/widgets/history_card/on_process_history_card.dart';
import 'package:pml_ship_admin/widgets/history_card/finished_history_card.dart';
import 'package:pml_ship_admin/widgets/history_card/rejected_history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
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
            title: const Text('History'),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
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
                children: <Widget>[
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
                children: <Widget>[
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
      ),
    );
  }
}
