import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_order_or_conference_request_model.dart';
import '../models/request/reject_user_or_order_or_conference_request_model.dart';
import '../models/response/get_all_status_user_response_model.dart';
import '../models/response/update_user_or_conference_status_response_model.dart';
import '../models/response/user_response_model.dart';
import 'auth_local_datasource.dart';

class UserRemoteDatasource {
  Future<Either<String, UserResponseModel>> getFullUserData(int userId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId');

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
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get user data');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>> getAllUser() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users');

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
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllPendingUser() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users?status=pending');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // // Log the request
    // log('Request: $headers');
    // log('URL: $url');

    // // Log the response body
    // log('Request: ${response.body}');
    // log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllApprovedUser() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users?status=approved');

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
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all approved user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllRejectedUser() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users?status=rejected');

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
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected user');
    }
  }

  // Future<Either<String, UserResponseModel>> downloadDocument(
  //     String filename) async {
  //   final url = Uri.parse('${Variables.baseUrl}/storage/documents/$filename');
  //   // http://10.105.246.227:8000/storage/documents/TRX1717142358-shipping_instruction.pdf
  //   final authData = await AuthLocalDataSource().getAuthData();
  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer ${authData.data.token}',
  //     'Accept': 'application/json',
  //   });

  //   log("resposen: ${response.statusCode}");
  //   log("resposen: ${response.body}");

  //   if (response.statusCode == 200) {
  //     return Right(UserResponseModel.fromJson(response.body));
  //   } else {
  //     return const Left('Failed to get user data');
  //   }
  // }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>> approveUser(
    ApproveUserOrOrderOrConferenceRequestModel
        approveUserOrConferenceRequestModel,
    int userId,
  ) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId/approve');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: approveUserOrConferenceRequestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(
          UpdateUserOrConferenceStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>> rejectUser(
    RejectUserOrOrderOrConferenceRequestModel
        rejectUserOrOrderOrConferenceRequestModel,
    int userId,
  ) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId/reject');

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
      return Right(
          UpdateUserOrConferenceStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }
}
