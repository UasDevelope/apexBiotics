import 'package:dio/dio.dart';
import 'package:apexbiotics/data/models/auth/registration_request.dart';
import 'package:apexbiotics/data/models/auth/registration_response.dart';

import '../../../ core/constants/api_constants.dart';
import '../../../ core/errors/exceptions.dart';

abstract class AuthApi {
  Future<RegistrationResponse> register(RegistrationRequest request);
}

class AuthApiImpl implements AuthApi {
  final Dio dio;

  AuthApiImpl({required this.dio});

  @override
  Future<RegistrationResponse> register(RegistrationRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );
      return RegistrationResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw RegistrationException(
        e.response?.data['message'] ?? 'Registration failed',
      );
    }
  }
}