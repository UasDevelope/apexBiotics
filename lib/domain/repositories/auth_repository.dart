import '../entities/auth/registration_entity.dart';

abstract class AuthRepository {
  Future<RegistrationEntity> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
// ... other methods
}