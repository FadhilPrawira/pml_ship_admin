import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_conference_request_model.dart';
import '../models/request/reject_user_or_conference_request_model.dart';
import '../models/response/get_all_status_user_response_model.dart';
import '../models/response/update_user_or_conference_status_response_model.dart';
import '../models/response/user_response_model.dart';
import 'auth_local_datasource.dart';

class UserRemoteDatasource {
  Future<Either<String, UserResponseModel>> getFullUserData(int userId) async {
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get user data');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>> getAllUser() async {
    final url = Uri.parse('${Variables.baseUrl}/api/users');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllPendingUser() async {
    final url = Uri.parse('${Variables.baseUrl}/api/pendingUsers');
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
    // log("Request URL: $url");
    // log("Request Headers: ${headers.toString()}");

    // log("resposen: ${response.statusCode}");
    // log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllApprovedUser() async {
    final url = Uri.parse('${Variables.baseUrl}/api/approvedUsers');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all user');
    }
  }

  Future<Either<String, GetAllStatusUserResponseModel>>
      getAllRejectedUser() async {
    final url = Uri.parse('${Variables.baseUrl}/api/rejectedUsers');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusUserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all user');
    }
  }

  // Future<Either<String, UserResponseModel>> downloadDocument(
  //     String filename) async {
  //   final url = Uri.parse('${Variables.baseUrl}/storage/documents/$filename');
  //   // http://10.105.246.227:8000/storage/documents/TRX1717142358-shipping_instruction.pdf
  //   final authData = await AuthLocalDataSource().getAuthData();
  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer ${authData.token}',
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
      ApproveUserOrConferenceRequestModel approveUserOrConferenceRequestModel,
      int userId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId/approve');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: approveUserOrConferenceRequestModel.toJson(),
    );
    // Log url

    log("request: ${approveUserOrConferenceRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(
          UpdateUserOrConferenceStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>> rejectUser(
      RejectUserOrConferenceRequestModel rejectUserOrConferenceRequestModel,
      int userId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/users/$userId/reject');
    final response = await http.patch(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: rejectUserOrConferenceRequestModel.toJson(),
    );
    // Log url

    log("request: ${rejectUserOrConferenceRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(
          UpdateUserOrConferenceStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }
}
