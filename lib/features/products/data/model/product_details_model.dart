import 'list_products_model.dart';

class ProductDetailsModel {
  final int id;
  final String image;
  final List<GalleryModel> gallery;
  final String name;
  final String price;
  final String description;
  final int visitsCount;
  final double reviewsAvgRating;
  final String category;
  final String? latitude;
  final String? longitude;
  final LocationModel location;
  final CountryModel country;
  final StateModel state;
  final CityModel city;
  final String createdAt;
  final ProductMerchantModel merchant;
  final MerchantInfoModel merchantInfo;

  ProductDetailsModel({
    required this.id,
    required this.image,
    required this.gallery,
    required this.name,
    required this.price,
    required this.description,
    required this.visitsCount,
    required this.reviewsAvgRating,
    required this.category,
    this.latitude,
    this.longitude,
    required this.location,
    required this.country,
    required this.state,
    required this.city,
    required this.createdAt,
    required this.merchant,
    required this.merchantInfo,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'] as Map<String, dynamic>?;
    final merchantInfo = json['merchant_info'] as Map<String, dynamic>?;

    if (product == null) throw Exception('product is null');

    return ProductDetailsModel(
      id: product['id'],
      image: product['image'] ?? '',
      gallery: (product['gallery'] as List? ?? [])
          .map((e) => GalleryModel.fromJson(e))
          .toList(),
      name: product['name'] ?? '',
      price: product['price'] ?? '',
      description: product['description'] ?? '',
      visitsCount: product['visits_count'] ?? 0,
      reviewsAvgRating: (product['reviews_avg_rating'] ?? 0).toDouble(),
      category: product['category'] ?? '',
      latitude: product['latitude']?.toString(),
      longitude: product['longitude']?.toString(),
      location: LocationModel.fromJson(product['location']),
      country: CountryModel.fromJson(product['country']),
      state: StateModel.fromJson(product['state']),
      city: CityModel.fromJson(product['city']),
      createdAt: product['created_at'] ?? '',
      merchant: product['merchant'] is Map<String, dynamic>
          ? ProductMerchantModel.fromJson(product['merchant'])
          : ProductMerchantModel(firstName: '', lastName: ''),
      // لو "No merchant"
      merchantInfo: merchantInfo != null
          ? MerchantInfoModel.fromJson(merchantInfo)
          : MerchantInfoModel(merchantId: 0, merchantPhone: ''),
    );
  }
}

class ProductMerchantModel {
  final String firstName;
  final String lastName;

  ProductMerchantModel({
    required this.firstName,
    required this.lastName,
  });

  factory ProductMerchantModel.fromJson(Map<String, dynamic> json) =>
      ProductMerchantModel(
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
      );
}

class MerchantInfoModel {
  final int merchantId;
  final String merchantPhone;

  MerchantInfoModel({
    required this.merchantId,
    required this.merchantPhone,
  });

  factory MerchantInfoModel.fromJson(Map<String, dynamic> json) =>
      MerchantInfoModel(
        merchantId: json['merchant_id'] ?? 0,
        merchantPhone: json['merchant_phone'] ?? '',
      );
}
