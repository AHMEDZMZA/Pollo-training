class SubCategoryModel {
  final int id;
  final String image;
  final String name;
  final String? type;
  final DateTime createdAt;

  const SubCategoryModel({
    required this.id,
    required this.image,
    required this.name,
    this.type,
    required this.createdAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}