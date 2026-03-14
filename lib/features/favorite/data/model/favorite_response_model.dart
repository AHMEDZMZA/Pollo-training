import '../../../products/data/model/list_products_model.dart';

/// <---------------------------------------------------------------------------->
/// Favorite Product Model Store And Delete
class FavoriteResponseModelStoreAndDelete {
  final int code;
  final String message;

  FavoriteResponseModelStoreAndDelete({
    required this.code,
    required this.message,
  });

  factory FavoriteResponseModelStoreAndDelete.fromJson(
      Map<String, dynamic> json) {
    return FavoriteResponseModelStoreAndDelete(
      code: json['code'],
      message: json['message'],
    );
  }
}

/// <---------------------------------------------------------------------------->
/// Favorite Product Model List
class WishlistModel {
  final int id;
  final WishlistProductModel product;
  final String createdAt;

  WishlistModel({
    required this.id,
    required this.product,
    required this.createdAt,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json['id'],
        product: WishlistProductModel.fromJson(json['product']),
        createdAt: json['created_at'] ?? '',
      );
}

class WishlistProductModel {
  final int id;
  final String image;
  final List<GalleryModel> gallery;
  final String name;
  final String price;
  final String description;
  final double reviewsAvgRating;
  final String category;
  final String? latitude;
  final String? longitude;
  final LocationModel location;
  final CountryModel country;
  final StateModel state;
  final CityModel city;
  final String createdAt;
  final WishlistMerchantModel? merchant;

  WishlistProductModel({
    required this.id,
    required this.image,
    required this.gallery,
    required this.name,
    required this.price,
    required this.description,
    required this.reviewsAvgRating,
    required this.category,
    this.latitude,
    this.longitude,
    required this.location,
    required this.country,
    required this.state,
    required this.city,
    required this.createdAt,
    this.merchant,
  });

  factory WishlistProductModel.fromJson(Map<String, dynamic> json) =>
      WishlistProductModel(
        id: json['id'],
        image: json['image'] ?? '',
        gallery: (json['gallery'] as List? ?? [])
            .map((e) => GalleryModel.fromJson(e))
            .toList(),
        name: json['name'] ?? '',
        price: json['price'] ?? '',
        description: json['description'] ?? '',
        reviewsAvgRating: (json['reviews_avg_rating'] ?? 0).toDouble(),
        category: json['category'] ?? '',
        latitude: json['latitude']?.toString(),
        longitude: json['longitude']?.toString(),
        location: LocationModel.fromJson(json['location']),
        country: CountryModel.fromJson(json['country']),
        state: StateModel.fromJson(json['state']),
        city: CityModel.fromJson(json['city']),
        createdAt: json['created_at'] ?? '',
        merchant: json['merchant'] is Map<String, dynamic>
            ? WishlistMerchantModel.fromJson(json['merchant'])
            : null,
      );
}

class WishlistMerchantModel {
  final String firstName;
  final String lastName;

  WishlistMerchantModel({
    required this.firstName,
    required this.lastName,
  });

  factory WishlistMerchantModel.fromJson(Map<String, dynamic> json) =>
      WishlistMerchantModel(
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
      );
}
