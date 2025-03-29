import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:apexbiotics/domain/entities/auth/registration_entity.dart';

import '../../../domain/ usecases/auth/register_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUseCase registerUseCase;

  RegistrationBloc({required this.registerUseCase})
      : super(const RegistrationState()) {
    on<RegisterUser>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(
      RegisterUser event,
      Emitter<RegistrationState> emit,
      ) async {
    // Set loading state
    emit(state.copyWith(
      status: RegistrationStatus.loading,
      error: '',
    ));

    try {
      final registration = await registerUseCase.call(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );

      // Success state with registration data
      emit(state.copyWith(
        status: RegistrationStatus.success,
        registration: registration,
      ));
    } catch (e) {
      // Failure state with error
      emit(state.copyWith(
        status: RegistrationStatus.failure,
        error: e.toString(),
      ));
    }
  }
}