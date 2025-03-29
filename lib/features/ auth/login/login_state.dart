part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String error;

  const LoginState({
    this.status = LoginStatus.initial,
    this.error = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, error];
}