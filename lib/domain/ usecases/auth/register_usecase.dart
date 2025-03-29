import 'package:apexbiotics/domain/repositories/auth_repository.dart';
import 'package:apexbiotics/domain/entities/auth/registration_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<RegistrationEntity> call({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await repository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}