import 'package:flutter/material.dart';
import 'package:pml_ship_admin/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                // padding: EdgeInsets.only(top: 300.0),
                margin: EdgeInsets.only(top: 50.0),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image_logo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            //title PML SHIP (Admin)
            Text(
              'PML SHIP (Admin)',
              // textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text(
            'Login',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16.0,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              // Spacer(),
              // footer(),
            ],
          ),
        ),
      ),
    );
  }
}
