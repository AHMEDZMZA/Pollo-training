import 'package:dio/dio.dart';

class ProfileRequestModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPassword;
  final String? image;


  ProfileRequestModel({
     this.firstName,
     this.lastName,
     this.email,
    this.phone,
     this.password,
     this.confirmPassword,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      if (firstName != null && firstName!.isNotEmpty) 'first_name': firstName,
      if (lastName != null && lastName!.isNotEmpty) 'last_name': lastName,
      if (email != null && email!.isNotEmpty) 'email': email,
      if (phone != null && phone!.isNotEmpty) 'phone': phone,
      if (password != null && password!.isNotEmpty) 'password': password,
      if (confirmPassword != null && confirmPassword!.isNotEmpty) 'password_confirmation': confirmPassword,
      if (image != null && image!.isNotEmpty) 'image': image,
    };
  }


  Future<FormData> toFormData() async {
    final map = <String, dynamic>{};

    if (email != null && email!.isNotEmpty) map['email'] = email;
    if (phone != null && phone!.isNotEmpty) map['phone'] = phone;
    if (image != null && image!.isNotEmpty) {
      map['image'] = await MultipartFile.fromFile(
        image!,
        filename: image!.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}
