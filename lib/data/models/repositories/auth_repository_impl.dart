import 'package:apexbiotics/data/models/auth/login_request.dart';
import 'package:dio/dio.dart';

import '../../../ core/errors/exceptions.dart';
import '../../../ core/network/network_info.dart';
import '../../../domain/entities/auth/registration_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../datasources/remote/auth_api.dart';
import '../auth/registration_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authApi,
    required this.networkInfo,
  });

  @override
  Future<RegistrationEntity> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    if (!await networkInfo.isConnected) {
      throw NetworkException('No internet connection');
    }

    try {
      final response = await authApi.register(
        RegistrationRequest(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
        ),
      );
      return RegistrationEntity(
        id: response.id,
        name: response.name,
        email: response.email,
      );
    } on RegistrationException catch (e) {
      throw RegistrationException(e.message);
    }
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      throw NetworkException('No internet connection');
    }

    try {
      await authApi.login(LoginRequest(email: email, password: password));
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Login failed',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
