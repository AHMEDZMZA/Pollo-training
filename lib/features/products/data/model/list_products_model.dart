class ListProductsModel {
  final int id;
  final String image;
  final List<GalleryModel> gallery;
  final String name;
  final String price;
  final String description;
  final String removeAt;
  final CategoryModel category;
  final CountryModel country;
  final StateModel state;
  final CityModel city;
  final LocationModel location;
  final String createdAt;
  final MerchantModel? merchant;
  final String? latitude;
  final String? longitude;

  ListProductsModel({
    required this.id,
    required this.image,
    required this.gallery,
    required this.name,
    required this.price,
    required this.description,
    required this.removeAt,
    required this.merchant,
    required this.category,
    required this.country,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.createdAt,
  });

  factory ListProductsModel.fromJson(Map<String, dynamic> json) =>
      ListProductsModel(
        id: json['id'],
        image: json['image'] ?? '',
        gallery: (json['gallery'] as List)
            .map((e) => GalleryModel.fromJson(e))
            .toList(),
        name: json['name'] ?? '',
        price: json['price'] ?? '',
        description: json['description'] ?? '',
        removeAt: json['remove_at'] ?? '',
        merchant: json['merchant'] != null
            ? MerchantModel.fromJson(json['merchant'])
            : null,
        category: CategoryModel.fromJson(json['category']),
        country: CountryModel.fromJson(json['country']),
        state: StateModel.fromJson(json['state']),
        city: CityModel.fromJson(json['city']),
        latitude: json['latitude'],
        longitude: json['longitude'],
        location: LocationModel.fromJson(json['location']),
        createdAt: json['created_at'] ?? '',
      );
}

class GalleryModel {
  final int id;
  final String url;

  GalleryModel({required this.id, required this.url});

  factory GalleryModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return GalleryModel(
        id: json['id'] ?? 0,
        url: json['url']?.toString() ?? '',
      );
    }
    return GalleryModel(id: 0, url: '');
  }
}

class MerchantModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? phone;
  final String email;
  final String username;
  final String image;
  final double reviewsAvgRating;
  final String createdAt;

  MerchantModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.email,
    required this.username,
    required this.image,
    required this.reviewsAvgRating,
    required this.createdAt,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) => MerchantModel(
        id: json['id'],
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        phone: json['phone'],
        email: json['email'] ?? '',
        username: json['username'] ?? '',
        image: json['image'] ?? '',
        reviewsAvgRating: (json['reviews_avg_rating'] ?? 0).toDouble(),
        createdAt: json['created_at'] ?? '',
      );
}

class CategoryModel {
  final int id;
  final String image;
  final String name;
  final String createdAt;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        image: json['image'] ?? '',
        name: json['name'] ?? '',
        createdAt: json['created_at'] ?? '',
      );
}

class CountryModel {
  final int id;
  final String name;
  final String code;
  final String currencyCode;
  final String emoji;

  CountryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.currencyCode,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json['id'],
        name: json['name'] ?? '',
        code: json['code'] ?? '',
        currencyCode: json['currency_code'] ?? '',
        emoji: json['emoji'] ?? '',
      );
}

class StateModel {
  final int id;
  final String name;

  StateModel({required this.id, required this.name});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      StateModel(id: json['id'], name: json['name'] ?? '');
}

class CityModel {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      CityModel(id: json['id'], name: json['name'] ?? '');
}

class LocationModel {
  final String lat;
  final String lng;

  LocationModel({required this.lat, required this.lng});

  factory LocationModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return LocationModel(
        lat: json['lat']?.toString() ?? '',
        lng: json['lng']?.toString() ?? '',
      );
    }
    return LocationModel(lat: '', lng: '');
  }
}
