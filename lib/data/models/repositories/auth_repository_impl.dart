import '../../../ core/errors/exceptions.dart';
import '../../../domain/entities/auth/registration_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../datasources/remote/auth_api.dart';

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
}