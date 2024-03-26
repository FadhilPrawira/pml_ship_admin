import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pml_ship_admin/theme.dart';
import 'package:pml_ship_admin/widgets/customer_data_card.dart';

class CustomerDataPage extends StatelessWidget {
  const CustomerDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
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
                  text: 'Finished',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ],
            ),
            title: const Text('Customer Data'),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  // Add multiple instances of CustomerDataCard() here
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  // Add more CustomerDataCard() widgets as needed
                ],
              ),
              ListView(
                children: <Widget>[
                  // Add multiple instances of CustomerDataCard() here
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  // Add more CustomerDataCard() widgets as needed
                ],
              ),
              ListView(
                children: <Widget>[
                  // Add multiple instances of CustomerDataCard() here
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  CustomerDataCard(),
                  // Add more CustomerDataCard() widgets as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
