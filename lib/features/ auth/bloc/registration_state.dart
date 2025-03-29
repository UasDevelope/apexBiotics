part of 'registration_bloc.dart';

enum RegistrationStatus { initial, loading, success, failure }

class RegistrationState extends Equatable {
  final RegistrationStatus status;
  final RegistrationEntity? registration;
  final String error;

  const RegistrationState({
    this.status = RegistrationStatus.initial,
    this.registration,
    this.error = '',
  });

  // Add copyWith method
  RegistrationState copyWith({
    RegistrationStatus? status,
    RegistrationEntity? registration,
    String? error,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      registration: registration ?? this.registration,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, registration, error];
}