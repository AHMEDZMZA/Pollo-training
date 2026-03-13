class ProfileResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String? phone;
  final String email;
  final String? username;
  final String image;
  final double reviewsAvgRating;
  final String createdAt;

  const ProfileResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.email,
    this.username,
    required this.image,
    required this.reviewsAvgRating,
    required this.createdAt,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    final merchant = json['merchant'] ?? json;
    return ProfileResponse(
      id: merchant['id'],
      firstName: merchant['first_name'] ?? '',
      lastName: merchant['last_name'] ?? '',
      phone: merchant['phone'],
      email: merchant['email'] ?? '',
      username: merchant['username'],
      image: merchant['image'] ?? '',
      reviewsAvgRating: (merchant['reviews_avg_rating'] ?? 0).toDouble(),
      createdAt: merchant['created_at'] ?? '',
    );
  }
}