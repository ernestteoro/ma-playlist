
class AuthResponse{
  String username;
  String token;
  AuthResponse({required this.username, required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      username: json['username'],
      token: json['token']
    );
  }
}