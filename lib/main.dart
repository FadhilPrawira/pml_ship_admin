import 'package:flutter/material.dart';
import 'package:pml_ship_admin/pages/customer/customer_data_page.dart';
import 'package:pml_ship_admin/pages/customer/customer_document_data_page.dart';
import 'package:pml_ship_admin/pages/document/bill_of_lading_page.dart';
import 'package:pml_ship_admin/pages/document/cargo_manifest_page.dart';
import 'package:pml_ship_admin/pages/document/time_sheet_page.dart';
// import 'package:pml_ship_admin/pages/document_data_page.txt';
import 'package:pml_ship_admin/pages/home/main_page.dart';
// import 'package:pml_ship_admin/pages/map_page.txt';
import 'package:pml_ship_admin/pages/order_data_page.dart';
import 'package:pml_ship_admin/pages/customer/payment_data_page.dart';
import 'package:pml_ship_admin/pages/shipping_instruction_data.dart';
import 'package:pml_ship_admin/pages/sign_in_page.dart';
import 'package:pml_ship_admin/pages/splash_page.dart';
import 'package:pml_ship_admin/pages/customer/verify_customer_data.dart';
import 'package:pml_ship_admin/pages/view_rating_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => MapPage(),
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/home': (context) => MainPage(),
        '/customer-data': (context) => CustomerDataPage(),
        '/document-data': (context) => CustomerDocumentDataPage(),
        '/order-data': (context) => OrderDataPage(),
        '/payment-data': (context) => PaymentDataPage(),
        // '/verify-customer': (context) => VerifyCustomerDataPage(),
      },
    );
  }
}
