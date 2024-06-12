import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/auth_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('Login failed. Check again your email and password.');
    } else if (response.statusCode == 500) {
      return const Left('Server error. Please try again later.');
    } else {
      return const Left('Login failed. Please try again later.');
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final url = Uri.parse('${Variables.baseUrl}/api/logout');
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer ${authData.token}',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Left('Failed to logout');
      }
    } catch (e) {
      log("Failed: $e");
      return const Left('Failed to logout');
    }
  }
}
