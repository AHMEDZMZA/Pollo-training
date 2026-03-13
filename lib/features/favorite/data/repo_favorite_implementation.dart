import 'package:dartz/dartz.dart';
import 'package:pollo/core/networking/api_client.dart';
import 'package:pollo/core/networking/api_failure.dart';
import 'package:pollo/features/favorite/data/model/favorite_model.dart';
import 'package:pollo/features/favorite/data/repo_favorite.dart';

import '../../../core/networking/api_endpoints.dart';

class RepoFavoriteImplementation implements RepoFavorite {
  final ApiClient apiClient;

  RepoFavoriteImplementation({required this.apiClient});

  @override
  Future<Either<Failure, FavoriteModel>> likeProduct(int id) {
    return apiClient.request<FavoriteModel>(
        method: ApiMethods.POST,
        endpoint: ApiEndpoints.productsLike(id),
        response: (json) => FavoriteModel.fromJson(json));
  }
}
