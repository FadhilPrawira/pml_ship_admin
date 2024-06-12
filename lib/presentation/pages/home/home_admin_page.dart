import 'package:flutter/material.dart';

import '../../../core/constants/routes.dart';
import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../../data/models/response/auth_response_model.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  User? user;
  @override
  void initState() {
    AuthLocalDataSource().getAuthData().then((value) {
      setState(() {
        user = value.data;
      });
    });
    super.initState();
  }

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
                  AssetImage(Assets.image.imageProfileExample.path),
              radius: 30.0,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    user?.name ?? '',
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
          margin: const EdgeInsets.only(top: 10),
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xffDBEFEF),
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
                const SizedBox(
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
          margin: const EdgeInsets.only(top: 10),
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xffDBEFEF),
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
                    Assets.icon.iconLoading.image(
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
                    const Text('Last 24 Hours'),
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
        child: Column(
          children: [
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.customerData,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Customer Data'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.orderData,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Order Data'),
                    ],
                  ),
                ),
              ],
            ),
            // Second Column
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.documentData,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Document'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.paymentData,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Payment'),
                    ],
                  ),
                ),
              ],
            ),
            // Conference
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.conferenceData,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.group,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Conference'),
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
        // SearchBarWidget(
        //   customHintText: 'Search...',
        //   customPadding: defaultMargin,
        // ),
        // sectionTitle('Dashboard'),
        // dashboardCard(),
        // sectionTitle('Updates'),
        Column(
          children: [
            // updatesCard(),
            // updatesCard(),
            // updatesCard(),
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
