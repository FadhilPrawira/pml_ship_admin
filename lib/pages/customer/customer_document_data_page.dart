import 'package:flutter/material.dart';

import 'package:pml_ship_admin/widgets/document_data_card/on_process_document_data_card.dart';
import 'package:pml_ship_admin/widgets/document_data_card/received_document_data_card.dart';
import 'package:pml_ship_admin/widgets/document_data_card/verified_document_data_card.dart';
import 'package:pml_ship_admin/widgets/document_data_card/rejected_document_data_card.dart';

import 'package:pml_ship_admin/widgets/search_bar.dart';

class CustomerDocumentDataPage extends StatelessWidget {
  const CustomerDocumentDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
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
                  text: 'Received',
                ),
                Tab(
                  text: 'Verified',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ],
            ),
            title: const Text('Customer Document Data'),
          ),
          body: TabBarView(
            children: <Widget>[
              // OnProcessTab
              ListView(
                children: <Widget>[
                  SearchBarWidget(
                      customHintText: 'Search by ID Order/Type of Document',
                      customPadding: 10.0),

                  // Add multiple instances of OnProcessDocumentDataCard() here
                  OnProcessDocumentDataCard(documentType: 1),
                  OnProcessDocumentDataCard(documentType: 2),
                  OnProcessDocumentDataCard(documentType: 3),
                  OnProcessDocumentDataCard(documentType: 4),

                  // Add more OnProcessDocumentDataCard() widgets as needed
                ],
              ),
              // ReceivedTab
              ListView(
                children: <Widget>[
                  SearchBarWidget(
                      customHintText: 'Search by ID Order/Type of Document',
                      customPadding: 10.0),
                  // Add multiple instances of ReceivedDocumentDataCard() here
                  ReceivedDocumentDataCard(documentType: 1),
                  ReceivedDocumentDataCard(documentType: 2),
                  ReceivedDocumentDataCard(documentType: 3),

                  // Add more ReceivedDocumentDataCard() widgets as needed
                ],
              ),
              // VerifiedTab
              ListView(
                children: <Widget>[
                  SearchBarWidget(
                      customHintText: 'Search by ID Order/Type of Document',
                      customPadding: 10.0),
                  // Add multiple instances of VerifiedDocumentDataCard() here
                  VerifiedDocumentDataCard(documentType: 1),
                  VerifiedDocumentDataCard(documentType: 2),
                  VerifiedDocumentDataCard(documentType: 3),

                  // Add more VerifiedDocumentDataCard() widgets as needed
                ],
              ),
              // RejectedTab
              ListView(
                children: <Widget>[
                  SearchBarWidget(
                      customHintText: 'Search by ID Order/Type of Document',
                      customPadding: 10.0),
                  // Add multiple instances of RejectedDocumentDataCard() here
                  RejectedDocumentDataCard(),
                  RejectedDocumentDataCard(),

                  // Add more RejectedDocumentDataCard() widgets as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
