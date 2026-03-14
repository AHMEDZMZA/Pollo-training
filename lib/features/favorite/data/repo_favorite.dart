import 'package:dartz/dartz.dart';
import 'package:pollo/features/favorite/data/model/favorite_response_model.dart';
import '../../../core/networking/api_failure.dart';

abstract class RepoFavorite {
  Future<Either<Failure, FavoriteResponseModelStoreAndDelete>>
      storeFavoriteProduct(int id);

  Future<Either<Failure, FavoriteResponseModelStoreAndDelete>>
      deleteFavoriteProduct(int id);

  Future<Either<Failure, List<WishlistModel>>> getFavoriteProducts();
}
