import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/approve_user_or_order_or_conference_request_model.dart';
import '../models/request/reject_user_or_order_or_conference_request_model.dart';
import '../models/response/conference_response_model.dart';
import '../models/response/get_all_status_conference_response_model.dart';
import '../models/response/update_user_or_conference_status_response_model.dart';
import 'auth_local_datasource.dart';

class ConferenceRemoteDatasource {
  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllPendingConference() async {
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
        Uri.parse('${Variables.baseUrl}/api/conferences?status=pending');

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
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending conferences');
    }
  }

  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllApprovedConference() async {
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
        Uri.parse('${Variables.baseUrl}/api/conferences?status=approved');

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
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all approved conferences');
    }
  }

  Future<Either<String, GetAllStatusConferenceResponseModel>>
      getAllRejectedConference() async {
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
        Uri.parse('${Variables.baseUrl}/api/conferences?status=rejected');

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
      return Right(GetAllStatusConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected conferences');
    }
  }

  Future<Either<String, ConferenceResponseModel>> getFullConferenceData(
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
        Uri.parse('${Variables.baseUrl}/api/conferences/$transactionId');

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
      return Right(ConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get conference detail');
    }
  }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>>
      approveConference(
    ApproveUserOrOrderOrConferenceRequestModel requestModel,
    String transactionId,
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
    final url = Uri.parse(
        '${Variables.baseUrl}/api/conferences/$transactionId/approve');

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
      return Right(
          UpdateUserOrConferenceStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Update user status error.');
    }
  }

  Future<Either<String, UpdateUserOrConferenceStatusResponseModel>>
      rejectConference(
    RejectUserOrOrderOrConferenceRequestModel requestModel,
    String transactionId,
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
    final url =
        Uri.parse('${Variables.baseUrl}/api/conferences/$transactionId/reject');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: requestModel.toJson(),
    );
    // Log url

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
      return const Left('Update conference status error.');
    }
  }
}
