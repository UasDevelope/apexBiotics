import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/ usecases/auth/register_usecase.dart';
import '../../../domain/entities/auth/registration_entity.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUseCase registerUseCase;

  RegistrationBloc({required this.registerUseCase}) : super(const RegistrationState()) {
    on<RegisterUser>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(
      RegisterUser event,
      Emitter<RegistrationState> emit,
      ) async {
    emit(state.copyWith(status: RegistrationStatus.loading));

    try {
      await registerUseCase.call(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );
      emit(state.copyWith(status: RegistrationStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: RegistrationStatus.failure,
        error: e.toString(),
      ));
    }
  }
}