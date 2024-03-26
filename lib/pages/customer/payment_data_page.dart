import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pml_ship_admin/theme.dart';
import 'package:pml_ship_admin/widgets/search_bar.dart';

class PaymentDataPage extends StatelessWidget {
  const PaymentDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Text(
            'Customer Payment Data',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      );
    }

    Widget customFormField(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              margin: EdgeInsets.only(
                right: 16.0,
              ),
              padding: EdgeInsets.symmetric(
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
          ),
        ],
      );
    }

// Fixed Document Rows Structure
    Row documentRow(String labelText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                labelText,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16.0,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          Icon(
            Icons.download,
            color: primaryColor,
          ),
        ],
      );
    }

    Widget paymentData() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2024-02-29'),
                  Text('VO/0250/PML/20'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Putri Ayu Tarra',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Anugrah Lautan Luas, PT',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Payment'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 10.0,
                            ),
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: documentRow(
                              'Nota First Payment'), // Use documentRow function
                        ),
                      ),
                      Text('Second Payment'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 10.0,
                            ),
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: documentRow(
                              'Nota Second Payment'), // Use documentRow function
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Adjuration:',
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: verifyCheck,
                          ),
                          Text('Accepted'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: Color(0xffff0000),
                          ),
                          Text('Rejected'),
                        ],
                      ),
                    ],
                  ),
                  customFormField('Note',
                      'Dear Customer, The nominal payment doesn’t match the bill. Please pay off the remaining payment amount'),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: header(),
        body: ListView(
          children: [
            SearchBarWidget(
              customHintText: 'Search by ID Order/Name/Office/Date',
              customPadding: 10.0,
            ),
            paymentData()
          ],
        ),
      ),
    );
  }
}
