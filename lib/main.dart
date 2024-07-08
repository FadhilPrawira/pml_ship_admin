import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/payment_remote_datasource.dart';
import 'presentation/home/bloc/orderData/approveOrderData/approve_order_data_bloc.dart';
import 'presentation/home/bloc/orderData/onProcessOrdersData/on_process_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/rejectOrderData/reject_order_data_bloc.dart';

import 'core/core.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/conference_remote_datasource.dart';
import 'data/datasources/document_remote_datasource.dart';
import 'data/datasources/order_remote_datasource.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'presentation/home/bloc/conferenceData/approveConference/approve_conference_bloc.dart';
import 'presentation/home/bloc/conferenceData/approvedConferenceData/approved_conference_data_bloc.dart';
import 'presentation/home/bloc/conferenceData/detailConference/detail_conference_bloc.dart';
import 'presentation/home/bloc/conferenceData/pendingConferenceData/pending_conference_data_bloc.dart';
import 'presentation/home/bloc/conferenceData/rejectConference/reject_conference_bloc.dart';
import 'presentation/home/bloc/conferenceData/rejectedConferenceData/rejected_conference_data_bloc.dart';
import 'presentation/home/bloc/customerData/approveUser/approve_user_bloc.dart';
import 'presentation/home/bloc/customerData/approvedCustomerData/approved_customer_data_bloc.dart';
import 'presentation/home/bloc/customerData/pendingCustomerData/pending_customer_data_bloc.dart';
import 'presentation/home/bloc/customerData/profileAndDetailCustomer/profile_and_detail_customer_bloc.dart';
import 'presentation/home/bloc/customerData/rejectUser/reject_user_bloc.dart';
import 'presentation/home/bloc/customerData/rejectedCustomerData/rejected_customer_data_bloc.dart';
import 'presentation/home/bloc/documentData/document_data_bloc.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/bloc/orderData/OnShippingOrdersData/on_shipping_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/canceledOrdersData/canceled_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/completedOrdersData/completed_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/detailOrderData/detail_order_data_bloc.dart';
import 'presentation/home/bloc/orderData/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/pendingOrdersData/pending_orders_data_bloc.dart';
import 'presentation/home/bloc/orderData/rejectedOrdersData/rejected_orders_data_bloc.dart';
import 'presentation/home/bloc/paymentData/approvePayment/approve_payment_bloc.dart';
import 'presentation/home/bloc/paymentData/approvedPaymentData/approved_payment_data_bloc.dart';
import 'presentation/home/bloc/paymentData/pendingPaymentData/pending_payment_data_bloc.dart';
import 'presentation/home/bloc/paymentData/rejectPayment/reject_payment_bloc.dart';
import 'presentation/home/bloc/paymentData/rejectedPaymentData/rejected_payment_data_bloc.dart';
import 'presentation/home/bloc/uploadDocument/upload_document_bloc.dart';
import 'presentation/home/pages/main_page.dart';
import 'presentation/auth/pages/sign_in_page.dart';
import 'presentation/home/pages/conference_data/conference_data_page.dart';
import 'presentation/home/pages/conference_data/verify_conference_data.dart';
import 'presentation/home/pages/customer_data/customer_data_page.dart';
import 'presentation/home/pages/customer_data/verify_customer_data.dart';
import 'presentation/home/pages/document/customer_document_data_page.dart';
import 'presentation/home/pages/document/document_list_page.dart';
import 'presentation/home/pages/payment/payment_data_page.dart';
import 'presentation/home/pages/document/upload_document_page.dart';
import 'presentation/onboarding/pages/splash_page.dart';
import 'presentation/home/pages/order_data/order_data_page.dart';
import 'presentation/home/pages/order_data/verify_order_data_page.dart';

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
        BlocProvider(
          create: (context) => PendingOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PaymentPendingOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              OnShippingOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CompletedOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CanceledOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RejectedOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DetailOrderDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ApproveOrderDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RejectOrderDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DocumentDataBloc(DocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OnProcessOrdersDataBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UploadDocumentBloc(DocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              ApprovedPaymentDataBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              RejectedPaymentDataBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PendingPaymentDataBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ApprovePaymentBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RejectPaymentBloc(PaymentRemoteDatasource()),
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
          AppRoutes.documentList: (context) {
            final args = ModalRoute.of(context)!.settings.arguments;
            return DocumentListPage(
              transactionId: args as String,
            );
          },
          AppRoutes.uploadDocument: (context) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            return UploadDocumentPage(
              documentType: args['documentType'] as String,
              transactionId: args['transactionId'] as String,
            );
          },
          AppRoutes.orderData: (context) => const OrderDataPage(),
          AppRoutes.paymentData: (context) => const PaymentDataPage(),
          AppRoutes.conferenceData: (context) => const ConferenceDataPage(),
          AppRoutes.verifyCustomer: (context) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            if (args.containsKey('userId') && args['userId'] is int) {
              final userId = args['userId'] as int;
              final refreshData = args['refreshData'] as Function;

              return VerifyCustomerDataPage(
                userId: userId,
                refreshData: refreshData,
              );
            }
            return const Scaffold(
              body: Center(
                child: Text('Invalid arguments'),
              ),
            );
          },
          AppRoutes.verifyConference: (context) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            if (args.containsKey('transactionId') &&
                args['transactionId'] is String) {
              final transactionId = args['transactionId'] as String;
              final refreshData = args['refreshData'] as Function;

              return VerifyConferenceData(
                transactionId: transactionId,
                refreshData: refreshData,
              );
            }
            return const Scaffold(
              body: Center(
                child: Text('Invalid arguments'),
              ),
            );
          },
          AppRoutes.verifyOrder: (context) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            if (args.containsKey('transactionId') &&
                args['transactionId'] is String) {
              final transactionId = args['transactionId'] as String;
              final refreshData = args['refreshData'] as Function;

              return VerifyOrderDataPage(
                transactionId: transactionId,
                refreshData: refreshData,
              );
            }
            return const Scaffold(
              body: Center(
                child: Text('Invalid arguments'),
              ),
            );
          },
        },
      ),
    );
  }
}
