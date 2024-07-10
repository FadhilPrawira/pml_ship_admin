import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_order_or_conference_request_model.dart';
import '../models/request/reject_user_or_order_or_conference_request_model.dart';
import '../models/response/get_all_payments_response_model.dart';
import '../models/response/update_payment_status_response_model.dart';
import 'auth_local_datasource.dart';

class PaymentRemoteDatasource {
  Future<Either<String, GetAllPaymentsResponseModel>>
      getAllPendingPayments() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=pending');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );
    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending payments');
    }
  }

  Future<Either<String, GetAllPaymentsResponseModel>>
      getAllApprovedPayments() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=approved');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );
    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all approved payments');
    }
  }

  Future<Either<String, GetAllPaymentsResponseModel>>
      getAllRejectedPayments() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=rejected');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected payments');
    }
  }

  Future<Either<String, UpdatePaymentStatusResponseModel>> approvePayment(
      ApproveUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url =
        Uri.parse('${Variables.baseUrl}/api/payments/$transactionId/approve');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: requestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdatePaymentStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }

  Future<Either<String, UpdatePaymentStatusResponseModel>> rejectPayment(
      RejectUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url =
        Uri.parse('${Variables.baseUrl}/api/payments/$transactionId/reject');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: requestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdatePaymentStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Reject payment status error.');
    }
  }
}
