import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pml_ship_admin/theme.dart';

class VerifyCustomerDataPage extends StatelessWidget {
  const VerifyCustomerDataPage({super.key});

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
            'Verify Customer Data',
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

    Widget detailPIC() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              customFormField('PIC Name', 'Putri Ayu Tarra'),
              // Phone
              customFormField('PIC Phone', '081378901736'),
              // Email
              customFormField('PIC Email', 'putriayutarra@gmail.com'),
            ],
          ),
        ),
      );
    }

    Widget detailCompany() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Name
              customFormField('Company Name', 'Anugrah Lautan Luas, PT'),
              // Company Tax Identification Number (TIN)/NPWP
              customFormField('Company Tax Identification Number (TIN)/NPWP',
                  '09.254.294.3-407.000'),
              // Company Address
              customFormField(
                  'Company Address', 'Jl. Medan Merdeka No. 1 Jakarta Pusat'),
              // Company Phone
              customFormField('Company Phone', '(021) 123-456-789'),

              // Company Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Company Email',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'anugrah_lautan_luas_PT.pdf',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 12.0,
                            ),
                          ),
                          Icon(Icons.download),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget sectionTitle(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          text,
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22.0,
          ),
        ),
      );
    }

    Widget rejectOrVerify() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffff0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Reject',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0, color: primaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                //navigator
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
                    fontWeight: medium, fontSize: 16.0, color: primaryColor),
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
            sectionTitle('PIC Info'),
            detailPIC(),
            sectionTitle('Company Name'),
            detailCompany(),
            rejectOrVerify(),
          ],
        ),
      ),
    );
  }
}
