import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/auth_response_model.dart';
import '../models/response/user_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/login');

    // Send the request
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    // Log the request
    log('Request: ${jsonEncode({
          'email': email,
          'password': password,
        })}');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Left(AuthResponseModel.fromJson(response.body).message!);
    } else if (response.statusCode == 500) {
      return const Left('Server error. Please try again later.');
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, bool>> logout() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/logout');

    // Send the request
    final response = await http.delete(
      url,
      headers: headers,
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, UserResponseModel>> getAuthenticatedUserDetail() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/user');

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
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
