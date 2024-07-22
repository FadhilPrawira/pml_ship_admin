import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/conference_remote_datasource.dart';
import 'data/datasources/document_remote_datasource.dart';
import 'data/datasources/order_remote_datasource.dart';
import 'data/datasources/payment_remote_datasource.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/home/bloc/conference_data/conference_data_bloc.dart';
import 'presentation/home/bloc/customer_data/customer_data_bloc.dart';
import 'presentation/home/bloc/customer_detail/customer_detail_bloc.dart';
import 'presentation/home/bloc/detail_conference/detail_conference_bloc.dart';
import 'presentation/home/bloc/documentData/document_data_bloc.dart';
import 'presentation/home/bloc/order_data/order_data_bloc.dart';
import 'presentation/home/bloc/order_detail/order_detail_bloc.dart';
import 'presentation/home/bloc/payment_data/payment_data_bloc.dart';
import 'presentation/home/bloc/uploadDocument/upload_document_bloc.dart';
import 'presentation/home/bloc/verify_conference_data/verify_conference_data_bloc.dart';
import 'presentation/home/bloc/verify_customer_data/verify_customer_data_bloc.dart';
import 'presentation/home/bloc/verify_order_data/verify_order_data_bloc.dart';
import 'presentation/home/bloc/verify_payment_data/verify_payment_data_bloc.dart';
import 'presentation/home/pages/main_page.dart';
import 'presentation/onboarding/pages/splash_page.dart';
import 'presentation/profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CustomerDetailBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CustomerDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => VerifyCustomerDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ConferenceDataBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              DetailConferenceBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              VerifyConferenceDataBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => VerifyOrderDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DocumentDataBloc(DocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UploadDocumentBloc(DocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PaymentDataBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => VerifyPaymentDataBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetAuthenticatedUserBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: AppColors.primaryColor,
          dividerTheme: const DividerThemeData(color: AppColors.divider),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.blue,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
          ),
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDataSource().isAuthDataExists(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const MainPage();
              } else {
                return const SplashPage();
              }
            }
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          },
        ),
      ),
    );
  }
}
