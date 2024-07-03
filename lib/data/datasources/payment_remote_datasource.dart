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
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=pending');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
// Log the request
    // log("Request URL: $url");
    // log("Request Headers: ${headers.toString()}");

    // log("resposen: ${response.statusCode}");
    // log("resposen pendingOrders: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending payments');
    }
  }

  Future<Either<String, GetAllPaymentsResponseModel>>
      getAllApprovedPayments() async {
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=approved');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
// Log the request
    // log("Request URL: $url");
    // log("Request Headers: ${headers.toString()}");

    // log("resposen: ${response.statusCode}");
    // log("resposen pendingOrders: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all approved payments');
    }
  }

  Future<Either<String, GetAllPaymentsResponseModel>>
      getAllRejectedPayments() async {
    final url = Uri.parse('${Variables.baseUrl}/api/payments?status=rejected');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
// Log the request
    // log("Request URL: $url");
    // log("Request Headers: ${headers.toString()}");

    // log("resposen: ${response.statusCode}");
    // log("resposen pendingOrders: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllPaymentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected payments');
    }
  }

  Future<Either<String, UpdatePaymentStatusResponseModel>> approvePayment(
      ApproveUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/payments/$transactionId/approve');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestModel.toJson(),
    );
    // Log url

    log("request: ${requestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UpdatePaymentStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }

  Future<Either<String, UpdatePaymentStatusResponseModel>> rejectPayment(
      RejectUserOrOrderOrConferenceRequestModel requestModel,
      String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/payments/$transactionId/reject');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestModel.toJson(),
    );
    // Log url

    log("request: ${requestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UpdatePaymentStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Reject payment status error.');
    }
  }
}
