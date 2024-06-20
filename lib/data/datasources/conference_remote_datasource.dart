import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_conference_request_model.dart';
import '../models/request/reject_user_or_conference_request_model.dart';
import '../models/response/conference_response_model.dart';
import '../models/response/get_all_status_conference_response_model.dart';
import '../models/response/update_user_or_conference_status_response_model.dart';
import 'auth_local_datasource.dart';

class ConferenceRemoteDatasource {
  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllPendingConference() async {
    final url = Uri.parse('${Variables.baseUrl}/api/pendingConferences');
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
    log("resposen pendingConferences: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending conferences');
    }
  }

  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllApprovedConference() async {
    final url = Uri.parse('${Variables.baseUrl}/api/approvedConferences');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen approvedConferences: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all approved conferences');
    }
  }

  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllRejectedConference() async {
    final url = Uri.parse('${Variables.baseUrl}/api/rejectedConferences');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected conferences');
    }
  }

  Future<Either<String, ConferenceResponseModel>> getFullConferenceData(
      String transactionId) async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/conferences/$transactionId');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(ConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get conference detail');
    }
  }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>>
      approveConference(
          ApproveUserOrConferenceRequestModel
              approveUserOrConferenceRequestModel,
          String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse(
        '${Variables.baseUrl}/api/conferences/$transactionId/approve');
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

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>>
      rejectConference(
          RejectUserOrConferenceRequestModel rejectUserOrConferenceRequestModel,
          String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/conferences/$transactionId/reject');
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
      return const Left('Update conference status error.');
    }
  }
}
