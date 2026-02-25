class TopLevelCategoriesListModel {
  final int id;
  final String image;
  final String name;
  final String? type;
  final DateTime createdAt;

  TopLevelCategoriesListModel({
    required this.id,
    required this.image,
    required this.name,
    this.type,
    required this.createdAt,
  });

  factory TopLevelCategoriesListModel.fromJson(Map<String, dynamic> json) {
    return TopLevelCategoriesListModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      type: json['type'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'type': type,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
