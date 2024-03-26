import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pml_ship_admin/theme.dart';
import 'package:pml_ship_admin/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/image_profile_example.jpg'),
              radius: 30.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Budi Susanto',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

    Widget updatesCard() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xffDBEFEF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PT PAMA Order Vessel jenis Mother Vessel dengan rute Taboneo - Samarinda ',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '30 minutes ago',
                  style: primaryTextStyle.copyWith(
                      fontWeight: regular, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget dashboardCard() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xffDBEFEF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Sales',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                      ),
                    ),
                    Image.asset(
                      'assets/images/image_loading.png',
                      height: 30.0,
                      width: 30.0,
                    ),
                    Text(
                      '70 %',
                      style: primaryTextStyle.copyWith(
                          fontWeight: regular, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rp10.000.000.000,00',
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text('Last 24 Hours'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget customData() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        // Contain all of this part into one row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // First Row
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/customer-data');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Customer Data'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/order-data');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Order Data'),
                    ],
                  ),
                ),
              ],
            ),
            // Second Column
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/document-data');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Document'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/payment-data');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Payment'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        SearchBarWidget(
          customHintText: 'Search...',
          customPadding: defaultMargin,
        ),
        sectionTitle('Dashboard'),
        dashboardCard(),
        sectionTitle('Updates'),
        Column(
          children: [
            updatesCard(),
            updatesCard(),
            updatesCard(),
          ],
        ),

        /// I dont know what to named this part [customData]
        customData(),
        SizedBox(
          height: defaultMargin,
        )
      ],
    );
  }
}
