import 'package:flutter/material.dart';

import '../../../core/styles.dart';
import '../../history/pages/history_page.dart';
import '../../profile/pages/profile_page.dart';
import 'home_admin_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return SizedBox(
        height: 100,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.only(),
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              iconSize: 30.0,
              // selectedLabelStyle:
              //     primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
              // unselectedLabelStyle: TextStyle(fontSize: 22),
              backgroundColor: backgroundColor1,
              currentIndex: currentIndex,
              onTap: (value) {
                // print(value);
                setState(
                  () {
                    currentIndex = value;
                  },
                );
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 5.0,
                    ),
                    child: Icon(
                      Icons.home_outlined,
                      color: currentIndex == 0 ? secondaryColor : subtitleColor,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 5.0,
                      ),
                      child: Icon(
                        Icons.format_list_bulleted,
                        color:
                            currentIndex == 1 ? secondaryColor : subtitleColor,
                      )),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 5.0,
                    ),
                    child: Icon(
                      Icons.person,
                      color: currentIndex == 2 ? secondaryColor : subtitleColor,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomeAdminPage();

        case 1:
          return const HistoryPage();

        case 2:
          return const ProfilePage();

        default:
          return const HomeAdminPage();
      }
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: customBottomNav(),
        body: body(),
      ),
    );
  }
}
