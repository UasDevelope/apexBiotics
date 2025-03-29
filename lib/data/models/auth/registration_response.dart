class RegistrationResponse {
  final String id;
  final String name;
  final String email;

  RegistrationResponse({
    required this.id,
    required this.name,
    required this.email,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}