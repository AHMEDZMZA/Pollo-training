class FavoriteModel {
  final bool success;
  final String status;
  final int likesCount;

  FavoriteModel({
    required this.success,
    required this.status,
    required this.likesCount,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        success: json['success'] ?? false,
        status: json['status'] ?? '',
        likesCount: json['likes_count'] ?? 0,
      );
}
