import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../models/response/update_order_status_response_model.dart';
import '../models/request/reject_user_or_order_or_conference_request_model.dart';
import '../models/response/order_response_model.dart';

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_order_or_conference_request_model.dart';
import '../models/response/get_all_status_order_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> getFullOrderData(
      String transactionId) async {
    final url = Uri.parse('${Variables.baseUrl}/api/orders/$transactionId');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    });
    log("Request URL: $url");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get order data');
    }
  }

  Future<Either<String, UpdateOrderStatusResponseModel>> approveOrder(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
      String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders/$transactionId/approve');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: approveUserOrOrderOrConferenceRequestModel.toJson(),
    );
    // Log url

    log("request: ${approveUserOrOrderOrConferenceRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UpdateOrderStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update order status error.');
    }
  }

  Future<Either<String, UpdateOrderStatusResponseModel>> rejectOrder(
      RejectUserOrOrderOrConferenceRequestModel
          rejectUserOrOrderOrConferenceRequestModel,
      String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders/$transactionId/reject');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: rejectUserOrOrderOrConferenceRequestModel.toJson(),
    );
    // Log url

    log("request: ${rejectUserOrOrderOrConferenceRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UpdateOrderStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update order status error.');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPendingOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_pending');
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnProcessOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_process');
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
    log("Request URL: $url");
    log("Request Headers: ${headers.toString()}");

    log("resposen: ${response.statusCode}");
    log("resposen onProcess: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPaymentPendingOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=payment_pending');
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnShippingOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_shipping');
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all on shipping orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCompletedOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_completed');
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
    log("Request URL: $url");
    log("Request Headers: ${headers.toString()}");

    log("resposen: ${response.statusCode}");
    log("resposen pendingOrders: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all completed orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCanceledOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_canceled');
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all canceled orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllRejectedOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_rejected');
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected orders');
    }
  }
}
