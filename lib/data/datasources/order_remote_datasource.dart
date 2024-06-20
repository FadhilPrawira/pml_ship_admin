import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/get_all_status_order_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPendingOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/pendingOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
      return const Left('Failed to get all pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPaymentPendingOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/paymentPendingOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnShippingOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/onShippingOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
      return const Left('Failed to get all on shipping orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCompletedOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/completedOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
    final url = Uri.parse('${Variables.baseUrl}/api/canceledOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
      return const Left('Failed to get all canceled orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllRejectedOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/rejectedOrders');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.token}',
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
      return const Left('Failed to get all rejected orders');
    }
  }
}
