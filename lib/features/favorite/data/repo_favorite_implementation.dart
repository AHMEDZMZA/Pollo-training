import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/favorite/data/model/favorite_response_model.dart';
import 'package:pollo/features/favorite/data/repo_favorite.dart';

import '../../../core/networking/api_endpoints.dart';

class RepoFavoriteImplementation implements RepoFavorite {
  final ApiClient apiClient;

  RepoFavoriteImplementation({required this.apiClient});

  @override
  Future<Either<Failure, FavoriteResponseModelStoreAndDelete>>
      storeFavoriteProduct(int id) {
    return apiClient.request<FavoriteResponseModelStoreAndDelete>(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.wishlistCreate,
        body: {'product_id': id},
        response: (json) => FavoriteResponseModelStoreAndDelete.fromJson(json));
  }

  @override
  Future<Either<Failure, FavoriteResponseModelStoreAndDelete>>
      deleteFavoriteProduct(int id) {
    return apiClient.request<FavoriteResponseModelStoreAndDelete>(
        method: ApiMethods.DELETE,
        endpoint: ApiEndpoints.wishlistsDestroy(id),
        response: (json) => FavoriteResponseModelStoreAndDelete.fromJson(json));
  }

  @override
  Future<Either<Failure, List<WishlistModel>>> getFavoriteProducts() {
    return apiClient.request<List<WishlistModel>>(
      method: ApiMethods.GET,
      endpoint: ApiEndpoints.wishlistList,
      response: (json) {
        final data = json['data'] as List;
        return data.map((e) => WishlistModel.fromJson(e)).toList();
      },
    );
  }
}
