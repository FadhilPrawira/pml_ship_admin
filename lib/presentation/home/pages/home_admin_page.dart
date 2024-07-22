import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../../profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import 'conference_data/conference_data_page.dart';
import 'customer_data/customer_data_page.dart';
import 'document/customer_document_data_page.dart';
import 'order_data/order_data_page.dart';
import 'payment/payment_data_page.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  User? user;
  @override
  void initState() {
    context
        .read<GetAuthenticatedUserBloc>()
        .add(const GetAuthenticatedUserEvent.getAuthenticatedUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(Assets.image.imageProfileExample.path),
              radius: 30.0,
            ),
            const SpaceWidth(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  BlocBuilder<GetAuthenticatedUserBloc,
                      GetAuthenticatedUserState>(
                    builder: (context, state) {
                      String? name = '';
                      state.maybeWhen(
                        orElse: () {},
                        loaded: (user) {
                          name = user.data?.user!.name!;
                        },
                      );
                      return Text(
                        '$name',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      );
                    },
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
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
      );
    }

    Widget updatesCard() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xffDBEFEF),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PT PAMA Order Vessel jenis Mother Vessel dengan rute Taboneo - Samarinda ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                SpaceHeight(10),
                Text(
                  '30 minutes ago',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget dashboardCard() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
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
                    const Text(
                      'Sales',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Assets.icon.iconLoading.image(
                      height: 30.0,
                      width: 30.0,
                    ),
                    const Text(
                      '70 %',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rp10.000.000.000,00',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
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
        padding: const EdgeInsets.only(top: 30.0),
        // Contain all of this part into one row
        child: Column(
          children: [
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerDataPage()));
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
                        child: const Icon(
                          Icons.person,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Customer Data'),
                    ],
                  ),
                ),
                const SpaceHeight(30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDataPage(),
                      ),
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
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: AppColors.primaryColor,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerDocumentDataPage(),
                      ),
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
                        child: const Icon(
                          Icons.description,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Document'),
                    ],
                  ),
                ),
                const SpaceHeight(30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentDataPage(),
                      ),
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
                        child: const Icon(
                          Icons.account_balance_wallet,
                          size: 30,
                          color: AppColors.primaryColor,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConferenceDataPage(),
                      ),
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
                        child: const Icon(
                          Icons.group,
                          size: 30,
                          color: AppColors.primaryColor,
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
        //   customPadding: 30.0,
        // ),
        // sectionTitle('Dashboard'),
        // dashboardCard(),
        // sectionTitle('Updates'),
        const Column(
          children: [
            // updatesCard(),
            // updatesCard(),
            // updatesCard(),
          ],
        ),

        /// I dont know what to named this part [customData]
        customData(),

        const SpaceHeight(30),
      ],
    );
  }
}
