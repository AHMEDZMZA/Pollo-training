class ChangePasswordResponseModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String username;
  final String image;
  final double reviewsAvgRating;
  final String createdAt;

  ChangePasswordResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.username,
    required this.image,
    required this.reviewsAvgRating,
    required this.createdAt,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponseModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
      username: json['username'],
      image: json['image'],
      reviewsAvgRating: (json['reviews_avg_rating'] as num).toDouble(),
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'username': username,
      'image': image,
      'reviews_avg_rating': reviewsAvgRating,
      'created_at': createdAt,
    };
  }
}