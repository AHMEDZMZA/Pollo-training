class LoginRequestModel {
  final String identifier;
  final String password;

  LoginRequestModel({required this.identifier, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'password': password,
    };
  }
}
