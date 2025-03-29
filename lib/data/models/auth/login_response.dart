class LoginResponse {
  final String token;
  final String userId;
  final String email;

  LoginResponse({
    required this.token,
    required this.userId,
    required this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      userId: json['user_id'],
      email: json['email'],
    );
  }
}