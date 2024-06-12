import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/routes.dart';
import 'data/datasource/auth_local_datasource.dart';
import 'data/datasource/auth_remote_datasource.dart';
import 'data/datasource/conference_remote_datasource.dart';
import 'data/datasource/user_remote_datasource.dart';
import 'presentation/bloc/conferenceData/approveConference/approve_conference_bloc.dart';
import 'presentation/bloc/customerData/approveUser/approve_user_bloc.dart';
import 'presentation/bloc/conferenceData/approvedConferenceData/approved_conference_data_bloc.dart';
import 'presentation/bloc/customerData/approvedCustomerData/approved_customer_data_bloc.dart';
import 'presentation/bloc/conferenceData/detailConference/detail_conference_bloc.dart';
import 'presentation/bloc/login/login_bloc.dart';
import 'presentation/bloc/logout/logout_bloc.dart';
import 'presentation/bloc/conferenceData/pendingConferenceData/pending_conference_data_bloc.dart';
import 'presentation/bloc/customerData/pendingCustomerData/pending_customer_data_bloc.dart';
import 'presentation/bloc/customerData/profileAndDetailCustomer/profile_and_detail_customer_bloc.dart';
import 'presentation/bloc/conferenceData/rejectConference/reject_conference_bloc.dart';
import 'presentation/bloc/customerData/rejectUser/reject_user_bloc.dart';
import 'presentation/bloc/conferenceData/rejectedConferenceData/rejected_conference_data_bloc.dart';
import 'presentation/bloc/customerData/rejectedCustomerData/rejected_customer_data_bloc.dart';
import 'presentation/main_page.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/conference_data/conference_data_page.dart';
import 'presentation/pages/conference_data/verify_conference_data.dart';
import 'presentation/pages/customer_data/customer_data_page.dart';
import 'presentation/pages/customer_data/verify_customer_data.dart';
import 'presentation/pages/document/customer_document_data_page.dart';
import 'presentation/pages/document/payment_data_page.dart';
import 'presentation/pages/onboarding/splash_page.dart';
import 'presentation/pages/order_data_page.dart';

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
          create: (context) =>
              ProfileAndDetailCustomerBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ApprovedCustomerDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RejectedCustomerDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PendingCustomerDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ApproveUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RejectUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PendingConferenceDataBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              ApprovedConferenceDataBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              RejectedConferenceDataBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              DetailConferenceBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              ApproveConferenceBloc(ConferenceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              RejectConferenceBloc(ConferenceRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
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
        routes: {
          AppRoutes.splashPage: (context) => const SplashPage(),
          AppRoutes.signIn: (context) => const SignInPage(),
          '/mainpage': (context) => const MainPage(),
          AppRoutes.customerData: (context) => const CustomerDataPage(),
          AppRoutes.documentData: (context) => const CustomerDocumentDataPage(),
          AppRoutes.orderData: (context) => const OrderDataPage(),
          AppRoutes.paymentData: (context) => const PaymentDataPage(),
          AppRoutes.conferenceData: (context) => const ConferenceDataPage(),
          AppRoutes.verifyCustomer: (context) {
            // Ensure arguments are passed and not null
            final args = ModalRoute.of(context)!.settings.arguments;
            if (args is int) {
              return VerifyCustomerDataPage(userId: args);
            }
            return const Scaffold(
              body: Center(
                child: Text('Invalid user ID'),
              ),
            );
          },
          AppRoutes.verifyConference: (context) {
            // Ensure arguments are passed and not null
            final args = ModalRoute.of(context)!.settings.arguments;
            if (args is String) {
              return VerifyConferenceData(transactionId: args);
            }
            return const Scaffold(
              body: Center(
                child: Text('Invalid transaction ID'),
              ),
            );
          },
        },
      ),
    );
  }
}
