class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String password;
  final String confirmPassword;

  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      if (phone != null && phone!.isNotEmpty) 'phone': phone,
      "password": password,
      "password_confirmation": confirmPassword,
    };
  }
}
