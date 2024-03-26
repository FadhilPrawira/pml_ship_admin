import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pml_ship_admin/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 124.0, //Didapat dari Figma
        titleSpacing:
            0, //Untuk menghilangkan padding dari leading (leading = biasanya berupa tombol back)
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/image_profile_example.jpg'),
                radius: 30.0,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Budi Susanto',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'budisusanto@gmail.com',
                      style: subtitleTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signOutButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0, bottom: defaultMargin),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          },
          style: TextButton.styleFrom(
            backgroundColor: Color(0xffFF0000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text(
            'Logout',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16.0,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'My Contact Info',
              //   style: primaryTextStyle.copyWith(
              //     fontWeight: semiBold,
              //     fontSize: 16.0,
              //   ),
              // ),
              Text(
                'Email Address',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
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
                  'budisusanto@gmail.com',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12.0,
                  ),
                ),
              ),

              SizedBox(
                height: 11.0,
              ),
              Text(
                'Phone',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
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
                  '0812-3456-7890',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12.0,
                  ),
                ),
              ),
              signOutButton(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
