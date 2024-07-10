import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_order_or_conference_request_model.dart';
import '../models/request/reject_user_or_order_or_conference_request_model.dart';
import '../models/response/get_all_status_order_response_model.dart';
import '../models/response/order_detail_response_model.dart';
import '../models/response/update_order_status_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderDetailResponseModel>> getFullOrderData(
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
    final url = Uri.parse('${Variables.baseUrl}/api/orders/$transactionId');

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
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get order data');
    }
  }

  Future<Either<String, UpdateOrderStatusResponseModel>> approveOrder(
      ApproveUserOrOrderOrConferenceRequestModel
          approveUserOrOrderOrConferenceRequestModel,
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
        Uri.parse('${Variables.baseUrl}/api/orders/$transactionId/approve');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: approveUserOrOrderOrConferenceRequestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

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
        Uri.parse('${Variables.baseUrl}/api/orders/$transactionId/reject');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: rejectUserOrOrderOrConferenceRequestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdateOrderStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update order status error.');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPendingOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_pending');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnProcessOrders() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_process');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPaymentPendingOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=payment_pending');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnShippingOrders() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_shipping');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all on shipping orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCompletedOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_completed');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all completed orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCanceledOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_canceled');

    //  Send the request
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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all canceled orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllRejectedOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_rejected');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected orders');
    }
  }
}
